import 'package:entrega_app/blocs/user/user_bloc.dart';
import 'package:entrega_app/models/user_model.dart';
import 'package:entrega_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class UserForm extends StatefulWidget {
  final UserModel user;

  const UserForm({Key key, this.user}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String dropdownValue = 'USER';
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      if (widget.user != null) {
        _formData['id'] = widget.user.id;
        _formData['username'] = widget.user.username;
        _formData['password'] = widget.user.password;
        _formData['role'] = widget.user.role;
      } else {
        _formData['role'] = dropdownValue;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    void _saveForm() async {
      _form.currentState.save();

      if (_formData['id'] == null) {
        await userBloc.saveUser(
          _formData['username'],
          _formData['password'],
          _formData['role'],
        );
      } else {
        await userBloc.editUser(UserModel(
          id: _formData['id'],
          username: _formData['username'],
          password: _formData['password'],
          role: _formData['role'],
        ));
      }

      GetIt.I.get<NavigationService>().goBack();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
        actions: [
          IconButton(
              icon: const Icon(Icons.save), onPressed: () => _saveForm()),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _form,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: _formData['username'],
                    onSaved: (value) => _formData['username'] = value,
                    decoration: InputDecoration(
                      labelText: 'Usuário',
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: _formData['password'],
                    onSaved: (value) => _formData['password'] = value,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    value: _formData['role'].toString(),
                    elevation: 16,
                    items: <String>['USER', 'ADMIN']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    onChanged: (String newValue) {
                      setState(() {
                        _formData['role'] = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3.0,
                        ),
                      ),
                      labelText: 'Nível de acesso',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(71, 130, 116, 75.0),
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
