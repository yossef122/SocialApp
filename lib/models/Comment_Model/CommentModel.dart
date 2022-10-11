import 'dart:core';

class CommentModel{
  String? name;
  String? uId;
  String? image;
  late  String DateTime;
  String? CommentPhoto;
  String? text;


  CommentModel({
    this.name,
    this.uId,
    required this.DateTime,
    this.image,
    this.CommentPhoto,
    this.text
  });

  CommentModel.fromJson(Map<String,dynamic>?json){
    name=json!['name'];
    uId=json['uId'];
    DateTime=json['DateTime'];
    CommentPhoto=json['CommentPhoto'];
    image=json['image'];
    text=json['text'];
  }

  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'DateTime':DateTime,
      'PostPhoto':CommentPhoto,
      'image':image,
      'text':text,
      'uId':uId,
    };
  }

}
