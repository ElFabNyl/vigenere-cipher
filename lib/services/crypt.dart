class Brain {
  ///this function return verifies if a letter belongs to the alphabet
  static isAlphabet(String letter) {
    //we define an alphabet
    List alphabet = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    //we convert the input to upperCase for a better usage
    letter.toUpperCase();
    //we check wether the alphabet contrains the letter
    if (alphabet.contains(letter)) {
      return true;
    } else {
      return false;
    }
  }

  ///this function helps us to establish an association between the message and the key
  static keyFromMessage(String message, String key) {
    String keyFromMessage = '';
    int i = 0;

    for (int j = 0; j < message.length; j++) {
      if (isAlphabet(message[j].toUpperCase())) {
        keyFromMessage += key[i % key.length];
        i += 1;
      } else {
        keyFromMessage += ' ';
      }
    }
    return keyFromMessage;
  }

  ///this function will encrypt or decrypt a caracter

  static encryptDecryptChar(String plaintextChar, String keyChar, String mode) {
    plaintextChar.toUpperCase();
    int newCharPosition;

    if (isAlphabet(plaintextChar)) {
      String firstAlphabetLetter = 'A';

      int oldCharPosition =
          plaintextChar.codeUnitAt(0) - firstAlphabetLetter.codeUnitAt(0);
      int keyCharPosition =
          keyChar.toLowerCase().codeUnitAt(0) - 'a'.codeUnitAt(0);

      if (mode == 'encrypt') {
        newCharPosition = (oldCharPosition + keyCharPosition) % 26;
      } else {
        newCharPosition = (oldCharPosition - keyCharPosition + 26) % 26;
      }

      int res = (newCharPosition + firstAlphabetLetter.codeUnitAt(0));
      return String.fromCharCode(res);
    }
  }

  ///this function will encrypt a message
  ///@params : message , key

    encrypt(String message, String key) {
    String  cipherText = '';
    String paddedKEY = keyFromMessage(message, key);

    for(int i=0; i<message.length; i++){
        cipherText = cipherText + encryptDecryptChar(message[i].toUpperCase(),paddedKEY[i].toUpperCase(), 'encrypt' ).toString();
            }
     String cleanUp = cipherText.replaceAll('null', ' ');
     return cleanUp;
  }

  ///this function will decrypt a message
  ///@params : cipherText , key

 static decrypt(String cipherText, String key) {
    String clearMessage = '';
    String paddedKEY = keyFromMessage(cipherText, key);

    for (int i = 0; i < cipherText.length; i++) {
      clearMessage = clearMessage +
          encryptDecryptChar(cipherText[i].toUpperCase(),
                  paddedKEY[i].toUpperCase(), 'decrypt').toString();
    }
     String cleanUp = clearMessage.replaceAll('null', ' ');
    return cleanUp;
  }
}
