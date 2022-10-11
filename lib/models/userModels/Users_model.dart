import 'dart:core';

class SocialUserModel{
   String? name;
   String? email;
   String? uId;
   String? phone;
   String? bio;
   String? image;
   String? cover;
   bool? IsEmailVerified;

   SocialUserModel({
      this.name,
      this.email,
      this.uId,
      this.phone,
      this.bio,
      this.image,
      this.cover,
      this.IsEmailVerified
});

   SocialUserModel.fromJson(Map<String,dynamic>?json){
     name=json!['name'];
     email=json['email'];
     uId=json['uId'];
     phone=json['phone'];
     bio=json['bio'];
     image=json['image'];
     cover=json['cover'];
     IsEmailVerified=json['IsEmailVerified'];
   }

   Map<String,dynamic> toMap(){
     return{
       'name':name,
       'email':email,
       'phone':phone,
       'image':image,
       'bio':bio,
       'cover':cover,
       'uId':uId,
       'IsEmailVerified':IsEmailVerified
     };
   }

}