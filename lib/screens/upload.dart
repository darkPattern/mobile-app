import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kodikon/provider/upload_provider.dart';
import 'package:kodikon/utils/url.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> with SingleTickerProviderStateMixin {
  String _image =
      'https://ouch-cdn2.icons8.com/84zU-uvFboh65geJMR5XIHCaNkx-BZ2TahEpE9TpVJM/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvODU5/L2E1MDk1MmUyLTg1/ZTMtNGU3OC1hYzlh/LWU2NDVmMWRiMjY0/OS5wbmc.png';
  late AnimationController loadingController;

  File? _file;
  PlatformFile? _platformFile;
  String? savedResponse;
  List<String> extractedMedicine = [];

   var darkPatternResult ="";
  var generated ="";
  var reasonsOfDarkPattern = "";
  var darkPatternOrNot = "";


  Future<void> uploadFile(File file) async {
    try {
      final url = Uri.parse("${URL.url}/process"); // Replace with your upload endpoint

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
          setState(() {
            darkPatternResult = decodedResponse['dark_pattern_result'].toString();
            generated = decodedResponse['image_text'];

            // Parse the 'dark_pattern_analysis' JSON string
            var darkPatternAnalysisString = decodedResponse['dark_pattern_analysis'];
            var darkPatternAnalysisJson = json.decode(darkPatternAnalysisString);
             reasonsOfDarkPattern = darkPatternAnalysisJson['reasonsofdarkpattern'];

            // Assigning extracted data to new variables
            // (You can use regex here if needed to further process reasonsOfDarkPattern)
          });
          var imageText = decodedResponse['image_text'];
          print('Dark Pattern Result: $darkPatternResult');
          print('Reasons of Dark Pattern: $reasonsOfDarkPattern');
          print('Dark Pattern or Not: $darkPatternOrNot');
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


  selectFile() async {
    await checkPermission();

    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });
    }

    loadingController.forward();
  }


  @override
  void initState() {
    checkPermission();


    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
      setState(() {});
    });

    super.initState();
  }

  checkPermission() async {
    PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }
  final FlutterTts flutterTts = FlutterTts();
  Future<void> _speakListOfText(String textList) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);

      await flutterTts.speak(textList);
      // A small delay between each text segment being spoken
      await Future.delayed(Duration(seconds: 1));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<FileUploadProvider>(
          builder: (context, data, child) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100,),
                 // Image.network(_image, width: 300,),
                  SizedBox(height: 50,),
                  Text(
                    'Upload your file',
                    style: TextStyle(fontSize: 25,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'File should be jpg, png, or pdf',
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: selectFile,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                        dashPattern: [10, 4],
                        strokeCap: StrokeCap.round,
                        color: Colors.blue.shade400,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50.withOpacity(.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Iconsax.folder_open, color: Colors.blue,
                                size: 40,),
                              SizedBox(height: 15,),
                              Text(
                                'Select your file',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  _platformFile != null
                      ? Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selected File',
                          style: TextStyle(color: Colors.grey.shade400,
                            fontSize: 15,),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(0, 1),
                                blurRadius: 3,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              if (_platformFile!.extension == 'pdf')
                                Icon(Iconsax.add, size: 70, color: Colors.red,),
                              if (_platformFile!.extension != 'pdf')
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(_file!, width: 70,),
                                ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _platformFile!.name,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      '${(_platformFile!.size / 1024).ceil()} KB',
                                      style: TextStyle(fontSize: 13,
                                          color: Colors.grey.shade500),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      height: 5,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue.shade50,
                                      ),
                                      child: LinearProgressIndicator(
                                        value: loadingController.value,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 45,
                          onPressed: () async{
                            await uploadFile(_file!);
                           // await _speakListOfText(data.bool1);

                          },
                          color: Colors.black,
                          child: Text('Upload', style: TextStyle(
                              color: Colors.white),),
                        ),

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Extracted Result:',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                SizedBox(height: 10),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(darkPatternResult,style: TextStyle(color: Colors.white,fontSize: 20)),
                                      SizedBox(height: 10,),
                                      Text(
                                        'Reasons Of Dark Pattern:',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      Text(reasonsOfDarkPattern,style: TextStyle(color: Colors.white,fontSize: 20)),

                                      Text(
                                        'Extracted Text:',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      Text(generated,style: TextStyle(color: Colors.white,fontSize: 20)),


                                    ],
                                  ),
                              ],
                            ),
                          )


                      ],
                    ),
                  )
                      : Container(),
                  SizedBox(height: 50,),
                ],
              ),
            );
          }
      ),
    );
  }
}