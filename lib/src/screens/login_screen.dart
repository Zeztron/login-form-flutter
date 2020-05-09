import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
      validator: validateEmail,
      onSaved: (String value) => email = value,
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password'
      ),
      validator: validatePassword,
      onSaved: (String value) => password = value,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue[300],
      child: Text('Submit'),
      onPressed: () {
        bool isValid = formKey.currentState.validate();
        if (isValid) {
          formKey.currentState.save();
          print(email);
          print(password);
        }
      },
    );
  }
}