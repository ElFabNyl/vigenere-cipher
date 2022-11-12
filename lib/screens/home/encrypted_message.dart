import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:vigenere/control/brainctrl.dart';
import 'package:vigenere/screens/auth/sign_in.dart';
import 'package:vigenere/services/crypt.dart';

import 'decrypted_message.dart';

class EncryptedMessage extends StatelessWidget {
  const EncryptedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Brainctrl ctrl = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
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
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'SUCCESSFUL ENCRYPTION',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Lottie.asset(
                            'assets/animations/checked.json',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 330.0,
                      height: 180,
                      child: Card(
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ctrl.cryptedMessage.value,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {
                        //
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'ENTER THE KEY',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            content: SizedBox(
                              height: 60,
                              width: 370,
                              child: Card(
                                elevation: 5.0,
                                child: TextFormField(
                                  onChanged: (value) {
                                    //Do something with the user input.
                                    ctrl.decryptionKey.value = value;
                                  },
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.grey,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Enter the key',
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30.0)),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30.0)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel',
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              TextButton(
                                onPressed: () async {
                                  //
                                  if (ctrl.decryptionKey.value == '' ||
                                      ctrl.decryptionKey.value !=
                                          ctrl.encryptionKey.value) {
                                    Get.snackbar("NOTIFICATION",
                                        "the decryption key is wrong !",
                                        icon: const Icon(Icons.info,
                                            color: Colors.red),
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: const Duration(seconds: 6));
                                    
                                  } else {
                                    var res = await Brain.decrypt(
                                        ctrl.cryptedMessage.value,
                                        ctrl.decryptionKey.value);
                                    if (res != '') {
                                      ctrl.newClearMessage.value = res;
                                      Get.offAll(() => const DecryptedMessage());
                                    } else {
                                      Get.snackbar(
                                          "NOTIFICATION", "decryption failed !",
                                          icon: const Icon(Icons.info,
                                              color: Colors.red),
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 6));
                                    }
                                  }
                                },
                                child: const Text(
                                  'Decrypt',
                                  style: TextStyle(
                                      color: Color(0xff3F0071),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff3F0071),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 13.0),
                          child: Text(
                            'Decrypt Message',
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
            ],
          ),
        ),
      ),
    );
  }
}
