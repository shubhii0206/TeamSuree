import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hac/models/user.dart';
import 'package:hac/screens/home/new_contractor.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hac/animation.dart';
import 'package:hac/sideDrawer.dart';
import 'package:hac/screens/authenticate/input_decoration.dart';
import 'home.dart';

final firestoreInstance = Firestore.instance;

class Display extends StatefulWidget {
  Map work;
  String id = '';

  @override
  _DisplayState createState() => _DisplayState();
  Display({@required this.work, @required this.id});
}

class _DisplayState extends State<Display> {
  final _typeController = TextEditingController();
  final _numberController = TextEditingController();
  final _daysController = TextEditingController();
  final _commentsController = TextEditingController();
  final _moneyController = TextEditingController();
  final _locationController = TextEditingController();

  bool _stat = false;
  List<bool> isSelected = [false];
  AlertDialog success = AlertDialog(title: Text("Changes Successful!"));

  @override
  void initState() {
    super.initState();
    initWork();
  }

  initWork() async {
    firestoreInstance
        .collection("Work")
        .document(widget.id)
        .get()
        .then((value) {
      setState(() {
        _stat = value['Status'];
        isSelected = [
          _stat,
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //bool _checked = true;
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text("Work Details"),
          backgroundColor: Colors.green[400],
          elevation: 0.0,
        ),
        body: Card(
          margin: EdgeInsets.all(30),
          borderOnForeground: true,
          elevation: 10,
          child: Container(
              height: 900,
              width: 400,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  child: Form(
                    child: Column(children: <Widget>[
                      SizedBox(height: 10),
                      TextFormField(
                        // key: widget.key,
                        //keyboardType: ,
                        readOnly: isSelected[0],
                        maxLines: 1,
                        controller: _typeController..text = widget.work['Type'],
                        // validator: widget.validator,
                        //textAlign: widget.textAlign,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: 'Type of work',
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 20.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        // key: widget.key,
                        //keyboardType: ,
                        readOnly: isSelected[0],
                        maxLines: 1,
                        controller: _numberController
                          ..text = widget.work['Number of Workers'],
                        // validator: widget.validator,
                        //textAlign: widget.textAlign,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: 'Number of Workers',
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 20.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        // key: widget.key,
                        //keyboardType: ,
                        readOnly: isSelected[0],
                        maxLines: 1,
                        controller: _daysController
                          ..text = widget.work['Number of days'],
                        // validator: widget.validator,
                        //textAlign: widget.textAlign,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: 'Number of days',
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 20.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        // key: widget.key,
                        //keyboardType: ,
                        readOnly: isSelected[0],
                        maxLines: 1,
                        controller: _moneyController
                          ..text = widget.work['Proposed Amount'],
                        // validator: widget.validator,
                        //textAlign: widget.textAlign,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: 'Proposed Amount',
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 20.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        // key: widget.key,
                        //keyboardType: ,
                        readOnly: isSelected[0],
                        maxLines: 1,
                        controller: _locationController
                          ..text = widget.work['Work Location'],
                        // validator: widget.validator,
                        //textAlign: widget.textAlign,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: 'Work Location',
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 20.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        // key: widget.key,
                        //keyboardType: ,
                        readOnly: isSelected[0],
                        maxLines: 2,
                        controller: _commentsController
                          ..text = widget.work['Comments'],
                        // validator: widget.validator,
                        //textAlign: widget.textAlign,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: 'Comments/Suggestions',
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 20.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      // CheckboxListTile(
                      //     title: Text("Work done?"),
                      //     value: _stat,
                      //     onChanged: (bool val) {
                      //       setState(() async {
                      //         firestoreInstance
                      //             .collection("Work")
                      //             .document(widget.id)
                      //             .setData({
                      //           'Status': !_stat,
                      //         }, merge: true).then((_) {
                      //           print('success');
                      //         });
                      //       });
                      //     }),
                      ToggleButtons(
                        children: <Widget>[
                          Icon(Icons.check),
                        ],
                        isSelected: isSelected,
                        selectedBorderColor: Colors.green[400],
                        disabledColor: Colors.grey,
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                            firestoreInstance
                                .collection("Work")
                                .document(widget.id)
                                .setData({
                              'Status': isSelected[index],
                            }, merge: true).then((_) {
                              print('success');
                            });
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Work done?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 30),
                      Row(children: [
                        Container(
                          height: 60,
                          child: RaisedButton(
                            child: Text('Contractors'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23.0),
                                side: BorderSide(color: Colors.white)),
                            color: Colors.green[400],
                            splashColor: Colors.lightGreenAccent,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ContractWork(
                                        work: widget.work, id: widget.id)),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 130),
                        Container(
                          height: 60,
                          child: RaisedButton(
                            child: Text("Save Changes"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23.0),
                                side: BorderSide(color: Colors.white)),
                            color: Colors.green[400],
                            disabledColor: Colors.grey[50],
                            splashColor: Colors.lightGreenAccent,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () async {
                              firestoreInstance
                                  .collection("Work")
                                  .document(widget.id)
                                  .setData({
                                'Type': _typeController.text,
                                'Number of Workers': _numberController.text,
                                'Number of days': _daysController.text,
                                'Proposed Amount': _moneyController.text,
                                'Comments': _commentsController.text,
                                'Work Location': _locationController.text,
                              }, merge: true).then((_) {
                                print('success');
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return success;
                                  },
                                );
                                Timer(
                                    Duration(seconds: 1),
                                    () => {
                                          Navigator.of(context).pop(),
                                          Navigator.of(context).pop(),
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Home()))
                                        });
                              });
                            },
                          ),
                        )
                      ]),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                            color: Colors.green[400],
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(6.0),
                            splashColor: Colors.greenAccent,
                            child: Text("Back",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                )),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      )
                    ]),
                  ),
                ),
              )),
        ));
  }
}
