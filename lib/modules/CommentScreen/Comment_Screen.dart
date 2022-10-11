import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/constants.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_states.dart';
import 'package:social_app/models/Comment_Model/CommentModel.dart';

class Comment_Screen extends StatefulWidget {
  Comment_Screen({Key? key}) : super(key: key);

  @override
  State<Comment_Screen> createState() => _Comment_ScreenState();
}

class _Comment_ScreenState extends State<Comment_Screen> {
  var CommentControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Social_App_cubit, Social_App_States>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'post ${Social_App_cubit
                  .get(context)
                  .PostModel[postindex].name}',
              style:
              Theme
                  .of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 16),
            ),
            centerTitle: true,
          ),
          body: Social_App_cubit
              .get(context)
              .commentsModel
              .length > 0 ? ListView.separated(itemBuilder: (context, index) {

                return CommentBuild(context, Social_App_cubit
                  .get(context)
                  .commentsModel, index);
              },
              separatorBuilder: (context, index) => Container(height: 10,),
              itemCount: Social_App_cubit
                  .get(context)
                  .commentsModel
                  .length):Container(child: Column(
                    children: [
                      LinearProgressIndicator(),
                      Expanded(child: Text('no comments yet',style: Theme.of(context).textTheme.bodyText1,))
                    ],
                  )),
        );
      },
    );
  }

  Widget CommentBuild(context, List<CommentModel> model, index) {
    return Column(
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  '${model[index].image}'
                /*'${model!.image}'*/
                // 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1060&t=st=1664027055~exp=1664027655~hmac=d6fb0595de15853569d0ccdc58af7ebb773546ed58387eb968f464f4c4915a7e'),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: 20, top: 16.0),
                child: Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200]),
                  child: /*Card(

                    color: Colors.grey[200],
                    child:*/
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 12.0, top: 16.0, end: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model[index].name}',
                          // 'Yossef Helmy',
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '${model[index].text}',
                          // 'Ssssssssssssssssssssssss',
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        /* Text(
                          */ /*'${Social_App_cubit.get(context).C[0].}'*/ /*
                          'hhhhhhhhhhhhhhhhhhhhhhhhh',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          */ /*'${Social_App_cubit.get(context).C[0].}'*/ /*
                          'vvvvvvvvvvvvvvvvvvvvvvvvv',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                        ),*/
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 50),
          child: Row(
            children: [
              Text(
                  '${model[index].DateTime}',
                  // '00:24:28',
                  style: Theme
                      .of(context)
                      .textTheme
                      .caption),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Like',
                    style: TextStyle(color: Colors.grey),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text('Reply', style: TextStyle(color: Colors.grey))),
            ],
          ),
        )
      ],
    );
  }
}
