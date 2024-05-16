import 'dart:async';
import 'dart:convert';

import 'package:amped_media_admin/backendurl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  dynamic _token = null;
  DateTime? _expireyDate = DateTime.now();
  dynamic _refreshToken = null;
  dynamic autoTimer;
  bool isLogInWithFaceBook = false;
  bool isLogInWithGoogle = false;
  bool isFirstTime = true;

  String get getBaseUrl {
    return BackEndUrl.url;
  }

  bool get isAuth {
    return _token != null;
  }

  //returns the token
  dynamic get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  //sign in with email
//   Future<void> signInWithEmail(Map<String, dynamic> signInUserData) async {
//     final baseUrl = BackEndUrl.url;

//     final url = '$baseUrl/auth/signin';
//     print('url................................................$url');
//     try {
//       final response = await http.post(Uri.parse(url),
//           headers: <String, String>{'Content-Type': 'application/json'},
//           body: jsonEncode({
//             "email": signInUserData['email'],
//             "password": signInUserData['password'],
//           }));
//       print(
//         'response..................................after http.post:' +
//             response.body,
//       );

//       final extractedResponse = json.decode(response.body);
//       if (extractedResponse['message'] != null) {
//         throw '${extractedResponse['message']}';
//       }
//       // isFirstTime=false;
//       _token = extractedResponse['accessToken'];
//       print(
//           '_token:...........................................................$_token');
//       _refreshToken = extractedResponse['refreshToken'];
//       _expireyDate = DateTime.now().add(
//         Duration(
//           minutes: 15,
//         ),
//       );
//       // isFirstTime = false;
//       notifyListeners();

//       // final prefs = await SharedPreferences.getInstance();
//       isFirstTime = false;
//       // prefs.setBool("isFirstTime", false);
//       final userData = json.encode(
//         {
//           'accessToken': _token,
//           'refreshToken': _refreshToken,
//           'expireyDate': _expireyDate!.toIso8601String(),
//         },
//       );
//       // prefs.setString('userData', userData);
//     } catch (error) {
//       print('error:...............................................$error');
//       if (error.toString().contains('No address associated with hostname')) {
//         throw 'you don\'t have internet connection';
//       }
//       if (error
//           .toString()
//           .contains(' Connection closed before full header was received')) {
//         throw 'your internet connection is weak';
//       }

//       throw error;
//     }
//   }

// // signup with email
//   Future<void> signUpWithEmail(Map<String, dynamic> signUpUserData) async {
//     final baseUrl = BackEndUrl.url;

//     final url = '$baseUrl/auth/signup';
//     print('url.....................................................$url');
//     try {
//       final response = await http.post(Uri.parse(url),
//           headers: <String, String>{'Content-Type': 'application/json'},
//           body: jsonEncode({
//             "username": signUpUserData['username'],
//             "email": signUpUserData['email'],
//             "phoneNo": signUpUserData["phoneNo"],
//             "password": signUpUserData['password'],
//             "passwordConfirm": signUpUserData['password']
//           }));
//       print(
//         'response after http.post:..................................' +
//             response.body,
//       );
//       final extractedResponse = json.decode(response.body);
//       print(
//           'rsponse body:........................................................$extractedResponse');
//       if (extractedResponse['message'] != null) {
//         throw '${extractedResponse['message']}';
//       }
//       // isFirstTime = false;
//       _token = extractedResponse['accessToken'];
//       _refreshToken = extractedResponse['refreshToken'];
//       _expireyDate = DateTime.now().add(
//         Duration(
//           minutes: 15,
//         ),
//       );
//       notifyListeners();
//       // autoUpdateAccessToken();
//       // final prefs = await SharedPreferences.getInstance();
//       isFirstTime = false;
//       prefs.setBool("isFirstTime", false);
//       final userData = json.encode(
//         {
//           'accessToken': _token,
//           'refreshToken': _refreshToken,
//           'expireyDate': _expireyDate!.toIso8601String(),
//         },
//       );
//       prefs.setString('userData', userData);
//     } catch (error) {
//       throw error;
//     }
//   }
}
