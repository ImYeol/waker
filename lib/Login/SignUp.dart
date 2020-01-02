import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/UiBloc.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{

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
          
          _UiBloc.icon(50.0, 50.0, Colors.blue),

          _UiBloc.leftRowCloum(15, "EMAIL", Colors.blue, 15.0, null),
          
          _UiBloc.inputRow(context, "jongsoo@gmail.com", 30.0, false),

          Divider( height: 20.0,),

          _UiBloc.leftRowCloum(15, "PASSWORD", Colors.blue, 15.0, null),
          _UiBloc.inputRow(context, "*********", 30.0, true),

          Divider( height: 20.0,),

          _UiBloc.leftRowCloum(15, "CONFIRM PASSWORD", Colors.blue, 15.0, null),
          _UiBloc.inputRow(context, "*********", 30.0, true),

          Divider(height: 24.0,),

          _UiBloc.rightRowCloum(context ,20, "Already have an account?", Colors.blue, 15.0, "/SignIn"),

          Divider(height: 20.0,),

          _UiBloc.button1(context, "SIGN IN", "/MainScreen"),

          Divider(height: 20.0,),
          
        ]
      )
    );
  }

}

