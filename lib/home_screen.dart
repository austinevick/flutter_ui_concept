import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mvvm/detail_screen.dart';
import 'package:flutter_mvvm/main.dart';
import 'package:hashtagable/widgets/hashtag_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final pageController = PageController(viewportFraction: 0.6);
  final tabBarText = ['Popular', 'Latest', 'Friends', 'New'];
  final iconTextStyle = TextStyle(fontSize: 11);
  final f = Faker();
  int selectedIndex = 0;
  double iconSize = 18;
  ScrollController scrollController = ScrollController();
  AnimationController controller;
  Tween fontSizeAnimation;
  Animation animation;
  init() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    fontSizeAnimation = Tween<double>(begin: 16, end: 20);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    print(f.image.image());
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff014fff), Colors.white])),
        child: Column(
          children: [
            Row(
              children: [Expanded(child: buildSearchBar()), buildVideoIcon()],
            ),
            buildUsersList(),
            SizedBox(height: 20),
            buildTabBar(),
            SizedBox(height: 10),
            buildBodyContent(),
            SizedBox(height: 10)
          ],
        ),
      ),
    ));
  }

  Widget buildBodyContent() => Expanded(
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(),
          )),
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: 200,
                    width: 200,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          SizedBox(height: 8),
                          HashTagText(
                            text: "#nature #beauty",
                            decoratedStyle:
                                TextStyle(fontSize: 16.5, color: Colors.blue),
                            basicStyle: null,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              dummyText,
                              style: TextStyle(fontSize: 15.5),
                            ),
                          ),
                          Spacer(),
                          Expanded(child: buildRowIcons())
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      );
  Widget buildRowIcons() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: iconSize),
            Text('1250', style: iconTextStyle),
            SizedBox(width: 8),
            Icon(Icons.comment, size: iconSize),
            Text('1250', style: iconTextStyle),
            SizedBox(width: 8),
            Icon(Icons.reply, size: iconSize),
            (Text('1250', style: iconTextStyle))
          ],
        ),
      );
  Widget buildTabBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            tabBarText.length,
            (i) => GestureDetector(
                  onTap: () => setState(() => selectedIndex = i),
                  child: Column(
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 500),
                        child: Text(tabBarText[i]),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: selectedIndex == i
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: selectedIndex == i ? 20 : 16),
                      ),
                      SizedBox(height: 10),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                            color: selectedIndex == i
                                ? Colors.purple
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50)),
                      )
                    ],
                  ),
                )),
      );
}

Widget buildUsersList() => SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              8,
              (i) => Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xfffe7e7e),
                              ))),
                      Text(
                        'index $i',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ))),
    );

buildVideoIcon() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xfffe7e7e),
        ),
        child: Icon(Icons.video_camera_front, color: Colors.white),
      ),
    );

Widget buildSearchBar() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                focusedBorder: InputBorder.none,
                hintText: 'Search',
                enabledBorder: InputBorder.none),
          ),
        ),
      ),
    );
