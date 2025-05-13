
import 'package:catalifttask/screens/ExplorePage.dart';
import 'package:catalifttask/utils/Colors.dart';
import 'package:catalifttask/utils/Components.dart';
import 'package:flutter/material.dart';



class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}



class _HomescreenState extends State<Homescreen>
     {

  int currentIndex = 1;
  List pages=[
    Container(
        color: Colors.white,
        child: Center(child: Text(("HOME PAGE")))),
   Explorepage(),
    Container(
      color: Colors.white,
        child: Center(child: Text(("COURSES PAGE"))))
  ];






  @override
  Widget build(BuildContext context) {

    return Scaffold(
       backgroundColor: Colors.white,
       bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 5.0,right: 5,bottom: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(

           decoration: BoxDecoration(
               color: Colors.transparent,
            boxShadow: [
              BoxShadow(
               color: AppColor.appColor.withOpacity(0.5),
                blurRadius: 25,
                offset: const Offset(8,20)
             )
               ]
           ),
             child: BottomNavigationBar(

              iconSize: 25,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              onTap: (index){
                setState(() {
                  currentIndex=index;
                });
              },
              backgroundColor: AppColor.appColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white60,
                currentIndex: currentIndex,
                items: [
              BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home",),
              BottomNavigationBarItem(icon:Icon(Icons.explore_outlined),label: "Explore Mentors"),
              BottomNavigationBarItem(icon:Icon(Icons.menu_book_outlined),label: "Courses"),


            ]),
          ),
        ),
      ),
      body: Center(
        child: pages[currentIndex],
      ),
    );
  }
}

