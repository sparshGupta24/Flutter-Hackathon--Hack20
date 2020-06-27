import 'package:flutter/material.dart';

class TwinView extends StatefulWidget {
  Widget pageOne;

  Widget pageTwo;

  String titleOne;

  String titleTwo;

  TwinView(pageOne, pageTwo, titleOne, titleTwo){
    this.pageOne = pageOne;
    this.pageTwo = pageTwo;
    this.titleOne = titleOne;
    this.titleTwo = titleTwo;
  }

  @override
  _TwinViewState createState() => _TwinViewState(pageOne,pageTwo,titleOne,titleTwo);
}

class _TwinViewState extends State<TwinView> {
  Widget pageOne;

  Widget pageTwo;

  String titleOne;

  String titleTwo;

  _TwinViewState(pageOne, pageTwo, titleOne, titleTwo){
    this.pageOne = pageOne;
    this.pageTwo = pageTwo;
    this.titleOne = titleOne;
    this.titleTwo = titleTwo;
  }
  int curr;
  PageController pageController;
  _tab(String heading, int index) {
    return GestureDetector(
      onTap: () => setState(() {
        curr = index;
        print(curr);
        pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      }),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                heading,
                style:
                    TextStyle(color: curr == index?Color(0xffFF00A8):Colors.white, fontWeight: curr == index?FontWeight.w400:FontWeight.w200),
              ),
              Container(
                height: 4,
                width: 4,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: curr == index?Color(0xffff00a8):Colors.transparent),
              )
            ],
          ),
        ),
    );
  }
  
  @override
  void initState() {
    curr = 0;
    pageController = PageController(initialPage: 0);// TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.75 *0.1,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(children: [
            _tab(titleOne,0),
            _tab(titleTwo,1),
          ],),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.75 * 0.9,
          width: MediaQuery.of(context).size.width * 0.8,
          child: PageView(
            controller: pageController,
            children: [
              pageOne,
              pageTwo
          ],))

      ],),
    );
  }
}
