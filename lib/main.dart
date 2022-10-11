import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/bloc_observe/bloc_observe.dart';
import 'package:social_app/Shared/components/components.dart';
import 'package:social_app/Shared/components/constants.dart';
import 'package:social_app/Shared/cubit/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/cubit/states.dart';
// import 'package:social_app/Shared/cubit/cubit/cubit.dart';
// import 'package:social_app/Shared/cubit/cubit/states.dart';
import 'package:social_app/Shared/network/local/cachehelper.dart';
import 'package:social_app/Shared/network/remotly/diohelper.dart';
import 'package:social_app/Shared/styles/themes.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
// import 'package:social_app/layout/SocialApp_cubit/Social_states.dart';
import 'package:social_app/layout/Social_Screen_Layout.dart';
import 'package:social_app/modules/NativeScreen/Native_Screen.dart';
import 'package:social_app/modules/login/login_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token=await FirebaseMessaging.instance.getToken();
  print("token of your app${token}");

  Bloc.observer = MyBlocObserver();

  FirebaseMessaging.onMessage.listen((event) {
    print('notfication on opened app');
    // print('da m4 byzhr fe el notification bar bs bytb3t 3ady');
    print(event.data);
    print(event.toString());
    ShowToast(message: 'on message', state: ToastColorState.success);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('notfication to open app');
    print('notfication to open app');
    ShowToast(message: 'on message OpenedApp', state: ToastColorState.success);

    print(event.data);
    print(event.toString());
  });

  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  diohelper.init();
  await cashehelper.init();
  Widget start ;

  //
  // var Onboareding = cashehelper.Getdata(key:'Isboarding');
  // print(Onboareding);
  //
  //
  // if(Onboareding!=null)
  // {
  //   token =cashehelper.Getdata(key: 'token' );
  //   print(token);
  //   if(token!=null)
  //     start =ShopApp_Home_screen();
  //   else
  //     start =MyLoginScreen();
  // }
  // else {
  //   start = onBorading_Screen();
  // }
    uId =cashehelper.Getdata(key:'uId');
    print(uId);
    if(uId !=null){
      start =Social_home_Screen();
    }else{
      start =MyLoginScreen();
    }


  runApp(MyApp(Isdark: cashehelper.Getdata(key:"isDark"), Start: start,/*onBoarding:Onboaredingcashehelper.Getdata(key:"Isboarding")*/));

  // Isdark:cashehelper.getdata(key: 'Isdark')))
}

class MyApp extends StatelessWidget {
final bool? Isdark;
  final Widget Start ;

  const MyApp({super.key, required this.Isdark,  required this.Start});

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [
                BlocProvider(
              create: (BuildContext context)=>AppCubit()),
          BlocProvider(
              create: (BuildContext context)=>Social_App_cubit()..GetPosts()..GetuserData()/*..GetAllUsers()*/),
    ],
        child: BlocConsumer<AppCubit,appstates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) =>
              MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lighttheme,
                darkTheme: darktheme,
                themeMode:AppCubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,
                home:/*uId != null? Social_home_Screen():MyLoginScreen()*/Native_Screen(),
                //     ),
              ),
        ),
      );
  }
}
