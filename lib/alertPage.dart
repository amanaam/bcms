import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

String messageTitle = "Empty";
String notificationAlert = "alert";
FirebaseMessaging messaging = FirebaseMessaging.instance;

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Crisis Management System'),
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
            ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              notificationAlert,
            ),
            Text(
              messageTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
