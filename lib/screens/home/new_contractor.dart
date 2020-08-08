import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ContractWork extends StatefulWidget {
  Map work;
  String id;

  @override
  _ContractWorkState createState() => _ContractWorkState();
  ContractWork({@required this.work, @required this.id});
}

class _ContractWorkState extends State<ContractWork> {
  Map contractors;

  @override
  Widget build(BuildContext context) {
    contractors = widget.work;
    contractors.remove('Work Location');
    contractors.remove('Type');
    contractors.remove('Number of days');
    contractors.remove('Number of Workers');
    contractors.remove('Proposed Amount');
    contractors.remove('Status');
    contractors.remove('Name');
    contractors.remove('Hirer id');

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
                child: new ListView.builder(
              itemCount: contractors.length,
              itemBuilder: (BuildContext context, int index) {
                String key = contractors.keys.elementAt(index);
                return new Column(
                  children: <Widget>[
                  new SizedBox(height: 100),
                    //new Text('$key : '),
                    new Text(contractors[key][0]),
                    new Text(contractors[key][1]),
                    new Text(contractors[key][2])
                  ],
                );
              },
            )),
            SizedBox(height: 20),
            FlatButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}
