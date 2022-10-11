import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/components.dart';
import 'package:social_app/Shared/components/constants.dart';
import 'package:social_app/Shared/network/local/cachehelper.dart';
import 'package:social_app/Shared/styles/styles.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_states.dart';

class SocialNewPost extends StatelessWidget {
   SocialNewPost({Key? key}) : super(key: key);
  var CreatePostKey=TextEditingController();
   var Isdark=cashehelper.Getdata(key: 'Isdark')==null?/*true*/false:cashehelper.Getdata(key: 'Isdark');

   @override
  Widget build(BuildContext context) {
    return BlocConsumer<Social_App_cubit, Social_App_States>(
      listener: (context, state) {},
      builder: (context, state) {
       var cubit= Social_App_cubit.get(context);
        return Scaffold(
        appBar: AppBarBuilder(
            titleSpaceing: 0,
            context: context,
            title: 'Create Post',
            actions: [
              TextButton(onPressed: () {
                if(Social_App_cubit.get(context).PostImage ==null)
                {
                  Social_App_cubit.get(context).CreatePost(DataTime: DateTime.now().toString(), text: CreatePostKey.text);
                }
                else{
                  Social_App_cubit.get(context).UploadPostImage(DataTime: DateTime.now().toString(), text: CreatePostKey.text);

                }
              },
                  child: const Text('Post'))]),
        body: Column(
          children: [
            if(state is CreatePostLoadingState)
            LinearProgressIndicator(),
            if(state is CreatePostLoadingState)
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                   CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      '${cubit.usermodel!.image}'
                        // 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1060&t=st=1664027055~exp=1664027655~hmac=d6fb0595de15853569d0ccdc58af7ebb773546ed58387eb968f464f4c4915a7e'
                      ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              // 'Youssef helmy ',
                              '${Social_App_cubit.get(context).usermodel!.name}',
                              style:Isdark? Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 15, height: 1.4,color: Colors.white):Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 15, height: 1.4),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: defaultcolor,
                              size: 17,
                            )
                          ],
                        ),
                        Text(
                          '${DateTime.now().toString()}',
                          style:Isdark? Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 10, height: 1.4,color: Colors.white) :Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 10, height: 1.4),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: CreatePostKey,
                    maxLengthEnforcement:
                        MaxLengthEnforcement.truncateAfterCompositionEnds,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle:Isdark ? TextStyle(color: Colors.white): TextStyle(color: Colors.black),
                        hintText:
                            'what is on your mind ...${Social_App_cubit.get(context).usermodel!.name}'),
                  )
                ],
              ),
            )),
            if(Social_App_cubit.get(context).PostImage !=null)
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
                                  image: FileImage(Social_App_cubit.get(context).PostImage!),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white30,
                        radius: 16,
                        child: IconButton(
                            onPressed: () {
                              Social_App_cubit.get(context).removePostImage();
                            },
                            icon: Icon(
                              Icons.cancel,
                              size: 24,
                              color: Colors.blue,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          Social_App_cubit.get(context).getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(IconBroken.Image_2),
                            SizedBox(
                              width: 7,
                            ),
                            Text('Add photo')
                          ],
                        )),
                  ),
                  Expanded(
                      child:
                          TextButton(onPressed: () {}, child: Text('# Tags')))
                ],
              ),
            )
          ],
        ),
      );
      },
    );
  }
}
