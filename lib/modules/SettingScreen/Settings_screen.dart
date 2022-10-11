import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/components.dart';
import 'package:social_app/Shared/network/local/cachehelper.dart';
import 'package:social_app/Shared/styles/styles.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_states.dart';
import 'package:social_app/modules/EditProfileScreen/EditProfile_Screen.dart';

class Setting_screen extends StatelessWidget {
   Setting_screen({Key? key}) : super(key: key);
  var Isdark=cashehelper.Getdata(key: 'Isdark')==null?/*true*/false:cashehelper.Getdata(key: 'Isdark');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Social_App_cubit, Social_App_States>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = Social_App_cubit.get(context).usermodel;
        return Padding(
          padding:  EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 200,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(image: NetworkImage(
                                // 'https://scontent.fcai21-4.fna.fbcdn.net/v/t1.6435-9/117816135_2697161233870945_8765598808213195153_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=e3f864&_nc_ohc=syPOHjqIn9MAX_OsTz_&_nc_ht=scontent.fcai21-4.fna&oh=00_AT_Zp3QALboc7V9I3SEnH0Hh6RUleZA9TaSfAzzXoaDjVg&oe=6356C145'),
                                '${cubit!.cover}'),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 54,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            // 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1060&t=st=1664027055~exp=1664027655~hmac=d6fb0595de15853569d0ccdc58af7ebb773546ed58387eb968f464f4c4915a7e'
                            '${cubit.image}'),
                      ),
                    )
                  ],
                ),
              ),
               const SizedBox(
                height: 13,
              ),
              Text(
                /*'Youssef.h joe'*/
                '${cubit.name}',
                style:Isdark? Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 20,color: Colors.white): Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${cubit.bio}' /*'وكانت مستحيلة حتي اتي امر الله'*/,
                style:Isdark?Theme.of(context).textTheme.caption!.copyWith(color: Colors.white): Theme.of(context).textTheme.caption,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              '100',
                              style:Isdark?Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 20,color: Colors.white): Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Posts',
                              style:Isdark? Theme.of(context).textTheme.caption!.copyWith(color: Colors.white):Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              '200',
                              style:Isdark? Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 20,color: Colors.white): Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Photos',
                              style:Isdark? Theme.of(context).textTheme.caption!.copyWith(color: Colors.white):Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              '100k',
                              style:Isdark?Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 20,color: Colors.white): Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Followers',
                              style:Isdark? Theme.of(context).textTheme.caption!.copyWith(color: Colors.white): Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              '650',
                              style:Isdark?Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 20,color: Colors.white): Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Following',
                              style:Isdark? Theme.of(context).textTheme.caption!.copyWith(color: Colors.white):Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text('Add photos'))),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigatorbuilder(context, SocialEditProfile());
                      },
                      child: const Icon(IconBroken.Edit))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
