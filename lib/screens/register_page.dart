import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:kodikon/provider/upload_provider.dart';
import 'package:kodikon/screens/homescreen.dart';
import 'package:kodikon/screens/main_class.dart';
import 'package:kodikon/utils/functions.dart';
import 'package:provider/provider.dart';
import '../widgets/widget.dart';
import '../constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   bool passwordVisibility = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kBackgroundColor,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Image(
//             width: 24,
//             color: Colors.white,
//             image: Svg('assets/images/back_arrow.svg'),
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverFillRemaining(
//               hasScrollBody: false,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                 ),
//                 child: Column(
//                   children: [
//
//
//                     Flexible(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//
//
//
//                           const Text(
//                             "Register",
//                             style: kHeadline,
//                           ),
//                           const Text(
//                             "Create new account to get started.",
//                             style: kBodyText2,
//                           ),
//                           const SizedBox(
//                             height: 50,
//                           ),
//                           const MyTextField(
//                             hintText: 'Name',
//                             inputType: TextInputType.name,
//                           ),
//                           const MyTextField(
//                             hintText: 'Email',
//                             inputType: TextInputType.emailAddress,
//                           ),
//                           const MyTextField(
//                             hintText: 'Phone',
//                             inputType: TextInputType.phone,
//                           ),
//                           MyPasswordField(
//                             isPasswordVisible: passwordVisibility,
//                             onTap: () {
//                               passwordVisibility = !passwordVisibility;
//                             },
//                           )
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "Already have an account? ",
//                           style: kBodyText,
//                         ),
//                         Text(
//                           "Sign In",
//                           style: kBodyText.copyWith(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     MyTextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (_) => MainScreen()),
//                         );
//                       },
//                       buttonName: 'Register',
//                       bgColor: Colors.white,
//                       textColor: Colors.black87,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//








class RegisterPage extends StatefulWidget {
  static const String id = 'profile_edit_screen';
  RegisterPage({this.userId});
  final userId;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {




  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = getDeviceWidth(context);
    double screenHeight = getDeviceHeight(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Image(
            width: 24,
            color: Colors.white,
            image: Svg('assets/images/back_arrow.svg'),
          ),
        ),
      ),
        body: Consumer<FileUploadProvider>(
        builder: (context, data, child) {
          return ListView(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('Name: ',style: TextStyle(color:Colors.white),)),
                    Expanded(
                      flex: 6,
                      child: FormItem(
                        helperText: 'Name of the user',
                        hintText: 'Enter type of User Name',
                        controller: data.userNameController,
                        onChanged: (value) {
                          print('Name Saved');
                          setState(() {
                            data.userName = value;
                          });
                        },
                        isNumber: false,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0),
                child: Text(
                  'Gender : ',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Male : ', style: TextStyle(fontSize: 18,color: Colors.white),),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          data.gender = 'Male';
                        });
                      },
                      activeColor: Color(0xffE3952D),
                      value: 0,
                      groupValue: data.genderValue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Female : '                  ,style: TextStyle(fontSize: 18,color: Colors.white),
              ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          data.gender = 'Female';
                        });
                      },
                      activeColor: Color(0xffE3952D),
                      value: 1,
                      groupValue: data.genderValue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 5, 0, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('Age : ',                  style: TextStyle(fontSize: 14,color: Colors.white),
          )),
                    Expanded(
                      flex: 6,
                      child: FormItem(
                        helperText: 'Age',
                        hintText: 'Enter Age ',
                        controller: data.ageController,
                        onChanged: (value) {
                          print('Name Saved');
                          setState(() {
                            data.age = int.parse(value);
                          });
                        },
                        isNumber: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('Weight:', style: TextStyle(fontSize: 14,color: Colors.white),
          )),
                    Expanded(
                      flex: 6,
                      child: FormItem(
                        helperText: 'Weight ',
                        hintText: 'Enter weight',
                        controller: data.weightController,
                        onChanged: (value) {
                          print('Name Saved');
                          setState(() {
                            data.weight = double.parse(value);
                          });
                        },
                        isNumber: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('Height:' ,style: TextStyle(fontSize: 14,color: Colors.white),
          )),
                    Expanded(
                      flex: 6,
                      child: FormItem(
                        helperText: 'Height ',
                        hintText: 'Enter Height',
                        controller: data.heightController,
                        onChanged: (value) {
                          print('Name Saved');
                          setState(() {
                            data.height = double.parse(value);
                          });
                        },
                        isNumber: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('Blood Group :' , style: TextStyle(fontSize: 14,color: Colors.white),
          )),
                    Expanded(
                      flex: 6,
                      child: FormItem(
                        helperText: 'Weight ',
                        hintText: 'Enter Blood Group',
                        controller: data.bloodGroupController,
                        onChanged: (value) {
                          print('Name Saved');
                          setState(() {
                            data. bloodGroup = value;
                          });
                        },
                        isNumber: false,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          'Blood Pressure :', style: TextStyle(fontSize: 14,color: Colors.white),
                        )),
                    Expanded(
                      flex: 6,
                      child: FormItem(
                        helperText: 'Blood',
                        hintText: 'Enter Blood Pressure',
                        controller: data.bloodPressureController,
                        onChanged: (value) {
                          print('Name Saved');
                          setState(() {
                            data.bloodPressure = value;
                          });
                        },
                        isNumber: false,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          'Blood Sugar :',
                          style: TextStyle(fontSize: 14,color: Colors.white),
                        )),
                    Expanded(
                      flex: 6,
                      child: FormItem(
                        helperText: 'Weight ',
                        hintText: 'Enter Blood Sugar',
                        controller: data.bloodSugarController,
                        onChanged: (value) {
                          print('Name Saved');
                          setState(() {
                            data.bloodSugar = value;
                          });
                        },
                        isNumber: false,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          'Allergies :',
                          style: TextStyle(fontSize: 14),
                        )),
                    Expanded(
                      flex: 6,
                      child: FormItem(
                        hintText: 'Enter Allergies ',
                        controller: data.allergiesController,
                        onChanged: (value) {
                          print('Name Saved');
                          setState(() {
                            data. allergies = value;
                          });
                        },
                        isNumber: false,
                        helperText: 'Allergies',
                      ),
                    ),
                  ],
                ),
              ),
              MyTextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MainScreen()),
                  );
                },
                buttonName: 'Register',
                bgColor: Colors.white,
                textColor: Colors.black87,
              )
            ],
          );
        }
        ),

     );
  }
}


class FormItem extends StatelessWidget {
  final String hintText;
  final String helperText;
  final Function onChanged;
  final bool isNumber;
  final controller;

  FormItem({
    required this.hintText,
    required this.helperText,
    required this.onChanged,
    required this.isNumber,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(5),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color(0xffaf5676),
              style: BorderStyle.solid,
            ),
          ),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.indigo,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color(0xffaf5676),
              style: BorderStyle.solid,
            ),
          ),
          hintStyle: TextStyle(color: Colors.white), // Set the text color to white
        ),
        style: TextStyle(color: Colors.white), // Set the text color of the input to white
        onChanged: (String value) {
          onChanged(value);
        },
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}
