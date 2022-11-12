import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigenere/control/brainctrl.dart';
import 'package:vigenere/screens/auth/sign_up.dart';
import 'package:vigenere/screens/home/index.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Brainctrl ctrl = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/uy1.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
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
                      height: 8.0,
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
                      height: 8.0,
                    ),
                    const Text(
                      'SIGN  IN ',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.8,
                          fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
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
                          hintText: 'Enter email address',
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
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          //Do something with the user input.
                          ctrl.userPassword.value = value;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          hintText: 'Enter Password',
                          filled: true,
                          fillColor: Color.fromARGB(255, 245, 245, 245),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Color(0xff3F0071),
                          ),
                          prefixIcon: Icon(
                            Icons.key,
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
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    //
                    if (ctrl.userEmail.value.isEmpty ||
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
                    }else if(ctrl.checkEmail.value != ctrl.userEmail.value ||ctrl.checkPassord.value != ctrl.userPassword.value ){

                      log(ctrl.checkEmail.value);
                      log(ctrl.userEmail.value);
                      Get.snackbar("NOTIFICATION",
                          "Invalid credentatial ! verify and try again or create an account",
                          icon: const Icon(Icons.info, color: Colors.red),
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 6));
                    } else {
                      //


                      Get.offAll(() => const Index());
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
                        'Proceed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account yet? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          //
                          Get.to(() => const SignUp());
                        },
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                              color: Color(0xff3F0071),
                              fontWeight: FontWeight.w800),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
