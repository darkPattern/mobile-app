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

  double weight=0, height=0;
  var gender;

  Future<void> uploadFile(File file) async {
    try {
      print("api");
      String url =
          '${URL.url}/extract_text'; // Replace with your upload endpoint
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
      });

      Response response = await dio.post(
        url,
        data: formData,
      );

      Map<String, dynamic> responseBody = response.data;

      if (responseBody.containsKey('extracted_medicine') &&
          responseBody['extracted_medicine'] is List) {
        extractedMedicine =
            List<String>.from(responseBody['extracted_medicine']);
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('savedResponse', json.encode(responseBody));

      notifyListeners(); // Notify the listeners about the change in state
    } catch (e) {
      print('Error uploading file: $e');
      // Handle error scenarios here
    }
  }
}
