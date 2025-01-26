import 'package:get/get.dart';
import 'package:intl/intl.dart';

String? onEmailValidation(String? value) {
  if (onNotEmptyValidation(value, "Email") != null) {
    return onNotEmptyValidation(value, "Email");
  }

  if (!GetUtils.isEmail(value!)) {
    return "Tolong masukkan email yang bener";
  }
  return null;
}

String? onPasswordValidation(String? value) {
  if (onNotEmptyValidation(value, "Password") != null) {
    return onNotEmptyValidation(value, "Password");
  }

  if (value!.length < 8) {
    return "Password tidak boleh kurang dari 8 karakter";
  }
  return null;
}

String? onNotEmptyValidation(String? value, String label) {
  if (value == null || value.isEmpty) {
    return "$label tidak boleh kosong";
  }
  return null;
}

String? onNumberValidation(String? value) {
  if (onNotEmptyValidation(value, "Number") != null) {
    return onNotEmptyValidation(value, "Email");
  }

  if (!GetUtils.isPhoneNumber(value!)) {
    return "Tolong masukkan nomor yang benar";
  }

  return null;
}

String? onIntValidation(String? value, String label) {
  if (onNotEmptyValidation(value, label) != null) {
    return onNotEmptyValidation(value, label);
  }

  if (!GetUtils.isNum(value!)) {
    return "Tolong masukkan angka";
  }

  return null;
}

String? onConfirmPasswordValidation(String? value, String password) {
  if (onNotEmptyValidation(value, "Password") != null) {
    return onNotEmptyValidation(value, "Password");
  }

  if (value!.length < 8) {
    return "Password tidak boleh kurang dari 8 karakter";
  }

  if (value! != password) {
    return "Password tidak sesuai";
  }

  return null;
}

String? onCheckDateAfter(String? value, String label) {
  try {
    final DateTime selectedDateTime =
        DateFormat('dd/MM/yyyy hh:mm a').parse(value ?? "");

    if (selectedDateTime.isBefore(DateTime.now())) {
      return "$label tidak boleh di masa lalu";
    }
    return null;
  } on FormatException catch (e) {
    return e.message;
  }
}
