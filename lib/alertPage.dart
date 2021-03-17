import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<Application> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  @override
  void initState() async {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification messageTitle = message.notification;
      AndroidNotification notificationAlert = message.notification?.android;
      print(messageTitle);
    });
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    print(initialMessage);
    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data != null) {
        Navigator.pushNamed(context, '/alertPage');
      }
    });
  }

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
