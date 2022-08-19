// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, unused_field

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planture_app/constants/constants.dart';
import 'package:planture_app/pages/disease_details.dart';
import 'package:planture_app/pages/disease_profile.dart';
import 'package:planture_app/provider/fav_status.dart';
import 'package:provider/provider.dart';

class Diagnose extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiagnoseState();
  }
}

class DiagnoseState extends State<Diagnose> {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('disease')
        .orderBy('key', descending: false)
        .getDocuments();
    return qn.documents;
  }

  @override
  void initState() {
    super.initState();
    Fav provideFav = Provider.of<Fav>(context, listen: false);
    provideFav.populateIsFav2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.healing_outlined,
          color: Colors.greenAccent,
          size: 28.0,
        ),
        title: Text(
          'Diagnose',
          style: kPagetitle,
        ),
        backgroundColor: Colors.white70,
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: _optionDialogBox,
                child: Icon(
                  Icons.camera_alt,
                  size: 26.0,
                  color: Colors.greenAccent,
                ),
              )),
        ],
      ),
      body: SafeArea(child: Consumer<Fav>(builder: (context, favValues, _) {
        return Stack(children: <Widget>[
          FutureBuilder(
              future: getPosts(),
              builder: (_, snapshot) {
                if (snapshot.error == true) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          navigatDetail(snapshot.data[index]);
                        },
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Stack(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    child: Image.network(
                                      snapshot.data[index].data['avatar'],
                                      height: 150,
                                      width: MediaQuery.of(context).size.width /
                                          2.4,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.local_florist,
                                            color: Colors.greenAccent,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            snapshot
                                                .data[index].data['disease'],
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.class_,
                                            color: Colors.greenAccent,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            snapshot.data[index].data['family'],
                                            style: TextStyle(fontSize: 17.0),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ), //
                        ),
                      ),
                    );
                  },
                );
              })
        ]);
      })),
    );
  }

  navigatDetail(DocumentSnapshot post) {
    // print(post.data);
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => Disease(
          post: post,
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

  File _image;
  //Camera Method
  Future openCamera() async {
    Navigator.pop(context);

    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiseaseD(imageFile: image),
        ),
      );
      setState(() {});
    }
  }

  Future openGallery() async {
    Navigator.pop(context);

    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (picture != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiseaseD(imageFile: picture),
        ),
      );
      setState(() {});
    }
  }
}
