import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Brainctrl extends GetxController {
  ///auth variables
  var userEmail = ''.obs;
  var isInvisible = true.obs;
  var userName = ''.obs;
  var userPassword = ''.obs;
  var showLoading = false.obs;
  //check variables for login
  var checkPassord = ''.obs;
  var checkEmail =''.obs;

    check() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.getString('email') != null
        ? checkEmail.value = sharedPreferences.getString('email')!
        : checkEmail.value = '';

        
    sharedPreferences.getString('password') != null
        ? checkPassord.value = sharedPreferences.getString('password')!
        : checkPassord.value = '';
  }

  var clearMessage = ''.obs;
  var cryptedMessage = ''.obs;
  var encryptionKey = ''.obs;
  var decryptionKey = ''.obs;

  var newClearMessage = ''.obs;
}
