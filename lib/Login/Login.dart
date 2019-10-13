
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

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
          Container(
            padding: EdgeInsets.only(top: 250.0),
            child: Center(
              child: Icon(Icons.import_contacts, color: Colors.white, size: 40.0,),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "GwanJong   ",
                  style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: 'Mansalva'),
                ),
                Text(
                  "Project",
                  style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'Mansalva'),
                )
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 100.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: new OutlineButton(
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.red,
                    highlightedBorderColor: Colors.white,
                    onPressed: () => gotoSignup(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0,),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "SIGN UP",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Futura'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
                    color: Colors.blue,
                    onPressed: () => gotoLogin(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Futura'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  gotoSignup(){
    print("SIGN UP Clicked");
    Navigator.pushNamed(context, '/SignUp');
  } 

  gotoLogin(){
    print("LOGIN Clicked");
    Navigator.pushNamed(context, '/SignIn');
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
}