import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EncryptedMessage extends StatelessWidget {
  const EncryptedMessage({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 150, width: 150,
                child: Lottie.asset('assets/animations/checked.json'),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
