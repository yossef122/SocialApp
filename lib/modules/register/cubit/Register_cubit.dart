import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/components/constants.dart';
import 'package:social_app/models/userModels/Users_model.dart';
import 'package:social_app/modules/register/cubit/Register_states.dart';


class Register_Cubit extends Cubit<Register_states> {
  Register_Cubit() : super(RegisterIntialStates());

  static Register_Cubit get(context) => BlocProvider.of(context);

  void UserRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLooadingStates());
    FirebaseAuth.instance.
        createUserWithEmailAndPassword(
        email: email,
        password: password)
        .then((value) {
          // print(value.user!.email);
          // print(value.user!.uid);
          UserCreate(phone: phone, email: email, name: name, uId: value.user!.uid);
          // emit(RegistersuccessStates());
    }).catchError((onError){

          emit(RegistererrorStates(onError.toString()));
    });

  }

  void UserCreate({
    required String name,
    required String email,
    required String uId,
    required String phone,
      }){
    emit(UserCreateLooadingStates());
    SocialUserModel model=SocialUserModel(
      name: name,
      email: email,
      uId: uId,
      phone: phone,
      image: 'https://img.freepik.com/free-vector/arab-man-cartoon-character_1308-50841.jpg?w=740&t=st=1664148203~exp=1664148803~hmac=1d011b38d6302d2d95100db6f2e7e129ca8e11f4f3dbc040d43ff8d71575ae8d',
      bio: 'write your bio...',
      cover: 'https://scontent.fcai21-4.fna.fbcdn.net/v/t1.6435-9/117816135_2697161233870945_8765598808213195153_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=e3f864&_nc_ohc=syPOHjqIn9MAX_OsTz_&_nc_ht=scontent.fcai21-4.fna&oh=00_AT_Zp3QALboc7V9I3SEnH0Hh6RUleZA9TaSfAzzXoaDjVg&oe=6356C145',
      IsEmailVerified: false
    );
    FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
            emit(UserCreatesuccessStates());
          }).catchError((error){
            emit(UserCreateerrorStates(error.toString()));
          });

  }

  IconData ChangePassVisibility() {
    emit(ChangePassVisibilityState());
    return ispass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }
}
