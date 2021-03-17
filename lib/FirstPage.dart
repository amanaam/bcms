import 'package:flutter/material.dart';
import 'SecondPage.dart';
import 'alertPage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Crisis Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Business Crisis Management System'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Choice> items = const <Choice>[
    const Choice("Fire", "/assets/images/check.jpeg"),
    const Choice("Information Technology", "/assets/images/computer.png"),
    const Choice("Cyber Attack", "/assets/images/hacker.png"),
    const Choice("Health", "/assets/images/heart.png"),
    const Choice("Data Server", "/assets/images/server-storage.png"),
    const Choice("Data Server", "/assets/images/server-storage.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.title),
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
                    MaterialPageRoute(builder: (context) => Application()),
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
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
         children: List.generate(
            items.length,
            (index) => Center(
              child: GestureDetector(
                onTap: () {
                  print(items[index].getName());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(
                              text: items[index].getName(),
                            )),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: GridTile(
                    child: new Card(
                        elevation: 10,
                        color: Colors.white,
                        child: Icon(Icons.fireplace_outlined)),
                    footer: Center(
                      child: Text(
                        items[index].name,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //child: Image.asset(items[index].imglink),
            ),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String name;
  final String imglink;

  const Choice(this.name, this.imglink);

  String getName() {
    return this.name;
  }
}
