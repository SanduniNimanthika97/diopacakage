import 'package:diopackage/services/new_services_api.dart';
import 'package:flutter/material.dart';
import 'package:diopackage/models/NewsReponse.dart';
import 'models/NewsReponse.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<User>(
      future: fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
              itemBuilder: (context, index) {
                var user = (snapshot.data as List<User>)[index];
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(user.province,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                      SizedBox(height: 5),
                      Text(user.districts),
                      SizedBox(height: 5),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: (snapshot.data as List<User>).length);
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return Center(
          child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent),
        );
      },
    ));
  }
}
