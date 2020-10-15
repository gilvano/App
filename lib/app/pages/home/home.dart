import 'package:entrega_app/app/pages/users/users.dart';
import 'package:flutter/material.dart';
import 'package:entrega_app/app/widgets/tileMenu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StartLog"),
      ),
      drawer: Container(        
        color: Colors.green,
        child: Drawer(
          child: ListView(          
            children: <Widget>[
              Divider(color: Colors.blueGrey,),            
              Column(
                children: <Widget>[
                  TileMenu(
                    label: 'Home',
                    iconData: Icons.list,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UsersPage()),
                      );
                    },                  
                  ),
                  TileMenu(
                    label: 'Usuários',
                    iconData: Icons.edit,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UsersPage()),
                      );
                    },                  
                  ),
                  TileMenu(
                    label: 'Clientes',
                    iconData: Icons.chat,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UsersPage()),
                      );
                    },                  
                  ),
                  TileMenu(
                    label: 'Fornecedores',
                    iconData: Icons.favorite,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UsersPage()),
                      );
                    },                  
                  ),
                  TileMenu(
                    label: 'Preços',
                    iconData: Icons.person,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UsersPage()),
                      );
                    },                  
                  ),
                ],
              ),
              Divider(color: Colors.blueGrey,),
            ],
          ),
        ),
      ), 
    );
  }
}
