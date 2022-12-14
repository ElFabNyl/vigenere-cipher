import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vigenere/control/brainctrl.dart';
import 'package:vigenere/screens/home/index.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Brainctrl ctrl = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset('assets/images/uy1.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 350,
                          child: TextLiquidFill(
                            boxBackgroundColor: Colors.white,
                            boxHeight: 105,
                            text: 'PRACTICAL CRYPTOGRAPHY WORK',
                            textAlign: TextAlign.center,
                            waveColor: const Color(0xff3F0071),
                            textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      'INFO 3145',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      'REGISTER',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.8,
                          fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          //Do something with the user input.
                          ctrl.userName.value = value;
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          hintText: 'Enter User name',
                          filled: true,
                          fillColor: Color.fromARGB(255, 245, 245, 245),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xff3F0071),
                          ),
                          labelStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          //Do something with the user input.
                          ctrl.userEmail.value = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          hintText: 'Enter Email',
                          filled: true,
                          fillColor: Color.fromARGB(255, 245, 245, 245),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xff3F0071),
                          ),
                          labelStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Obx(()=> Column(
                    children: [
                       TextFormField(
                          onChanged: (value) {
                            //Do something with the user input.
                            ctrl.userPassword.value = value;
                          },
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            filled: ctrl.isInvisible.value,
                            fillColor: const Color.fromARGB(255, 245, 245, 245),
                            suffixIcon: IconButton(onPressed: (){
                              ctrl.isInvisible.value = !ctrl.isInvisible.value;
                            }, icon: const Icon(
                              Icons.remove_red_eye,
                              color: Color(0xff3F0071),
                            ),),
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Color(0xff3F0071),
                            ),
                            labelStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                          ),
                        ),
                      
                    ],
                  ),)
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    //

                    if (ctrl.userName.value.isEmpty ||
                        ctrl.userEmail.value.isEmpty ||
                        ctrl.userPassword.value.isEmpty) {
                      Get.snackbar("NOTIFICATION", "please fill all the inputs",
                          icon: const Icon(Icons.info, color: Colors.red),
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 6));
                    } else if (!GetUtils.isEmail(ctrl.userEmail.value)) {
                      Get.snackbar(
                          "NOTIFICATION", "The email entered is wrong !",
                          icon: const Icon(Icons.info, color: Colors.red),
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 6));
                    } else if (ctrl.userPassword.value.length < 6) {
                      Get.snackbar("NOTIFICATION",
                          "The password must have at least 6 digits !",
                          icon: const Icon(Icons.info, color: Colors.red),
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 6));
                    } else {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString('email', ctrl.userEmail.value);
                      pref.setString('name', ctrl.userName.value);
                      pref.setString('password', ctrl.userPassword.value);
                      Get.offAll(() => const Index());
                      Get.snackbar("NOTIFICATION",
                          "you've successfully register to the app",
                          icon: const Icon(Icons.info, color: Colors.green),
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 6));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff3F0071),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 13.0),
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
