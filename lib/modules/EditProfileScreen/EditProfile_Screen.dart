import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/components.dart';
import 'package:social_app/Shared/styles/styles.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_states.dart';

class SocialEditProfile extends StatelessWidget {
  SocialEditProfile({Key? key}) : super(key: key);
  var NameController = TextEditingController();
  var BioController = TextEditingController();
  var PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Social_App_cubit, Social_App_States>(
        listener: (context, state) {},
        builder: (context, state) {
          /*var cubit = Social_App_cubit
              .get(context)
              .usermodel;*/
          var profileImage = Social_App_cubit.get(context).profileimage;
          var CoverImage = Social_App_cubit.get(context).Coverimage;
          NameController.text = Social_App_cubit.get(context).usermodel!.name!;
          BioController.text = Social_App_cubit.get(context).usermodel!.bio!;
          PhoneController.text =
              Social_App_cubit.get(context).usermodel!.phone!;
          return Scaffold(
            appBar: AppBarBuilder(
                context: context,
                title: 'Edit Profile',
                titleSpaceing: 5,
                actions: [
                  TextButton(
                      onPressed: () {
                        Social_App_cubit.get(context).UpdateUserData(
                            name: NameController.text,
                            bio: BioController.text,
                            Phone: PhoneController.text);
                      },
                      child: const Text('Update'))
                ]),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  if(state is UpdateUserDataLoadingState ||state is UpdateUserDataCoverImageLoadingState ||state is UpdateUserDataProfileImageLoadingState)
                  LinearProgressIndicator(),
                  if(state is UpdateUserDataLoadingState ||state is UpdateUserDataCoverImageLoadingState ||state is UpdateUserDataProfileImageLoadingState)
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Container(
                                height: 190,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                        image: CoverImage == null
                                            ? NetworkImage(
                                                '${Social_App_cubit.get(context).usermodel!.cover}')
                                            : FileImage(CoverImage)
                                                as ImageProvider,
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            CircleAvatar(
                              radius: 24,
                              child: IconButton(
                                  onPressed: () {
                                    Social_App_cubit.get(context)
                                        .getCoverPhoto();
                                  },
                                  icon: Icon(
                                    IconBroken.Camera,
                                    size: 16,
                                  )),
                            )
                          ],
                        ),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 59,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 55,
                                backgroundImage: profileImage == null
                                    ? NetworkImage(
                                        '${Social_App_cubit.get(context).usermodel!.image}')
                                    : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              child: IconButton(
                                  onPressed: () {
                                    Social_App_cubit.get(context)
                                        .getProfilePhoto();
                                  },
                                  icon: Icon(
                                    IconBroken.Camera,
                                    size: 16,
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if (Social_App_cubit.get(context).profileimage != null ||
                      Social_App_cubit.get(context).Coverimage != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        children: [

                          if (Social_App_cubit.get(context).profileimage !=
                              null)
                            Expanded(
                                child: ElevatedButton(
                                    child: Text(
                                      'Upload Profile Image',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      Social_App_cubit.get(context)
                                          .uploadProfileImage(
                                              name: NameController.text,
                                              bio: BioController.text,
                                              Phone: PhoneController.text);
                                    })
                            ),
                          if (Social_App_cubit.get(context).Coverimage != null ||Social_App_cubit.get(context).profileimage != null)

                            SizedBox(
                              width: 10,
                            ),
                          if (Social_App_cubit.get(context).Coverimage != null)
                            Expanded(
                                child: ElevatedButton(
                                    child: Text(
                                      'Upload Cover Image',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {
                                      Social_App_cubit.get(context)
                                          .uploadCovrerImage(
                                              name: NameController.text,
                                              bio: BioController.text,
                                              Phone: PhoneController.text);
                                    })),

                        ],
                      ),
                    ),
                  if (Social_App_cubit.get(context).profileimage != null ||
                      Social_App_cubit.get(context).Coverimage != null)
                    SizedBox(
                      height: 20,
                    ),
                  defaulTextFormFied(
                      labelText: 'Name',
                      PrefixIcon: IconBroken.User,
                      controller: NameController,
                      keyboard: TextInputType.name,
                      ValidateFunction: (String? value) {
                        if (value!.isEmpty) {
                          return 'Name mustn\'t be empty ';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  defaulTextFormFied(
                      labelText: 'Bio',
                      PrefixIcon: IconBroken.Edit_Square,
                      controller: BioController,
                      keyboard: TextInputType.name,
                      ValidateFunction: (String? value) {
                        if (value!.isEmpty) {
                          return 'Bio mustn\'t be empty ';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  defaulTextFormFied(
                      labelText: 'Phone',
                      PrefixIcon: IconBroken.Call,
                      controller: PhoneController,
                      keyboard: TextInputType.phone,
                      ValidateFunction: (String? value) {
                        if (value!.isEmpty) {
                          return 'Bio mustn\'t be empty ';
                        }
                        return null;
                      })
                ],
              ),
            ),
          );
        });
  }
}
