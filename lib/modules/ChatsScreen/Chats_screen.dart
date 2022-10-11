import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/components.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_states.dart';
import 'package:social_app/models/userModels/Users_model.dart';
import 'package:social_app/modules/ChatsScreen/Chat_Screen_details.dart';

class Chat_screen extends StatelessWidget {
  const Chat_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       BlocConsumer<Social_App_cubit,Social_App_States>(
         listener: (cubit,state){},
           builder: (cubit,state){
           return /*Social_App_cubit.get(context).allUsers.length > 0
        ?*/ ListView.separated(
               physics: BouncingScrollPhysics(),
               itemBuilder: (context, index) {
                 return ChatBiulder(
                     context, Social_App_cubit.get(context).allUsers[index]);
               },
               separatorBuilder: (context, index) {
                 return mydivider();
               },
               itemCount: Social_App_cubit.get(context).allUsers.length);
           }        )
        /*: Center(child: CircularProgressIndicator())*/;
  }

  Widget ChatBiulder(context, SocialUserModel model) => InkWell(
        onTap: () {
          // Social_App_cubit.get(context).GetAllUsers();
          Navigatorbuilder(context, Chat_Screen_details( usermodel: model,));
          Social_App_cubit.get(context).GetMessage(ReciverId: model.uId);
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('${model.image}'
                    // 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1060&t=st=1664027055~exp=1664027655~hmac=d6fb0595de15853569d0ccdc58af7ebb773546ed58387eb968f464f4c4915a7e'
                    ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                '${model.name}',
                // 'Yossef helmy ',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17,color: Colors.black),
              )
            ],
          ),
        ),
      );
}
