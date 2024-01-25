import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:kodikon/repo/home_repo.dart';

import 'dart:convert';

import 'package:kodikon/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

// label(String summary, String sentiment, String tag) async {
//   try {
//     final response = await _homeRepo.label(summary, sentiment, tag);
//     final responseData = json.decode(response);
//
//     print(responseData);
//
//     Fluttertoast.showToast(
//       msg: responseData.toString(),
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       fontSize: 16.0,
//     );
//   } catch (error) {
//     print("Error: $error");
//     Fluttertoast.showToast(
//       msg: "An error occurred",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       fontSize: 16.0,
//     );
//   }
//
//   notifyListeners();
// }

class FileUploadProvider extends ChangeNotifier {
  Dio dio = Dio(); // Initialize Dio instance
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<String> extractedMedicine = [];
  List<String> parsedMeds = [];

  final HomeRepository _homeRepo = HomeRepository();
  HomeRepository get homeRepo => _homeRepo;

  String? responseMessage; // To sto
  // re the response from the server

  TextEditingController _userNameController = TextEditingController();
  TextEditingController get userNameController => _userNameController;

  TextEditingController _ageController = TextEditingController();
  TextEditingController get ageController => _ageController;

  TextEditingController _weightController = TextEditingController();
  TextEditingController get weightController => _weightController;

  TextEditingController _heightController = TextEditingController();
  TextEditingController get heightController => _heightController;

  TextEditingController _bloodGroupController = TextEditingController();
  TextEditingController get bloodGroupController => _bloodGroupController;

  TextEditingController _allergiesController = TextEditingController();
  TextEditingController get allergiesController => _allergiesController;

  TextEditingController _bloodSugarController = TextEditingController();
  TextEditingController get bloodSugarController => _bloodSugarController;

  TextEditingController _bloodPressureController = TextEditingController();
  TextEditingController get bloodPressureController => _bloodPressureController;




  String userName ='';
  String  bloodPressure='';
  String  bloodSugar='';
  String  bloodGroup='';
  String  allergies='';
  String  email='';
  int age=0;
  String  genderValue='';
  String bool1 = "";
  Map<String, dynamic> results = {};

  double weight=0, height=0;
  var gender;


  var darkPatternResult ="";

  Future<void> uploadFile(File file) async {
    try {
      final url = Uri.parse("${URL.url}/process"); // Replace with your upload endpoint
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(file.path),
      });

        var request = http.MultipartRequest('POST', url);

          request.files.add(
              await http.MultipartFile.fromPath('image', file.path));
      var res = await request.send();

      if (res.statusCode == 200) {
        final respStr = await res.stream.bytesToString();
        print(respStr);

        // Decoding the JSON response
        var decodedResponse = json.decode(respStr);
        if (decodedResponse is Map<String, dynamic>) {
          var darkPatternResult = decodedResponse['dark_pattern_result'];
          var imageText = decodedResponse['image_text'];
          print('Dark Pattern Result: $darkPatternResult');
          print('Image Text: $imageText');
        } else {
          print('Response is not in expected JSON format');
        }
      } else {
        print('Non-200 status code received: ${res.statusCode}');
      }
    } catch (e) {
      print('Error during file upload: $e');
    }
  }


}
