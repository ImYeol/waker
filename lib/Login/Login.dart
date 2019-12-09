
import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/AppBloc.dart';
import 'package:flutter_study_app/Blocs/LoginUiBloc.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

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
    return Container(
      height:MediaQuery.of(context).size.height,
      child: PageView(
        children: <Widget>[loginPageState()] ,
      ),
    );
  }

  Widget loginPageState(){
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.20), BlendMode.dstATop),
          image: AssetImage('images/home3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          _loginUiBloc.icon(100.0, 30.0, Colors.white),
          _loginUiBloc.projectName(20.0, 30.0),
          
          Divider(height: 50.0,),
          _loginUiBloc.button1(context, "SIGN UP", "/SignUp"),
          _loginUiBloc.button1(context, "LOGIN", "/SignIn")
        ],
      ),
    );
  }
  
}