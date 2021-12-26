import 'package:flutter/material.dart';
import 'package:flutter_mvvm/bottom_navbar_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: BottomNavBarScreen(),
      ),
    );
  }
}

const String dummyText =
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quasvelsint commodi repudiandae.';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [buildUserAppBar(), SizedBox(height: 15), buildFormField()],
      ),
    )));
  }

  Widget buildFormField() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Column(children: [
          buildTextField('ACCOUNT NUMBER', '0108874795'),
          buildTextField('BANK NAME', 'GUARANTY TRUST BANK'),
          buildTextField(
              'TRANSACTION REFERENCE', 'CF-BARTER-20211029072859280410'),
          buildTextField('STATUS', 'Successful'),
          SizedBox(height: 12),
          buildTextContainer(),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.refresh),
                label: Text('Repeat Payment')),
          ),
          SizedBox(
            width: 250,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
                onPressed: () {},
                child: Text(
                  'SEE YOUR HISTORY',
                )),
          )
        ])),
      );

  Widget buildTextField(String title, String hintText) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                  hintText: hintText, hintStyle: TextStyle(fontSize: 13)),
            )
          ],
        ),
      );
  Widget buildUserAppBar() => Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.red,
                height: 100,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(Icons.arrow_back)),
                          Text(
                            '29 Oct 2021, 08:28 PM',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share_outlined,
                                  color: Colors.white)),
                        ]),
                    Spacer(),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          Text(
                            'You sent',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Spacer(),
                          Text(
                            'N840.',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                  ],
                ),
              ),
              Container(
                height: 58,
                width: double.infinity,
                color: Colors.grey.shade200,
                alignment: Alignment.topRight,
                child: Text(
                  'to Akingbade Oluwaseyi Mobolaji',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
          Positioned(
            top: 60,
            left: 20,
            child: Container(
              height: 85,
              width: 78,
              alignment: Alignment.center,
              child: Text(
                'BS',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white, width: 5)),
            ),
          )
        ],
      );
  Widget buildTextContainer() => Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
              ),
              SizedBox(width: 8),
              Text('Send Money To \nAccount',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
              Spacer(),
              TextButton(onPressed: () {}, child: Text('Change category'))
            ],
          ),
          Divider(thickness: 2),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                color: Colors.blueGrey,
                child: Icon(Icons.add, color: Colors.white),
              ),
              SizedBox(width: 8),
              Text('Add note',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
              Spacer(),
              TextButton(onPressed: () {}, child: Text('Save'))
            ],
          ),
          Divider(thickness: 2)
        ],
      );
}
