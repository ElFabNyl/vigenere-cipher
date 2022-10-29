import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigenere/control/brainctrl.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Brainctrl ctrl = Get.find();
    return Scaffold(
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
                          child: AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                'PRACTICAL CRYPTOGRAPHY WORK',
                                speed: const Duration(milliseconds: 100),
                                textAlign: TextAlign.center,
                                textStyle: ctrl.colorizeTextStyle,
                                colors: ctrl.colorizeColors,
                              ),
                              ColorizeAnimatedText(
                                'VIGENERE CIPHER',
                                speed: const Duration(milliseconds: 100),
                                textStyle: ctrl.colorizeTextStyle,
                                textAlign: TextAlign.center,
                                colors: ctrl.colorizeColors,
                              ),
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {
                              log('message');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      'INFO 3 1 4 5',
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
                      'SIGN  IN ',
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
                      horizontal: 15.0, vertical: 20.0),
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
                          fillColor: Color.fromARGB(255, 219, 219, 219),
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
                          ctrl.userEmail.value = value;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          hintText: 'Enter Password',
                          filled: true,
                          fillColor: Color.fromARGB(255, 219, 219, 219),
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
                        },
                        child: const Text(
                          'Signup',
                          style: TextStyle(color: Color(0xff3F0071), fontWeight: FontWeight.w800),
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
