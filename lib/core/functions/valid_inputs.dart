import 'package:get/get.dart';

validInputs(String value, String type) {
  int minLength = 5;
  int maxLength = 25;

  if (value.isEmpty) {
    return '55'.tr;
  }

  if (type == 'username') {
    minLength = 6;
    maxLength = 20;
    if (!GetUtils.isUsername(value)) {
      return '51'.tr;
    }
  }

  if (type == 'email') {
    minLength = 8;
    maxLength = 30;
    if (!GetUtils.isEmail(value)) {
      return '52'.tr;
    }
  }

  if (type == 'phone') {
    minLength = 9;
    maxLength = 12;
    if (!GetUtils.isPhoneNumber(value)) {
      return '53'.tr;
    }
  }

  if (type == 'password') {
    minLength = 8;
    maxLength = 30;
  }

  //

  if (GetUtils.isLengthLessThan(value, minLength)) {
    return '${'56'.tr}$minLength';
  }

  if (GetUtils.isLengthGreaterThan(value, maxLength)) {
    return '${'57'.tr}$maxLength';
  }
}
