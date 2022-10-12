import 'dart:developer';
import 'dart:io';

Future<bool> checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      log('internet connect');
      return true;
    }
  } on SocketException catch (e) {
    log(e.toString());
    log('internet not connect');
    return false;
  }
  log('internet not connect');
  return false;
}
