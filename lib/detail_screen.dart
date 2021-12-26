import 'dart:ui';

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key key}) : super(key: key);
  final Map<IconData, String> mapList = {
    Icons.favorite: '1250',
    Icons.comment: '800',
    Icons.reply: '1250'
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              buildAppBar(),
              Spacer(),
              buildContainerContent(),
              buildTextField()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_backspace)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          ],
        ),
      );

  Widget buildContainerContent() => Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18), topLeft: Radius.circular(18))),
          child: Column(
            children: [
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: mapList.entries
                        .map(
                          (e) => Row(
                            children: [Icon(e.key), Text(e.value)],
                          ),
                        )
                        .toList()),
              ),
              buildCommentList()
            ],
          ),
        ),
      );

  Widget buildCommentList() => Expanded(
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 45,
                            width: 45,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Jerry Kat',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                              Text(
                                'Maxime mollitia, molestiae quasvelsint commodi repudiandae.',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
                      ],
                    ),
                  ),
                ),
              );
            }),
      );

  Widget buildTextField() => Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
          child: Card(
            shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20)),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 18,
                      ),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Add a comment'),
              ),
            ),
          ),
        ),
      );
}
