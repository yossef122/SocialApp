import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/components.dart';
import 'package:social_app/Shared/components/constants.dart';
import 'package:social_app/Shared/network/local/cachehelper.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
import 'package:social_app/layout/Social_Screen_Layout.dart';
import 'package:social_app/modules/login/cubit/login_cubit.dart';
import 'package:social_app/modules/login/cubit/login_states.dart';
import 'package:social_app/modules/register/Register_screen.dart';


class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var Formkey = GlobalKey<FormState>();
  bool IsVisible = true;
  var KeyValidate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocProvider(
        create: (BuildContext context) => login_Cubit(),
        child: BlocConsumer<login_Cubit, login_states>(
          listener: (context, state) {
            if (state is loginsuccessStates ) {
              ShowToast(message:'succces Login' , state: ToastColorState.success);
                print('new  ${state.uId}',);
              cashehelper.Savedata(key:'uId', value: state.uId)
                  .then((value) {
                NavigatorAndFinish(context, Social_home_Screen());
              });
              if(uId !=null){
                 uId =cashehelper.Getdata(key:'uId');
                 print('new 2  ${uId}',);
                 Social_App_cubit.get(context).GetuserData();

              }
            }
            else if(state is loginerrorStates){
              ShowToast(
                  state: ToastColorState.error, message: 'Not Allowed');

            }
          },
          builder: (context, state) => Stack(
            children: [

              Container(
                color: Color.fromARGB(255, 46, 14, 71)/*Colors.blue[900]*/,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Form(
                        key: Formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Login",
                                style: /*TextStyle(color: Colors.black, fontSize: 30,fontWeight: FontWeight.bold)*/ Theme
                                        .of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 30.0,
                            ),
                            const Text('login now to  communicate with your friends',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,)),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(

                                prefixIcon: Icon(Icons.email_outlined,color: Colors.white),
                                labelText: 'Email address',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                    fontSize: 20
                                ),

                              ),
                              keyboardType: TextInputType.text,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Email mustn\'t be empty';
                                } else {
                                  return null;
                                }
                              },
                                controller: emailController
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            /*TextformfirldBuilder(
                                labelTextstyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                    fontSize: 20),
                                labelText: 'Email address',
                                keyboard: TextInputType.text,
                                ValidateFunction: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Email mustn\'t =be empty';
                                  } else {
                                    return null;
                                  }
                                },
                                prefixIcon: Icons.email_outlined,
                                controller: emailController),
                            const SizedBox(
                              height: 15.0,
                            ),*/
                            TextFormField(
                                decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.password_outlined,color: Colors.white,),
                                  suffixIcon: login_Cubit().ChangePassVisibility() != null
                                      ? IconButton(
                                    icon: Icon(login_Cubit().ChangePassVisibility(),color: Colors.white),
                                    onPressed: () async {
                                      setState(() {
                                        ispass = !ispass;
                                      });
                                    },
                                  )
                                      : null,
                                  labelText:'Password',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      fontSize: 20
                                  ),

                                ),
                                keyboardType: TextInputType.visiblePassword,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Password mustn\'t be empty';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: passController
                            ),

/*
                            TextformfirldBuilder(
                                Ispass: ispass,
                                labelTextstyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                    fontSize: 20),
                                labelText: 'Password',
                                keyboard: TextInputType.text,
                                ValidateFunction: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Password mustn\'t =be empty';
                                  } else {
                                    return null;
                                  }
                                },
                                ValidateFunction5: () {
                                  if (Formkey.currentState!.validate()) {
                                    login_Cubit.get(context).UserLogin(
                                        email: emailController.text,
                                        password: passController.text);
                                  }
                                },
                                prefixIcon: Icons.password_outlined,
                                suffixIcon: login_Cubit().ChangePassVisibility(),
                                ValidateFunction4: () async {
                                  setState(() {
                                    ispass = !ispass;
                                  });
                                },
                                controller: passController),
*/
                            const SizedBox(
                              height: 30.0,
                            ),
                            state is! loginLooadingStates
                                ? Center(

                                  child: defaultButton(
                                    BackGround:Colors.purple ,
                              width: 200,
                                      function1: () {

                                        if (Formkey.currentState!.validate()) {
                                          login_Cubit.get(context).UserLogin(
                                              email: emailController.text,
                                              password: passController.text);
                                        }
                                      },
                                      text: 'login',
                                      IsUpperCase: true,

                            ),
                                )
                                : Center(child: const CircularProgressIndicator()),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'don\'t have an account ?',
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.w500,color: Colors.white),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigatorbuilder(
                                            context,  MyRegisterScreen());
                                      },
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ClipPath(
                clipper:clipperPathBuilder(radius: 60, DyOfOffset: 40, DxOfOffset: 0) ,
                child: Container(
                  color: Colors.pinkAccent,
                ) ,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20,),
                child: ClipPath(
                  clipper:clipperPathBuilder(radius: 50, DyOfOffset: 15, DxOfOffset: 60) ,
                  child: Container(
                    color: Colors.pinkAccent,
                  ) ,
                ),
              ),
              ClipPath(
                clipper:clipperPathBuilder(radius: 60, DyOfOffset: 700, DxOfOffset: 430) ,
                child: Container(
                  color: Colors.pinkAccent,
                ) ,
              ),
              ClipPath(
                clipper:clipperPathBuilder(radius: 60, DyOfOffset: 520, DxOfOffset: 430) ,
                child: Container(
                  color: Colors.pinkAccent,
                ) ,
              ),
              ClipPath(
                clipper:clipperPathBuilder(radius: 60, DyOfOffset: 350, DxOfOffset: 430) ,
                child: Container(
                  color: Colors.pinkAccent,
                ) ,
              ),
              ClipPath(
                clipper:clipperPathBuilder(radius: 60, DyOfOffset: 170, DxOfOffset: 430) ,
                child: Container(
                  color: Colors.pinkAccent,
                ) ,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20,),
                child: ClipPath(
                  clipper:clipperPathBuilder(radius: 70, DyOfOffset: 15, DxOfOffset: 60) ,
                  child: Container(
                    color: Colors.pinkAccent,
                  ) ,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  IconData IsSuffixVisIIble() {
    return IsVisible ? Icons.visibility : Icons.visibility_off;
  }
}

class clipperPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path=Path();
    path.addOval(Rect.fromCircle(center: Offset(0,40),radius: 60));
  return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
class clipperPath2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path=Path();
    path.addOval(Rect.fromCircle(center: Offset(70,30),radius: 60));
  return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
