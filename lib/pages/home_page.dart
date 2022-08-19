// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'dart:io';

import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planture_app/pages/plant_details.dart';
import 'package:planture_app/pages/plant_profile.dart';

import 'activity.dart';
import 'plant_disease.dart';
import 'search.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed
  // ignore: unused_field
  File _image;

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Activity(),
    Diagnose(),
    Search(),
    Settings(),
    Profile()
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Activity(); // Our first view in viewport

  @override
  void initState() {
    super.initState();
    // Provider.of<loggedUser>(context).getCurrentUser();

    ConnectivityUtils.initialize(
        serverToPing:
            "https://gist.githubusercontent.com/Vanethos/dccc4b4605fc5c5aa4b9153dacc7391c/raw/355ccc0e06d0f84fdbdc83f5b8106065539d9781/gistfile1.txt",
        callback: (response) => response.contains("This is a test!"));
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidget(
      showOfflineBanner: false,
      builder: (context, isOnline) => Scaffold(
        body: isOnline
            ? PageStorage(
                child: currentScreen,
                bucket: bucket,
              )
            : Center(
                child: Image(
                  image: AssetImage('assets/images/offline-icon-6.png'),
                  height: 300,
                  width: 300,
                ),
              ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0XFFFFFFFF),
          child: Icon(
            Icons.camera,
            size: 36,
            color: Colors.greenAccent,
          ),
          onPressed: isOnline ? _optionDialogBox : null,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: isOnline
                          ? () {
                              setState(() {
                                currentScreen =
                                    Activity(); // if user taps on this dashboard tab will be active
                                currentTab = 0;
                              });
                            }
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home_outlined,
                            color: currentTab == 0
                                ? Color(0XFF1aff1a)
                                : Colors.grey,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: currentTab == 0
                                  ? Color(0XFF7fff00)
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: isOnline
                          ? () {
                              setState(() {
                                currentScreen =
                                    Diagnose(); // if user taps on this dashboard tab will be active
                                currentTab = 1;
                              });
                            }
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.healing,
                            color: currentTab == 1
                                ? Color(0XFF1aff1a)
                                : Colors.grey,
                          ),
                          Text(
                            'Diagnose',
                            style: TextStyle(
                              color: currentTab == 1
                                  ? Color(0XFF7fff00)
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                // Right Tab bar icons

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: isOnline
                          ? () {
                              setState(() {
                                currentScreen =
                                    Search(); // if user taps on this dashboard tab will be active
                                currentTab = 2;
                              });
                            }
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.search_outlined,
                            color: currentTab == 2
                                ? Color(0XFF7fff00)
                                : Colors.grey,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(
                              color: currentTab == 2
                                  ? Color(0XFF7fff00)
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: isOnline
                          ? () {
                              setState(() {
                                currentScreen =
                                    Settings(); // if user taps on this dashboard tab will be active
                                currentTab = 3;
                              });
                            }
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color: currentTab == 3
                                ? Color(0XFF1aff1a)
                                : Colors.grey,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                              color: currentTab == 3
                                  ? Color(0XFF7fff00)
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _optionDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.greenAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Take a Picture',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  GestureDetector(
                    child: Text(
                      'Select  from Gallery',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

//Camera Method
  Future openCamera() async {
    Navigator.pop(context);

    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(imageFile: image),
        ),
      );
      setState(() {
        _image = image;
      });
    }
  }

  Future openGallery() async {
    Navigator.pop(context);

    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (picture != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(imageFile: picture),
        ),
      );
      setState(() {
        _image = picture;
      });
    }
  }
}
