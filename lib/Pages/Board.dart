import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
 
   // UiBloc _UiBloc;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black),
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  double _sliderDurationMusic = 50.0;
  double _sliderVolume = 0.5;

  var tmp_time = 0;
  bool isStarted = false;
  _MyHomePageState(){
    print(context.hashCode);
  }

  void toggleTime(){
    if(isStarted){
      isStarted = false;
    }else{
      isStarted = true;
      tmp_time = tmp_time + 1;
      sleep(Duration());
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return new Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
                  "GwanJong",
                  style: TextStyle(color: Colors.white, fontSize: 50.0, fontFamily: 'Mansalva'),
            ),
            _buildWidgetAlbumCoverBlur(mediaQuery),
            // _buildWidgetContainerMusicPlayer(mediaQuery),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.people, size: 70, color: Colors.white,),
                ),
                Column(
                  children: [
                    Text('{ID}s Profile',style: TextStyle(fontSize:30, color: Colors.white, fontFamily: 'Futura')),
                    Text('Total time:{time}', style: TextStyle(fontSize:20, color: Colors.white, fontFamily: 'Futura')),
                  ]
                )
              ]
            ),
            SizedBox(height: 20,),
            RaisedButton(
              
              child: Text('start study',style: TextStyle(fontSize: 50, color: Colors.white, fontFamily: 'Futura')),
              colorBrightness: Brightness.light,
            ),
          ],
        ),
      
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
      ),
    );
  }
  Widget _buildWidgetContainerMusicPlayer(MediaQueryData mediaQuery) {
    return Padding(
      padding: EdgeInsets.only(top: mediaQuery.padding.top + 16.0),
      child: Column(
        children: <Widget>[
          Text(
            "2"
          ),
          _buildWidgetActionAppBar(),
          SizedBox(height: 20.0),
          _buildWidgetPanelMusicPlayer(mediaQuery),
        ],
      ),
    );
  }

  Widget _buildWidgetPanelMusicPlayer(MediaQueryData mediaQuery) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(48.0),
            topRight: Radius.circular(48.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 36.0),
              _buildWidgetArtistPhoto(mediaQuery),
              SizedBox(height: 48.0),
              _buildWidgetLinearProgressIndicator(),
              SizedBox(height: 4.0),
              _buildWidgetLabelDurationMusic(),
              SizedBox(height: 36.0),
              _buildWidgetMusicInfo(),
              _buildWidgetControlMusicPlayer(),
              _buildWidgetControlVolume(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetControlVolume() {
    return Expanded(
      child: Center(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.volume_mute,
              color: Colors.grey.withOpacity(0.5),
            ),
            Expanded(
              child: Slider(
                min: 0.0,
                max: 1.0,
                value: _sliderVolume,
                activeColor: Colors.black,
                inactiveColor: Colors.grey.withOpacity(0.5),
                onChanged: (value) {
                  setState(() => _sliderVolume = value);
                },
              ),
            ),
            Icon(
              Icons.volume_up,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetControlMusicPlayer() {
    return Expanded(
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Icon(Icons.fast_rewind),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.pause),
              ),
            ),
            Expanded(
              child: Icon(Icons.fast_forward),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetMusicInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "TITLE",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "Campton_Light",
              fontSize: 20.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.0),
          Text(
            "Ariana Grande",
            style: TextStyle(
              fontFamily: "Campton_Light",
              color: Color(0xFF7D9AFF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetLabelDurationMusic() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "1:20",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
        Text(
          "4:45",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetLinearProgressIndicator() {
    return SizedBox(
      height: 2.0,
      child: LinearProgressIndicator(
        value: 0.3,
        valueColor: AlwaysStoppedAnimation<Color>(
          Color(0xFF7D9AFF),
        ),
        backgroundColor: Colors.grey.withOpacity(0.2),
      ),
    );
  }

  Widget _buildWidgetArtistPhoto(MediaQueryData mediaQuery) {
    return Center(
      child: Container(
        width: mediaQuery.size.width / 2.5,
        height: mediaQuery.size.width / 2.5,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
          image: DecorationImage(
            image: AssetImage(
              "assets/ariana_grande_artist_photo_3.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetActionAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Text(
            "Artist",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Campton_Light",
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetAlbumCoverBlur(MediaQueryData mediaQuery) {
    return Container(
      width: double.infinity,
      height: mediaQuery.size.height / 1.8,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image:
              AssetImage("images/home.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.0),
          ),
        ),
      ),
    );
  }

}