import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Shared/components/constants.dart';
import 'package:social_app/layout/SocialApp_cubit/Social_states.dart';
import 'package:social_app/models/ChatModel/Chat_model.dart';
import 'package:social_app/models/Comment_Model/CommentModel.dart';
import 'package:social_app/models/NewPost_model/NewPostModel.dart';
import 'package:social_app/models/userModels/Users_model.dart';
import 'package:social_app/modules/ChatsScreen/Chats_screen.dart';
import 'package:social_app/modules/FeedsScreen/Feeds_screen.dart';
import 'package:social_app/modules/NewPostScreen/New_post_Screen.dart';
import 'package:social_app/modules/SettingScreen/Settings_screen.dart';
import 'package:social_app/modules/StoriesScreen/Users_screen.dart';
// import 'package:firebase_storage/firebase_storage.dart' as fire_storage;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase_storage/firebase_storage.dart';

class Social_App_cubit extends Cubit<Social_App_States> {
  Social_App_cubit() : super(SocialIntialState());

  static Social_App_cubit get(context) => BlocProvider.of(context);
  SocialUserModel? usermodel;

  void GetuserData() {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get()
        .asStream().listen((event) {
      usermodel = SocialUserModel.fromJson(event.data());
      emit(GetUserDatasuccessState());
    })

        /*.then((value) {
      usermodel = SocialUserModel.fromJson(value.data());
      emit(GetUserDatasuccessState());
    }).catchError((error) {
      emit(GetUserDataErrorState(error.toString()));
    })*/;
  }

  List<Widget> screens = [
    Feeds_screen(),
    Chat_screen(),
    SocialNewPost(),
     Stories_screen(),
     Setting_screen()
  ];

  List<String> titles = [
    "Home",
    "Chats",
    "NewPost",
    "Users",
    "Settings",
  ];

  void SocialChangeNavBar(int index) {
    /*if (index == 0) {
      // GetuserData();
      // uId=usermodel!.uId;
      PostModel = [];
      GetPosts();
    }*/
    if (index == 1) {
      GetAllUsers();
    }
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      current_Index = index;
      emit(SocialChangeNavBarState());
    }
  }

  File? profileimage;
  var picker = ImagePicker();

  Future<void> getProfilePhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileimage = File(pickedFile.path);
      emit(PickedProfileImageSuccessState());
    } else {
      print('No image Picked');
      emit(PickedProfileImageErrorState());
    }
  }

  File? Coverimage;

  Future<void> getCoverPhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Coverimage = File(pickedFile.path);
      emit(PickedCoverImageSuccessState());
    } else {
      print('No image Picked');
      emit(PickedCoverImageErrorState());
    }
  }

  // String UploadProfileImageUrl = '';

  void uploadProfileImage({
    required String name,
    required String bio,
    required String Phone,
  }) {
    emit(UpdateUserDataProfileImageLoadingState());
    // FirebaseStorage.instance
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileimage!.path).pathSegments.last}')
        .putFile(profileimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // UploadProfileImageUrl = value;
        UpdateUserData(Phone: Phone, name: name, bio: bio, profile: value);

        emit(UpdateprofileImageSucessState());
      }).catchError((error) {
        print('error  1');
        emit(UpdateprofileImageErrorState());
      });
    }).catchError((error) {});
    // print(UploadProfileImageUrl);
    print('error  2');
    // emit(UpdateprofileImageErrorState());
  }

  // String UploadCovrerleImageUrl = '';

  void uploadCovrerImage({
    required String name,
    required String bio,
    required String Phone,
  }) {
    emit(UpdateUserDataCoverImageLoadingState());
    // FirebaseStorage.instance
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(Coverimage!.path).pathSegments.last}')
        .putFile(Coverimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // UploadCovrerleImageUrl = value;

        UpdateUserData(Phone: Phone, name: name, bio: bio, Cover: value);
        emit(UpdateCoverImageSucessState());
      }).catchError((error) {
        emit(UpdateCoverImageErrorState());
      });
    }).catchError((error) {});
    // emit(UpdateCoverImageErrorState());
  }

  // void UpdateUserData({
  //   required String name,
  //   required String bio,
  //   required String Phone,
  // })  {
  //   emit(UpdateUserDataLoadingState());
  //   if (Coverimage != null) {
  //     uploadCovrerImage();
  //   }
  //
  //   else if (profileimage != null) {
  //     uploadProfileImage();
  //   }
  //
  //   else if (Coverimage != null && profileimage != null) {
  //     uploadProfileImage();
  //     uploadCovrerImage();
  //   }
  //
  //   else{
  //     SocialUserModel model = SocialUserModel(
  //         name: name,
  //         email: usermodel!.email,
  //         uId: usermodel!.uId,
  //         phone: Phone,
  //         image: usermodel!.image,
  //         bio: bio,
  //         cover: usermodel!.cover,
  //         IsEmailVerified: false);
  //      FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(uId)
  //         .update(model.toMap())
  //         .then((value) {
  //       GetuserData();
  //     }).catchError((error) {
  //       print(model.name);
  //       emit(UpdateUserDataErrorState());
  //     });
  //   }
  // }

  void UpdateUserData({
    required String name,
    required String bio,
    required String Phone,
    String? profile,
    String? Cover,
  }) {
    emit(UpdateUserDataLoadingState());
    SocialUserModel model = SocialUserModel(
        name: name,
        email: usermodel!.email,
        uId: uId,
        phone: Phone,
        image: profile ?? usermodel!.image,
        bio: bio,
        cover: Cover ?? usermodel!.cover,
        IsEmailVerified: false);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(model.toMap())
        .then((value) {
      GetuserData();
    }).catchError((error) {
      print(model.name);
      emit(UpdateUserDataErrorState());
    });
  }

// ............................................................................................................................................................
  File? PostImage;

  void removePostImage() {
    PostImage = null;
    emit(RemovePostSuccessState());
  }

  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      PostImage = File(pickedFile.path);
      emit(PickedPostImageSuccessState());
    } else {
      print('No image Picked');
      emit(PickedPostImageErrorState());
    }
  }

  void CreatePost({
    required String DataTime,
    String? PostPhoto,
    required String? text,
  }) {
    emit(CreatePostLoadingState());
    NewPostModel model2 = NewPostModel(
      name: usermodel!.name,
      uId: uId,
      image: usermodel!.image,
      DataTime: DataTime,
      PostPhoto: PostPhoto ?? '',
      text: text,
    );
    FirebaseFirestore.instance
        .collection('posts')
        /*.doc('111111')
        .set*/
        //هنشيل الجزء الي فوق وهنبدله ب add عشان يعمل هو الاي دي بطريقة عشوائية

        .add(model2.toMap())
        .then((value) {
      emit(CreatePostSuccessState());
    }).catchError((error) {
      print(model2.name);
      emit(CreatePostErrorState());
    });
  }

  void UploadPostImage({
    required String DataTime,
    required String text,
  }) {
    emit(UpdatePostImageLoadingState());
    // FirebaseStorage.instance
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(PostImage!.path).pathSegments.last}')
        .putFile(PostImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        CreatePost(DataTime: DataTime, text: text, PostPhoto: value);
        emit(UpdatePostImageSucessState());
      }).catchError((error) {
        emit(UpdatePostImageErrorState());
      });
    }).catchError((error) {});
    // emit(UpdateCoverImageErrorState());
  }

  List<NewPostModel> PostModel = [];
  List<String> PostIdForLikes = [];
  List<String> PostIdForComments = [];
  List<int> likes = [];
  List<int> Comments = [];

  void GetPosts() {
    emit(GetPostLoadingState());
    FirebaseFirestore.instance.collection('posts') /*.orderBy('DataTime')*/.get()
        /*.asStream().listen((event) {
      event.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          PostIdForLikes.add(element.id);
          PostModel.add(NewPostModel.fromJson(element.data()));
        }).catchError((error) {
          emit(GetPostErrorState(error.toString()));
        });
      });
      event.docs.forEach((element) {
        element.reference.collection('comments').get().then((value) {
          Comments.add(value.docs.length);
          // PostIdForComments.add(element.id);
        }).catchError((error){
          emit(GetPostErrorState(error.toString()));
        });
      });

      emit(GetPostsuccessState());
    });*/

        .then((value) {

      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          PostIdForLikes.add(element.id);
          PostModel.add(NewPostModel.fromJson(element.data()));
        }).catchError((error) {
          emit(GetPostErrorState(error.toString()));
        });
      });
      value.docs.forEach((element) {
        element.reference.collection('comments').get().then((value) {
          Comments.add(value.docs.length);
          // PostIdForComments.add(element.id);
        }).catchError((error){
          emit(GetPostErrorState(error.toString()));
        });
      });

      emit(GetPostsuccessState());
    }).catchError((error) {
      emit(GetPostErrorState(error.toString()));
    });
  }

  void GetPostLike(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(usermodel!.uId)
        .set({'like': true}).then((value) {
      emit(PostLikesuccessState());
    }).catchError((error) {
      emit(PostLikeErrorState(error.toString()));
    });
  }

// ----------------------------------------------------------------------------------------------------
  //Comments Cubit

  File? CommentImage;

  void removeCommentImage() {
    CommentImage = null;
    emit(RemovePostSuccessState());
  }

  Future<void> getCommentImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      CommentImage = File(pickedFile.path);
      emit(PickedPostImageSuccessState());
    } else {
      print('No image Picked');
      emit(PickedPostImageErrorState());
    }
  }

  void DoComments(
      String PostId, String comments, String DateTime, String? PostPhoto) {
    CommentModel Commentmodel = CommentModel(
      name: usermodel!.name,
      uId: usermodel!.uId,
      DateTime: DateTime,
      CommentPhoto: PostPhoto ?? '',
      image: usermodel!.image,
      text: comments,
    );

    FirebaseFirestore.instance
        .collection('posts')
        .doc(PostId)
        .collection('comments')
        .doc(usermodel!.uId)
        // .collection('newComments')
        // .add(Commentmodel.toMap())
        .set(Commentmodel.toMap())
        . /*.set({'data': comments}).*/ then((value) {
      emit(PostCommentssuccessState());
    }).catchError((error) {
      emit(PostCommentsErrorState(error.toString()));
    });
  }

  List<CommentModel> commentsModel = [];

  void GetComments(String? PostId) {
    commentsModel = [];
    FirebaseFirestore.instance
        .collection('posts')
        .doc(PostId)
        .collection('comments')
        .doc(usermodel!.uId)
        .get()
        .then((value) {
      // /*value.docs.forEach((element) {
      //
      // });*/
      commentsModel.add(CommentModel.fromJson(value.data()));

      emit(GetCommentsuccessState());
      // commentsModel=[];
    }).catchError((error) {
      emit(GetCommentErrorState(error.toString()));
    });
  }

// لسا فاضل نظبط حوار اضافه صوره فالاسكرينه بتعت الكومنتات ولسا فاضل تجيب الكومنتات من الفايربيز وتكمل فنكشن GetComments

//...................................................................................................................................

// Chat Screen Cubit
  List<SocialUserModel> allUsers = [];

  void GetAllUsers() {
    // allUsers=[];
    if (allUsers.length == 0) {
      emit(GetAllUsersLoadingState());
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          if (element.id != usermodel!.uId)
            allUsers.add(SocialUserModel.fromJson(element.data()));
        });

        emit(GetAllUserssuccessState());
      }).catchError((error) {
        emit(GetAllUsersErrorState(error.toString()));
      });
    }
  }

  //Chat Details Cubit

  void SendMessage({String? ReciverId, String? text, String? DateTime}) {
    ChatModel chatModel = ChatModel(
        text: text,
        SenderId: usermodel!.uId,
        ReciverId: ReciverId,
        DateTime: DateTime);
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel!.uId)
        .collection('chats')
        .doc(ReciverId)
        .collection('messages')
        .add(chatModel.toMap())
        .then((value) {
      emit(GetmessageSuccessState());
    }).catchError((error) {
      emit(GetmessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(ReciverId)
        .collection('chats')
        .doc(usermodel!.uId)
        .collection('messages')
        .add(chatModel.toMap())
        .then((value) {
      emit(GetmessageSuccessState());
    }).catchError((error) {
      emit(GetmessageErrorState());
    });
  }

  List<ChatModel> Messages = [];

  void GetMessage({
    String? ReciverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel!.uId)
        .collection('chats')
        .doc(ReciverId)
        .collection('messages')
        .orderBy('DateTime')
        .snapshots()
        .listen((event) {
      Messages = [];
      event.docs.forEach((element) {
        Messages.add(ChatModel.fromJson(element.data()));
      });
    emit(GetAllmessageSuccessState());
    });


  }
  void Changepostindex(int index){
    postindex=index;
    emit(ChangepostindexSuccessState());
  }
}
