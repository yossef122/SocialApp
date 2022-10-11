import 'dart:core';

class NewPostModel{
  String? name;
  String? uId;
  String? image;
  String? DataTime;
  String? PostPhoto;
  String? text;


  NewPostModel({
    this.name,
    this.uId,
    this.DataTime,
    this.image,
    this.PostPhoto,
    this.text
  });

  NewPostModel.fromJson(Map<String,dynamic>?json){
    name=json!['name'];
    uId=json['uId'];
    DataTime=json['DataTime'];
    PostPhoto=json['PostPhoto'];
    image=json['image'];
    text=json['text'];
  }

  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'DataTime':DataTime,
      'PostPhoto':PostPhoto,
      'image':image,
      'text':text,
      'uId':uId,
    };
  }

}
