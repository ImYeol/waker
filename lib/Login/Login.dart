
import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/UiBloc.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  UiBloc _UiBloc;

  @override
  void didChangeDependencies() {
    _UiBloc = AppBlocProvider.of(context).Uibloc;
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _UiBloc.dispose();
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
        color: Colors.white,
        // image: DecorationImage(
        //   colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.20), BlendMode.dstATop),
        //   image: AssetImage('images/home3.jpg'),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: new Column(
        children: <Widget>[
          
          // _loginUiBloc.icon(100.0, 30.0, Colors.white),
          // _loginUiBloc.projectName(20.0, 30.0),

          Divider(height: 100.0,),
          _UiBloc.smallImage(30.0, 30.0),
          _UiBloc.line1(context, "가입하세요"),
          Divider(height: 50.0,),
          _UiBloc.kakaoLoginButton(context, 20.0),
          // _loginUiBloc.button1(context, "SIGN UP", "/SignUp"),
          // _loginUiBloc.button1(context, "LOGIN", "/SignIn")
        ],
      ),
    );
  }
  
}