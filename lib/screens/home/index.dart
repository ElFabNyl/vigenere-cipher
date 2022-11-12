import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vigenere/control/brainctrl.dart';
import 'package:vigenere/screens/auth/sign_in.dart';
import 'package:vigenere/screens/home/encrypted_message.dart';
import 'package:vigenere/services/crypt.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    Brainctrl ctrl = Get.find();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff3F0071),
          title: const Text('GROUP NUMBER 4'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                //
                Get.offAll(() => const SignIn());
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              child: ctrl.showLoading.value
                  ?const  Padding(
                    padding:  EdgeInsets.only(top: 200.0),
                    child:  Center(
                        child: SizedBox(
                            height: 100,
                            width: 100,
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballScale,
                              colors: [Color(0xff3F0071)],
                              strokeWidth: 2,
                            )),
                      ),
                  )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Obx(
                              () => Text(
                                ctrl.userName.value,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff3F0071),
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const SizedBox(
                              width: 300,
                              child: Text(
                                'you are about to encrypt a message using Vigenere encryption.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              width: 370,
                              height: 180,
                              child: Card(
                                elevation: 5.0,
                                child: TextFormField(
                                  onChanged: (value) {
                                    //Do something with the user input.
                                    ctrl.clearMessage.value = value;
                                  },
                                  maxLines: 15,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.grey,
                                  decoration: const InputDecoration(
                                    hintText: 'Type a message...',
                                    labelStyle: TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              height: 60,
                              width: 370,
                              child: Card(
                                elevation: 5.0,
                                child: TextFormField(
                                  onChanged: (value) {
                                    //Do something with the user input.
                                    ctrl.encryptionKey.value = value;
                                  },
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.grey,
                                  obscureText: ctrl.isInvisible.value,
                                  decoration: InputDecoration(
                                    hintText: 'Enter the encryption key',
                                    prefixIcon: const Icon(
                                      Icons.qr_code,
                                      color: Color(0xff3F0071),
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          //
                                          ctrl.isInvisible.value =
                                              !ctrl.isInvisible.value;
                                        },
                                        icon: const Icon(
                                          Icons.remove_red_eye,
                                          color: Color(0xff3F0071),
                                        )),
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18.0,
                            ),
                            GestureDetector(
                              onTap: () async {
                                //
                                if (ctrl.clearMessage.value == '' ||
                                    ctrl.encryptionKey.value == '') {
                                  Get.snackbar("NOTIFICATION",
                                      "The Key or the message can't be null !",
                                      icon: const Icon(Icons.info,
                                          color: Colors.red),
                                      snackPosition: SnackPosition.BOTTOM,
                                      duration: const Duration(seconds: 6));
                                  ctrl.showLoading.value = false;
                                  Get.back();
                                } else {
                                  ctrl.showLoading.value = true;
                                  await Future.delayed(
                                      const Duration(seconds: 3));
                                  var res = await Brain.encrypt(
                                      ctrl.clearMessage.value,
                                      ctrl.encryptionKey.value);
                                  if (res != '') {
                                    ctrl.cryptedMessage.value = res;
                                    Get.offAll(() => const EncryptedMessage());
                                    ctrl.showLoading.value = false;
                                  } else {
                                    Get.snackbar("NOTIFICATION",
                                        "The email entered is wrong !",
                                        icon: const Icon(Icons.info,
                                            color: Colors.red),
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: const Duration(seconds: 6));
                                    ctrl.showLoading.value = false;
                                    Get.back();
                                  }
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
                                    'Encrypt Message',
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
                        )
                      ],
                    ),
            ),
          ),
        ));
  }
}
