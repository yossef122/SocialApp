import 'package:flutter/material.dart';

class Stories_screen extends StatelessWidget {
  const Stories_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colors.grey,
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: .6 / 1,
            //الطول مقسوم علي العرض
            children: List.generate(
              10,
              (index) => buildStoryItem(),
            ),
          )),
    );
  }

  Widget buildStoryItem() => Container(
        height: double.infinity,
        width: double.infinity,
        child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            child: Card(
              elevation: 0.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        // color: Colors.purple,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/social-app-43a01.appspot.com/o/users%2Fimage_picker7746886466832961755.jpg?alt=media&token=56fa0f7e-9229-465c-bc04-5b30211f328d',

                                )

                            ),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          /*Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      // color: Colors.white,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.video_call_outlined,
                              size: 40,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),*/
                          /*
                    Container(
                      // height: 50,
                      // width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      // color: Colors.white,
                      child: Stack(
                        // alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
*/
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
      );
}
