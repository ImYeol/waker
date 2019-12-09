// https://pub.dev/packages/firebase_messaging#-readme-tab-
//https://medium.com/flutterpub/enabling-firebase-cloud-messaging-push-notifications-with-flutter-39b08f2ed723
// https://medium.com/@skyblazar.cc/how-to-change-the-package-name-of-your-flutter-app-4529e6e6e6fc
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/AppBloc.dart';
import 'package:flutter_study_app/Blocs/SessionInformationBloc.dart';
import 'package:flutter_study_app/Models/FriendListItem.dart';
import 'package:flutter_study_app/Models/NotificationItem.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';
import 'package:http/http.dart' as http;

class FCMRestapi {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  //BuildContext _context;
  AppBloc _appBloc;
  StreamSubscription iosSubscription;

  FCMRestapi(AppBloc appBloc) {
    //_context = context;
    _appBloc = appBloc;
    registerFCM();
  }

  registerFCM(){
    if (Platform.isIOS) {
        iOS_Permission();
    }
    print("getToken : ${_fcm.getToken()}");
    _fcm.getToken().then((token){
      print(token);
    });
    _fcm.configure(
        onMessage: (Map<String, dynamic> message) async {
            print("onMessage: $message");
            if(message.containsKey('data')) {
              SessionInformationBloc _sessionBloc = _appBloc.sessionBloc;//AppBlocProvider.of(_context).sessionBloc;
              Map<dynamic, dynamic> data = message['data'];
              print("data type : ${data['type']}");
              if(data['type'] == '0') {
                print("frined type 0");
                //_sessionBloc.updateFriendToList(FriendListItem.fromJson(data));
                _sessionBloc.updateFriendToList(FriendListItem.setResult(data['name'], data['isOnline'] == 'true'? true : false));
                
              } else if(data['type'] == '1') {
                print("frined type 1");
                _sessionBloc.addNotificationToList(NotificationItem.fromJson(data));
              }          
            }
        },
        onLaunch: (Map<String, dynamic> message) async {
          // app is from terminated to launched  
            print("onLaunch: $message");
            // TODO update all notifications and friendlist in android not ios
            SessionInformationBloc _sessionBloc = _appBloc.sessionBloc;//AppBlocProvider.of(_context).sessionBloc;
            _sessionBloc.fetchAllFriendList();
            _sessionBloc.fetchAllNotification();
            
        },
        onResume: (Map<String, dynamic> message) async {
          // app is into background
            print("onResume: $message");
            // TODO optional
        },
      ); 
      print("end");
      
  }
  
  void iOS_Permission() {
    _fcm.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _fcm.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }
}
