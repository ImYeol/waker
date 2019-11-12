import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{

  Widget signPageState() {
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
          Container(
            padding: EdgeInsets.all(50.0),
            child: Center(
              child: Icon(
                Icons.import_contacts,
                color: Colors.blue,
                size: 50.0,
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "EMAIL",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 5.0),
            alignment: Alignment.center,
            child: new TextField(
              decoration: InputDecoration(border: InputBorder.none, hintText: 'gwanjong@gmail.com'),
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0,),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.blue, width: 0.8, style: BorderStyle.solid),)
            ),
            padding: const EdgeInsets.only(left:0.0, right:10.0),
          ),

          Divider( height: 20.0,),

          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    'PASSWORD',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 5.0),
            alignment: Alignment.center,
            child: new TextField(
              decoration: InputDecoration(border: InputBorder.none, hintText: '**********'),
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0,),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.blue, width: 0.8, style: BorderStyle.solid),)
            ),
            padding: const EdgeInsets.only(left:0.0, right:10.0),
          ),

          Divider( height: 20.0,),

          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    'CONFIRM PASSWORD',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 5.0),
            alignment: Alignment.center,
            child: new TextField(
              decoration: InputDecoration(border: InputBorder.none, hintText: '**********'),
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0,),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.blue, width: 0.8, style: BorderStyle.solid),)
            ),
            padding: const EdgeInsets.only(left:0.0, right:10.0),
          ),

          Divider(height: 24.0,),

          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/SignIn'),
                ),
              ),
            ],
          ),

          Divider(height: 20.0,),

          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.blue,
                    onPressed: () => Navigator.pushNamed(context, '/SignIn'),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "SIGN UP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ]
                      )
                    )
                  )
                )
              ]
            )
          ),

          Divider(height: 20.0,),
          
        ]
      )
    );
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          signPageState(),
        ],
      ),
    );
  }
}

