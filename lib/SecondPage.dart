import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'alertPage.dart';

class SecondPage extends StatelessWidget {
  final String text;
  SecondPage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("'Business Crisis Management System'"),
      ),
      drawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Name"),
              accountEmail: Text("Email/id"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
            ),
            ListTile(
                title: new Text("Notifications"),
                leading: new Icon(Icons.mail),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlertPage()),
                  );
                }),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("Past Alerts"),
              leading: new Icon(Icons.info),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.fireplace_outlined,
              size: 100,
              color: Colors.yellow.shade50,
            ),
            Text(
              this.text,
              style: TextStyle(
                fontFamily: "Lucida Sans",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            // new Card(
            //
            //   elevation: 10,
            //   color: Colors.white,
            //   child: Icon(Icons.add_alert_sharp),
            // ),
            GestureDetector(
              onTap: () {
                print(this.text + "Alarm has been sent");
                
              },
            )
          ]),
        ),
      ),
    );
  }
}
