import 'package:catalifttask/utils/Components.dart';
import 'package:catalifttask/utils/constants.dart';
import 'package:flutter/material.dart';

class Explorepage extends StatefulWidget {
  const Explorepage({super.key});

  @override
  State<Explorepage> createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage> with SingleTickerProviderStateMixin{
  List<bool> liked = [false,true,true,false,false,true,true,false,false,false];
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: Components().buildAnimatedAppBar(_controller,_slideAnimation,size),

      body: ListView.builder(

          itemCount: 10,

          itemBuilder: (context, index) {
            return Column(
              children: [
                Components().PostBuilder(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 5,

                        children: [
                          InkWell(
                            onTap:   (){
                      setState(() {
                        if(liked[index])
                          {Constants.likes[index] = Constants.likes[index] -1;
                          }
                        else{
                          Constants.likes[index] = Constants.likes[index] +1;
                        }
                      liked[index]= !liked[index];
                      });},
                            child:
                                liked[index]==false?Icon(Icons.favorite_border):
                            Icon(Icons.favorite_outlined,color: Colors.redAccent,)

                          ),
                          Text(Constants.likes[index].toString())
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.comment_rounded,size: 20,),
                          Text("3.4k")
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.share_outlined,size: 20,),
                          Text("8.2k")
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,left: 8,right: 8),
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                )
              ],
            );
          }),
    );
  }
}
