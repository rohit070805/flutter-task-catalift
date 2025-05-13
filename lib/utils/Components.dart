import 'package:catalifttask/utils/constants.dart';
import 'package:flutter/material.dart';

import 'Colors.dart';

class Components{

  PreferredSizeWidget buildAnimatedAppBar(AnimationController _controller,
      Animation<Offset> _slideAnimation,Size size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(size.height*0.14),
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              AppBar(

                backgroundColor: AppColor.appColor,
                leading: SizedBox(),
                leadingWidth: 20,
                title: Text("C A T A L I F T",style: TextStyle(color: Colors.white),),
                //leading: Text(,style: TextStyle(color: Colors.white),),
                actions: [
                  Icon(Icons.person,color: Colors.white,size: 25,),
                  SizedBox(width: 20,),
                  Icon(Icons.notifications_on_outlined,color: Colors.white,size: 25,),
                  SizedBox(width: 20,),
                  Icon(Icons.comment_outlined,color: Colors.white,size: 25,),
                  SizedBox(width: 30,)
                ],
              ),
              Container(
                height: size.height*0.075,
                child: Stack(
                  children: [
                    Container(
                      height: size.height*0.05,
                      decoration: BoxDecoration(
                        color: AppColor.appColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(36),
                          bottomLeft: Radius.circular(36)

                        )
                      ),

                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow:[ BoxShadow(
                            offset: Offset(0,10),
                            blurRadius: 5,
                            color: AppColor.appColor.withOpacity(0.05)
                          )
                          ]
                        ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle:TextStyle(color: AppColor.appColor.withOpacity(0.5),fontSize: 18),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: AppColor.appColor,
                          suffixIcon: Icon(Icons.add_box_outlined),
                          suffixIconColor: AppColor.appColor
                        ),

                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget PostBuilder(){
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 5,right: 30),
          horizontalTitleGap: 10,
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 30,
          child: Icon(Icons.person,color: Colors.grey.shade700,size: 50,),),
          title: Text("Akhilesh Yadav ",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Founder at Google",style: TextStyle(color: Colors.grey,fontSize: 12),),
              Row(
                children: [
                  Text("1hr",style: TextStyle(color: Colors.grey,fontSize: 11),),
                  Text(" | ",style: TextStyle(color: Colors.grey,fontSize: 11),),
                  Text("Edited",style: TextStyle(color: Colors.grey,fontSize: 11),),

                ],
              )

            ],
          ),
          trailing: Icon(Icons.person_add_alt,color: AppColor.appColor,size: 25,),
        ),
        Padding(
          padding: const EdgeInsets.only(left:10,right: 5),
          child: ExpandableText(Constants().content),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 4,vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/postImage.png",
              fit: BoxFit.fill,),
            ),
          ),
        ),



      ],
    );
  }


}


class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;

  const ExpandableText(this.text, {this.trimLines = 3, super.key});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(text: widget.text, style: defaultTextStyle);
        final tp = TextPainter(
          text: span,
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflowing = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: TextStyle(fontSize: 12),
              maxLines: _expanded ? null : widget.trimLines,
              overflow: TextOverflow.fade,
            ),
            if (isOverflowing)
              GestureDetector(
                onTap: () => setState(() => _expanded = !_expanded),
                child: Text(
                  _expanded ? 'View Less' : 'View More',
                  style: const TextStyle(color:AppColor.appColor,fontSize: 12)
                ),
              ),

          ],
        );
      },
    );
  }
}