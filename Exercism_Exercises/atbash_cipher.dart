class AtbashCipher {
  String encode(String original) {

    original = original.toLowerCase();

    String encoded = "";
    for (int i = 0; i < original.length; i++) {
        if(encoded.replaceAll(" ", "").length%5 == 0 && encoded.replaceAll(" ", "").length != original.length && encoded.replaceAll(" ", "").length != 0 && encoded[encoded.length-1] != " ") {
            encoded += " ";
        }

        if(" .,/".contains(original[i])) {
            continue;
        }

        if("1234567890".contains(original[i])) {
            encoded += original[i];
            continue;
        }

        int ascii = original[i].codeUnitAt(0);
        ascii < 109 ? encoded += String.fromCharCode(122 - (ascii - 97)) : encoded += String.fromCharCode(97 + -(ascii - 122) );



    }

    return encoded.trim();

  }

  String decode(String original) {

    original = original.toLowerCase();

    String decoded = "";
    for (int i = 0; i < original.length; i++) {


        if(" ,./".contains(original[i])) {
            continue;
        }

        if("1234567890".contains(original[i])) {
            decoded += original[i];
            continue;
        }

        int ascii = original[i].codeUnitAt(0);
        ascii > 109 ? decoded += String.fromCharCode(122 - (ascii - 97)) : decoded += String.fromCharCode(97 + -(ascii - 122) );

    }

    

    return decoded.trim();

  }
}

void main(List<String> args) {
  AtbashCipher cipher = AtbashCipher();

  print(cipher.decode("vcvix rhn"));
}
