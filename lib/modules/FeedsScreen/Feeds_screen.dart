import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/components.dart';
import 'package:social_app/Shared/components/constants.dart';
import 'package:social_app/Shared/styles/styles.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_states.dart';
import 'package:social_app/models/NewPost_model/NewPostModel.dart';
import 'package:social_app/modules/CommentScreen/Comment_Screen.dart';

class Feeds_screen extends StatelessWidget {
  Feeds_screen({Key? key}) : super(key: key);
  var CommentControler = TextEditingController();
  var ScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Social_App_cubit, Social_App_States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = Social_App_cubit.get(context);
          // print(cubit.PostModel[0].PostPhoto);
          return Scaffold(
            key: ScaffoldKey,
            body: cubit.PostModel.isNotEmpty && cubit.usermodel != null
                ? SingleChildScrollView(
                    physics:  BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*Container(
                width: double.infinity,
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 8.0,
                  child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                const Image(
                                  image: NetworkImage(
                                      'https://img.freepik.com/free-photo/showing-tablet-s-blank-screen_155003-21288.jpg?w=1060&t=st=1664027736~exp=1664028336~hmac=d00df8d3f352c2471ce610da4d8fe778cb450a11971934b65ef51816ecce1c4d'),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 200.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Text(
                                    'Communicate With friends',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            fontSize: 12, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                ),
            ),*/
                        Card(
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 5, end: 5),
                            child: Container(
                              height: 244,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: TextButton(onPressed: (){}, child: Text('Stories'))),
                                      Expanded(child: TextButton(onPressed: (){}, child: Text('Reels'))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        elevation: 5.0,
                                        child: Card(
                                          elevation: 0.0,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    height: 180,
                                                    width: 100,
                                                    // color: Colors.purple,
                                                    decoration: BoxDecoration(
                                                        color: Colors.purpleAccent,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20)),
                                                  ),
                                                  Stack(
                                                    alignment: AlignmentDirectional
                                                        .bottomEnd,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(50)),
                                                        // color: Colors.white,
                                                        child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color: Colors.white,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .video_call_outlined,
                                                                size: 40,
                                                                color:
                                                                    Colors.purple,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // height: 50,
                                                        // width: 60,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(50)),
                                                        // color: Colors.white,
                                                        child: Stack(
                                                          // alignment: AlignmentDirectional.bottomEnd,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color: Colors.white,
                                                              ),
                                                              child: Icon(
                                                                Icons.add,
                                                                size: 20,
                                                                color: Colors.blue,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                ' Create room',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      // ListView.separated(
                                      //    scrollDirection: Axis.horizontal,
                                      //    itemBuilder: (context, index) => buildStoryItem(),
                                      //    separatorBuilder: (context, index) => Container(width: 5),
                                      //    itemCount: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListView.separated(
                          itemBuilder: (context, index) => BuildPostItem(
                              cubit.PostModel[index], context, index),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: cubit.PostModel.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        )
                      ],
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          );
        });
  }

  Widget BuildPostItem(NewPostModel? model, context, index) => Form(
        // key:FormKey ,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10.0,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage('${model!.image}'
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
                                '${model.name}',
                                style: Theme.of(context)
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
                            '${model.DataTime}',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 10, height: 1.4),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[400],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries'
                  '${model.text}',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(height: 1.1, fontSize: 14),
                ),

                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: EdgeInsetsDirectional.only(bottom: 3),
                //   child: Container(
                //     width: double.infinity,
                //     child: Wrap(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(right: 6),
                //           child: Container(
                //               height: 25,
                //               child: MaterialButton(
                //                 onPressed: () {},
                //                 child: Text(
                //                   '#Software',
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .caption!
                //                       .copyWith(
                //                           color: defaultcolor, fontSize: 12),
                //                 ),
                //                 minWidth: 1,
                //                 padding: EdgeInsets.zero,
                //               )),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(right: 6),
                //           child: Container(
                //               height: 25,
                //               child: MaterialButton(
                //                 onPressed: () {},
                //                 child: Text(
                //                   '#Software',
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .caption!
                //                       .copyWith(
                //                           color: defaultcolor, fontSize: 12),
                //                 ),
                //                 minWidth: 1,
                //                 padding: EdgeInsets.zero,
                //               )),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(right: 6),
                //           child: Container(
                //               height: 25,
                //               child: MaterialButton(
                //                 onPressed: () {},
                //                 child: Text(
                //                   '#Software',
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .caption!
                //                       .copyWith(
                //                           color: defaultcolor, fontSize: 12),
                //                 ),
                //                 minWidth: 1,
                //                 padding: EdgeInsets.zero,
                //               )),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(right: 6),
                //           child: Container(
                //               height: 25,
                //               child: MaterialButton(
                //                 onPressed: () {},
                //                 child: Text(
                //                   '#Software',
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .caption!
                //                       .copyWith(
                //                           color: defaultcolor, fontSize: 12),
                //                 ),
                //                 minWidth: 1,
                //                 padding: EdgeInsets.zero,
                //               )),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                const SizedBox(
                  height: 6,
                ),
                if (model.PostPhoto != '')
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 10),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                              image: NetworkImage('${model.PostPhoto}'
                                  // 'https://img.freepik.com/free-photo/business-concept-with-team-close-up_23-2149151159.jpg?w=1060&t=st=1664034166~exp=1664034766~hmac=4dcf667c1eed321980cec3091d3b41dba292d6f5e12b1c5972206d491a4766a9'
                                  ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Social_App_cubit.get(context).GetPostLike(
                              Social_App_cubit.get(context)
                                  .PostIdForLikes[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              const Icon(
                                IconBroken.Heart,
                                color: Colors.red,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${Social_App_cubit.get(context).likes[index]}',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                IconBroken.Chat,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                // '0 comments',
                                Social_App_cubit.get(context).Comments[index] >
                                        0
                                    ? '${Social_App_cubit.get(context).Comments[index]}'
                                    : ' 0 comments',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[400],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(
                                  '${Social_App_cubit.get(context).usermodel!.image}'
                                  // 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1060&t=st=1664027055~exp=1664027655~hmac=d6fb0595de15853569d0ccdc58af7ebb773546ed58387eb968f464f4c4915a7e'
                                  ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              'Write acomment',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.black, fontSize: 17),
                            ),
                          ],
                        ),
                        onTap: () {
                          ScaffoldKey.currentState!
                              .showBottomSheet(
                                (BuildContext context) {
                                  return Form(
                                      child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      color: Colors.white,
                                      height: 200,
                                      width: 500,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: CommentControler,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                labelText: 'Enter your comment',
                                                border: InputBorder.none,
                                                suffixIcon: IconButton(
                                                  icon: Icon(IconBroken
                                                      .Arrow___Right_Circle),
                                                  onPressed: () {
                                                    Social_App_cubit.get(
                                                            context)
                                                        .DoComments(
                                                            Social_App_cubit.get(
                                                                        context)
                                                                    .PostIdForComments[
                                                                index],
                                                            CommentControler
                                                                .text,
                                                            DateTime.now()
                                                                .hour
                                                                .toString(),
                                                            '');
                                                  },
                                                )),
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'Comment mustn\'t empty';
                                              }
                                              return null;
                                            },
                                          ),
                                          // IconButton(
                                          //     onPressed: (){
                                          //       Social_App_cubit.get(context).DoComments(Social_App_cubit.get(context).PostIdForComments[index], CommentControler.text);
                                          //     },
                                          //     icon: Icon(IconBroken.Arrow___Right))
                                        ],
                                      ),
                                    ),
                                  ));
                                },
                              )
                              .closed
                              .then((value) {
                                Social_App_cubit.get(context).DoComments(
                                    Social_App_cubit.get(context)
                                        .PostIdForLikes[index],
                                    CommentControler.text,
                                    DateTime.now().toString(),
                                    '');
                              });
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Social_App_cubit.get(context).GetComments(
                            Social_App_cubit.get(context)
                                .PostIdForLikes[index]);

                        print(Social_App_cubit.get(context)
                            .PostIdForLikes[index]);
                        Navigatorbuilder(context, Comment_Screen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Chat,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Comments',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Widget buildStoryItem() => Container(
    height: 180,
    width: double.infinity,
    child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        child: /*ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return*/
            Card(
          elevation: 0.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 100,
                    // color: Colors.purple,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        // color: Colors.white,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.video_call_outlined,
                                size: 40,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 50,
                        // width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        // color: Colors.white,
                        child: Stack(
                          // alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                ' Create room',
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        )),
  );
}

//         clipBehavior: Clip.antiAliasWithSaveLayer,
// //               elevation: 10.0,
// //               margin: EdgeInsets.symmetric(horizontal: 8.0),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(10.0),
// //                 child: Column(
// //                   children: [
// //                     Row(
// //                       children: [
// //                         CircleAvatar(
// //                           radius: 25,
// //                   backgroundImage: NetworkImage('https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1060&t=st=1664027055~exp=1664027655~hmac=d6fb0595de15853569d0ccdc58af7ebb773546ed58387eb968f464f4c4915a7e'),
// //                          ),
// //                      SizedBox(
// //                        width: 20.0,
// //                      ),
// //                      Expanded(
// //                        child: Column(
// //                          crossAxisAlignment: CrossAxisAlignment.start,
// //                          children: [
// //                            Row(
// //                              children: [
// //                                Text('Youssef helmy ',style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 15,height: 1.4),),
// //                               Icon(Icons.check_circle,color: defaultcolor,size: 17,)
// //                              ],
// //                            ),
// //                            Text('September 24/2022 at 5:21 pm ',style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10,height: 1.4),)
// //
// //                          ],
// //                        ),
// //                      ),
// //                        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,size: 16,),)
// //                       ],
// //                     ),
// //                     SizedBox(
// //                       height: 10,
// //                     ),
// //                     Container(
// //                       width: double.infinity,
// //                       height: 1,
// //                       color: Colors.grey[400],
// //                     ),
// //                     SizedBox(
// //                       height: 10,
// //                     ),
// //                     Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',style:Theme.of(context).textTheme.subtitle1!.copyWith(height: 1.1,fontSize: 14) ,),
// //                     SizedBox(
// //                       height: 10,
// //                     ),
// //                     Padding(
// //                       padding:  EdgeInsetsDirectional.only(bottom: 3),
// //                       child: Container(
// //                        width: double.infinity,
// //                         child: Wrap(
// //                           children: [
// //                             Padding(
// //                               padding: const EdgeInsets.only(right: 6),
// //                               child: Container(
// //                                   height: 25,
// //                                   child: MaterialButton(
// //                                     onPressed: (){} ,
// //                                     child: Text('#Software',style: Theme.of(context).textTheme.caption!.copyWith(color: defaultcolor,fontSize:12 ),),
// //                                     minWidth: 1,
// //                                     padding: EdgeInsets.zero,
// //                                   )),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.only(right: 6),
// //                               child: Container(
// //                                   height: 25,
// //                                   child: MaterialButton(
// //                                     onPressed: (){} ,
// //                                     child: Text('#Software',style: Theme.of(context).textTheme.caption!.copyWith(color: defaultcolor,fontSize:12 ),),
// //                                     minWidth: 1,
// //                                     padding: EdgeInsets.zero,
// //                                   )),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.only(right: 6),
// //                               child: Container(
// //                                   height: 25,
// //                                   child: MaterialButton(
// //                                     onPressed: (){} ,
// //                                     child: Text('#Software',style: Theme.of(context).textTheme.caption!.copyWith(color: defaultcolor,fontSize:12 ),),
// //                                     minWidth: 1,
// //                                     padding: EdgeInsets.zero,
// //                                   )),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.only(right: 6),
// //                               child: Container(
// //                                   height: 25,
// //                                   child: MaterialButton(
// //                                     onPressed: (){} ,
// //                                     child: Text('#Software',style: Theme.of(context).textTheme.caption!.copyWith(color: defaultcolor,fontSize:12 ),),
// //                                     minWidth: 1,
// //                                     padding: EdgeInsets.zero,
// //                                   )),
// //                             ),
// //
// //
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       height: 6,
// //                     ),
// //                     Container(
// //                       height: 200,
// //                       width: double.infinity,
// //                       decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(5.0),
// //                           image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-photo/business-concept-with-team-close-up_23-2149151159.jpg?w=1060&t=st=1664034166~exp=1664034766~hmac=4dcf667c1eed321980cec3091d3b41dba292d6f5e12b1c5972206d491a4766a9'),fit: BoxFit.cover)
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       height: 10,
// //                     ),
// //                     Row(
// //                       children: [
// //                         Expanded(
// //                           child: InkWell(
// //                             onTap: (){},
// //                             child: Padding(
// //                               padding: const EdgeInsets.symmetric(horizontal: 10),
// //                               child: Row(
// //                                 children: [
// //                                   Icon(IconBroken.Heart,color: Colors.red,size: 18,),
// //                                   SizedBox(
// //                                     width: 5,
// //                                   ),
// //                                   Text('1200',style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black),),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         Expanded(
// //                           child: InkWell(
// //                             onTap: (){},
// //                             child: Padding(
// //                               padding: const EdgeInsets.symmetric(horizontal: 10),
// //                               child: Row(
// //                                 mainAxisAlignment: MainAxisAlignment.end,
// //                                 children: [
// //                                   Icon(IconBroken.Chat,color: Colors.amber,size: 18,),
// //                                   SizedBox(
// //                                     width: 5,
// //                                   ),
// //                                   Text('1200 comments',style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black),),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //
// //                       ],
// //                     ),
// //                     SizedBox(
// //                       height: 5,
// //                     ),
// //                     Container(
// //                       width: double.infinity,
// //                       height: 1,
// //                       color: Colors.grey[400],
// //                     ),
// //                     SizedBox(
// //                       height: 5,
// //                     ),
// //                     Row(
// //                       children: [
// //                         Expanded(
// //                           child: InkWell(
// //
// //                             child: Row(
// //                               children: [
// //                                 CircleAvatar(
// //                                   radius: 18,
// //                                   backgroundImage: NetworkImage('https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1060&t=st=1664027055~exp=1664027655~hmac=d6fb0595de15853569d0ccdc58af7ebb773546ed58387eb968f464f4c4915a7e'),
// //                                 ),
// //                                 SizedBox(
// //                                   width: 20.0,
// //                                 ),
// //                                 Text('Write acomment' ,style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black,fontSize: 17),),
// //
// //                               ],
// //                             ),
// //                             onTap: (){},
// //                           ),
// //                         ),
// //                         InkWell(
// //                           onTap: (){},
// //                           child: Padding(
// //                             padding: const EdgeInsets.symmetric(horizontal: 10),
// //                             child: Row(
// //                               children: [
// //                                 Icon(IconBroken.Heart,color: Colors.red,size: 18,),
// //                                 SizedBox(
// //                                   width: 5,
// //                                 ),
// //                                 Text('Like',style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black),),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),     Card(
//
/*
ListView.separated(
itemBuilder: (context, index) {
return Card(

child: Column(

children: [
Row(
children: [
Expanded(child: TextButton(onPressed: (){}, child: Row(children: [Icon(Icons.location_history_outlined),Text("Story")],))),
TextButton(onPressed: (){}, child: Row(children: [Icon(Icons.location_history_outlined),Text("Story")],)),
TextButton(onPressed: (){}, child: Row(children: [Icon(Icons.location_history_outlined),Text("Story")],)),
],
),
// Stack(
//   children: [
//
//   ],
// )
],
),
);
},
separatorBuilder: (context, index) {
return Container(
width: 10,
);
},
itemCount: 10)*/
// ListView.separated(
          //    scrollDirection: Axis.horizontal,
          //    itemBuilder: (context, index) => buildStoryItem(),
          //    separatorBuilder: (context, index) => Container(width: 5),
          //    itemCount: 10),