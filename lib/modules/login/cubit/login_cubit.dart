import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/constants.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_cubit.dart';
import 'package:social_app/modules/login/cubit/login_states.dart';

class login_Cubit extends Cubit<login_states> {
  login_Cubit() : super(loginIntialStates());

  static login_Cubit get(context) => BlocProvider.of(context);

  void UserLogin({
    required String email,
    required String password,
    // context
  }) {
    // LoginModel login;
    emit(loginLooadingStates());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password).asStream().listen((event) {
      print(event.user!.email);
      print(event.user!.uid);
      emit(loginsuccessStates(event.user!.uid));

    });
        // .then((value) {
      // print(value.user!.email);
      // print(value.user!.uid);
      // Social_App_cubit.get(context).allUsers;
    // emit(loginsuccessStates(value.user!.uid));
    //
    // }).catchError((error) {
    //   emit(loginerrorStates(error.toString()));
    // });
  }

  IconData ChangePassVisibility() {
    emit(ChangePassVisibilityState());
    return ispass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }
}
