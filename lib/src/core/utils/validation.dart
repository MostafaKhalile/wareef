class Validator {
  String? error;

  String? isMandatory(String? data) {
    if (data == null || data == '') {
      return error = "لا يمكن ترك هذه الخانة فارغة";
    }

    return error = null;
  }

  String? isValidEmail(String? data) {
    if (data == null || data == '') {
      return error = "برجاء ادخال البريد الإلكتروني";
    }
    if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(data)) {
      return error = "برجاء ادخال بريد إلكتروني صحيح";
    }
    return error = null;
  }

  String? isValidUsername(String? data) {
    if (data == null || data == '') {
      return error = "لا يمكن ترك هذه الخانة فارغة";
    }
    if (!RegExp(r"^[a-zA-Z0-9\u0621-\u064A]+$").hasMatch(data)) {
      return error = " برجاء ادخال اسم يحتوي على حروف و ارقام فقط ";
    }
    return error = null;
  }

  String? isSaudiphoneNumber(String? data) {
    if (data == null || data == '') {
      return error = "لا يمكن ترك هذه الخانة فارغة";
    }
    if (!RegExp(r"^(00|0|)?(966|5|)(\d{9})$").hasMatch(data)) {
      return error = "  برجاء ادخال رقم سعودي صحيح";
    }
    return error = null;
  }

  String? validatePassword(String? data) {
    if (data == null || data == '') {
      return error = " برجاء ادخال كلمة المرور  صحيحة";
    }
    if (data.toString().length < 6 || data.toString().length > 12) {
      return error = "كلمة المرور يجب ان نكون  من 8 الي 12 احرف";
    }
    return error = null;
  }

  String? commericalRegister(String? data) {
    if (data == null || data == '') {
      return error = "لا يمكن ترك هذه الخانة فارغة";
    }
    if (!RegExp(r"^[a-zA-Z0-9\u0621-\u064A]+$").hasMatch(data)) {
      return error = " برجاء ادخال اسم يحتوي على حروف و ارقام فقط ";
    }
    if (data.toString().length > 10) {
      return error = "برجاء ادخال سجل تجاري صحيح";
    }
    return error = 'noError';
  }
}
