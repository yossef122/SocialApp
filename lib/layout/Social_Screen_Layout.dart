import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/components.dart';
import 'package:social_app/Shared/components/constants.dart';
import 'package:social_app/Shared/styles/styles.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_states.dart';
import 'package:social_app/modules/ContactScreen/Contact_Screen.dart';
import 'package:social_app/modules/EditProfileScreen/EditProfile_Screen.dart';
import 'package:social_app/modules/NewPostScreen/New_post_Screen.dart';
import 'package:social_app/modules/login/login_screen.dart';

class Social_home_Screen extends StatelessWidget {
  Social_home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Social_App_cubit, Social_App_States>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          Navigatorbuilder(context, SocialNewPost());
        }
      },
      builder: (context, state) {
        var cubit = Social_App_cubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[current_Index]),
            titleSpacing: 0.0,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(IconBroken.Notification)),
              IconButton(onPressed: () {}, icon: Icon(IconBroken.Search))
            ],
          ),
          drawer:cubit.usermodel!=null? Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(

            currentAccountPicture:CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage('${Social_App_cubit.get(context).usermodel!.image}'),
            ) ,
                    accountName: Text(
                        '${Social_App_cubit.get(context).usermodel!.name}'),
                    accountEmail: Text(
                        '${Social_App_cubit.get(context).usermodel!.email}'),

                ),
                ListTile(
                  title: Text('Contact'),
                  leading: Icon(IconBroken.Call),
                  onTap: (){
                    Navigatorbuilder(context, Contact_Screen());
                  },
                ),
                ListTile(
                  title: Text('Help'),
                  leading: Icon(Icons.help_outline),
                  onTap: (){
                  },
                ),

                ListTile(
                  title: Text('Setting'),
                  leading: Icon(IconBroken.Setting),
                  onTap: (){
                    Navigatorbuilder(context, SocialEditProfile());
                  },
                ),
                ListTile(
                  title: Text('Sign out'),
                  leading: Icon(IconBroken.Logout),
                  onTap: (){
                    NavigatorAndFinish(context, MyLoginScreen());

                  },
                ),
              ],
            ),
          ):LinearProgressIndicator(),
          body: /*Social_App_cubit.get(context).model != null
              ? Column(
                  children: [
                    if (Social_App_cubit.get(context).model!.IsEmailVerified ==
                        false)
                      Container(
                        color: Colors.amber.withOpacity(.6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Text('please verify your email ')),
                              SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.currentUser!
                                        .sendEmailVerification()
                                        .then((value) {
                                      ShowToast(
                                          message: 'check your email',
                                          state: ToastColorState.success);
                                    }).catchError((error) {});
                                  },
                                  child: Text('verify'))
                            ],
                          ),
                        ),
                      )
                  ],
                )
              : Center(child: CircularProgressIndicator()
          )*/
              cubit.screens[current_Index],
/*
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: current_Index,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat), label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Paper_Upload), label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.web_stories), label: 'Stories'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting), label: 'Setting'),
            ],
            onTap: (index) {
              cubit.SocialChangeNavBar(index);
            },
          ),
*/
            bottomNavigationBar:CurvedNavigationBar(
                index: current_Index,
            items: [
              Row(                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                   Icon(IconBroken.Home,size: 20,),
                  // Text('Home')
                ],
              ),
              Row(                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                   Icon(IconBroken.Chat,size: 20,),
                  // Text('Chat')
                ],
              ),
              Row(                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(IconBroken.Paper_Upload,size: 20,),
                  // Text('Post')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.web_stories,size: 20,),
                  // Text('Stories')
                ],
              ),
              Row(                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(IconBroken.Profile,size: 20,),
                  // Text('Setting')
                ],
              ),

                              ],
                onTap: (index) {
                  cubit.SocialChangeNavBar(index);
                },
            )
        );
      },
    );
  }
}
