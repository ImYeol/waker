import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/LoginUiBloc.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{

  LoginUiBloc _loginUiBloc;

  @override
  void didChangeDependencies() {
    _loginUiBloc = AppBlocProvider.of(context).loginUibloc;
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _loginUiBloc.dispose();
    super.dispose();
  }
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          signUpPageState(),
        ],
      ),
    );
  }

  Widget signUpPageState() {
    return new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.05), BlendMode.dstATop),
          image: AssetImage('images/home3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          
          _loginUiBloc.icon(50.0, 50.0, Colors.blue),

          _loginUiBloc.leftRowCloum(15, "EMAIL", Colors.blue, 15.0, null),
          
          _loginUiBloc.inputRow(context, "jongsoo@gmail.com", 30.0, false),

          Divider( height: 20.0,),

          _loginUiBloc.leftRowCloum(15, "PASSWORD", Colors.blue, 15.0, null),
          _loginUiBloc.inputRow(context, "*********", 30.0, true),

          Divider( height: 20.0,),

          _loginUiBloc.leftRowCloum(15, "CONFIRM PASSWORD", Colors.blue, 15.0, null),
          _loginUiBloc.inputRow(context, "*********", 30.0, true),

          Divider(height: 24.0,),

          _loginUiBloc.rightRowCloum(context ,20, "Already have an account?", Colors.blue, 15.0, "/SignIn"),

          Divider(height: 20.0,),

          _loginUiBloc.button1(context, "SIGN IN", "/MainScreen"),

          Divider(height: 20.0,),
          
        ]
      )
    );
  }

}

