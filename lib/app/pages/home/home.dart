import 'package:entrega_app/app/pages/users/users.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            print('tap');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UsersPage()),
            );
          },
          child: Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.account_box,
                    size: 50,
                  ),
                  title: Text('Usuários'),
                )
              ],
            ),
            elevation: 2,
          ),
        ),
      ),
    );
  }
}
