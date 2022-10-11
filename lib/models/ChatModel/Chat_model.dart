import 'dart:core';

class ChatModel{
   String? SenderId;
   String? ReciverId;
   String? text;
   String? DateTime;

   ChatModel({
      this.SenderId,
      this.ReciverId,
      this.text,
      this.DateTime,

});

   ChatModel.fromJson(Map<String,dynamic>?json){
     SenderId=json!['SenderId'];
     ReciverId=json['ReciverId'];
     text=json['text'];
     DateTime=json['DateTime'];

   }

   Map<String,dynamic> toMap(){
     return{
       'SenderId':SenderId,
       'ReciverId':ReciverId,
       'text':text,
       'DateTime':DateTime,
     };
   }

}