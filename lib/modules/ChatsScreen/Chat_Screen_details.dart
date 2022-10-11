import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/constants.dart';
import 'package:social_app/Shared/network/local/cachehelper.dart';
import 'package:social_app/Shared/styles/styles.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_states.dart';
import 'package:social_app/models/ChatModel/Chat_model.dart';
import 'package:social_app/models/userModels/Users_model.dart';

class Chat_Screen_details extends StatelessWidget {
  SocialUserModel? usermodel;

  Chat_Screen_details({required this.usermodel});
  var Isdark=cashehelper.Getdata(key: 'Isdark')==null?/*true*/false:cashehelper.Getdata(key: 'Isdark');

  var ChatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        Social_App_cubit.get(context).GetMessage(ReciverId: usermodel!.uId);
        var cubit = Social_App_cubit.get(context);

        return BlocConsumer<Social_App_cubit, Social_App_States>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('${usermodel!.image}'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${usermodel!.name}',
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                  ],
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                ],
              ),
              body: /*cubit.Messages.isNotEmpty
                  ?*/
                  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (usermodel!.uId ==
                                cubit.Messages[index].ReciverId) {
                              return MyChatMessage(cubit.Messages[index]);
                            }
                            // if(usermodel!.uId!=cubit.Messages[index].ReciverId)
                            // else
                              return ChatMessage(cubit.Messages[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 5,
                            );
                          },
                          itemCount: cubit.Messages.length),
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: ChatController,
                              decoration: InputDecoration(
                                  hintText: 'type youe message here... ',
                                  hintStyle:Isdark?TextStyle(color: Colors.white):TextStyle(color: Colors.black) ,
                                  border: InputBorder.none
                              ),
                                cursorColor:Colors.white,
                                keyboardAppearance:Brightness.light
                            ),
                          ),
                          Container(
                              height: 50,
                              color: Colors.blue,
                              child: MaterialButton(
                                onPressed: () {
                                  Social_App_cubit.get(context).SendMessage(
                                      text: ChatController.text,
                                      DateTime: DateTime.now().toString(),
                                      ReciverId: usermodel!.uId);
                                },
                                child: Icon(
                                  IconBroken.Send,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                minWidth: 1,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ) /*: LinearProgressIndicator()*/,
            );
          },
        );
      },
    );
  }

  Widget ChatMessage(ChatModel message) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                topStart: Radius.circular(10),
                topEnd: Radius.circular(10),
              )),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Text('${message.text}'),
        ),
      );

  Widget MyChatMessage(ChatModel message) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
              color: defaultcolor,
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10),
                topStart: Radius.circular(10),
                topEnd: Radius.circular(10),
              )),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Text('${message.text}'),
        ),
      );
}
