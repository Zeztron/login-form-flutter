import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.all(20.0),
       child: Form(
         key: formKey,
         child: Column(
           children: [
             emailField(),
             passwordField(),
             Container(margin: EdgeInsets.only(top: 20.0)),
             submitButton()
           ]
         )
       )
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com'
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) =>  !value.contains('@') ? 'Please enter a valid email' : null
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password'
      ),
      validator: (String value) => value.length < 4 ? 'Password must be at least 4 characters' : null
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue[300],
      child: Text('Submit'),
      onPressed: () {
        print(formKey.currentState.validate());
      },
    );
  }
}