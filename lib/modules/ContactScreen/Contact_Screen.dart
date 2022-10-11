import 'package:flutter/material.dart';

class Contact_Screen extends StatelessWidget {
  const Contact_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 8.0,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const Image(
                    image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/social-app-43a01.appspot.com/o/users%2Fimage_picker7746886466832961755.jpg?alt=media&token=56fa0f7e-9229-465c-bc04-5b30211f328d'
                      // 'https://img.freepik.com/free-photo/showing-tablet-s-blank-screen_155003-21288.jpg?w=1060&t=st=1664027736~exp=1664028336~hmac=d00df8d3f352c2471ce610da4d8fe778cb450a11971934b65ef51816ecce1c4d'
                    ),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.grey[200],
            child: Column(
              children: [
                Text('Eng Youssef helmy',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                          Icon(Icons.phone),
                    InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('01118875485'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,


                  children: [
                    Icon(Icons.whatsapp),

                    InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('01118875485'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(

                  children: [
                    Icon(Icons.facebook),
                    InkWell(
                      onTap: (){},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),

                          Text('https://www.facebook.com/profile'),
                          Text('.php?id=100010943953902'),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}
