import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigenere/screens/home/encrypted_message.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3F0071),
        title: const Text('GROUP NUMBER 4'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Jonathan Kent',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff3F0071),
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: 300,
                    child: const Text(
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
                    height: 250,
                    child: Card(
                      elevation: 5.0,
                      child: TextFormField(
                        onChanged: (value) {
                          //Do something with the user input.
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
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.grey,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter the encryption key',
                          prefixIcon: const Icon(
                            Icons.qr_code,
                            color: Color(0xff3F0071),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                //
                              },
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: Color(0xff3F0071),
                              )),
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
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      //
                      Get.to(()=> const EncryptedMessage());
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
    );
  }
}
