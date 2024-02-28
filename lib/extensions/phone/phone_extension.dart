extension PhoneStringParsing on String {
  String formatPhone() {
    var phone = this;

    phone = phone.replaceAll('%2B55', '');
    phone = phone.replaceAll('+55', '');
    phone = phone.replaceAll(RegExp(r'[^0-9]'), '');

    return '%2B55$phone';
  }


  String clearPhone() {
    var phone = this;

    phone = phone.replaceAll('%2B55', '');
    phone = phone.replaceAll('+55', '');
    phone = phone.replaceAll(RegExp(r'[^0-9]'), '');

    return phone;
  }
}


extension PhoneStringNullParsing on String? {
  String? formatPhone() {
    var phone = this;

    if(phone == null) {
      return null;
    }

    phone = phone.replaceAll('%2B55', '');
    phone = phone.replaceAll('+55', '');
    phone = phone.replaceAll(RegExp(r'[^0-9]'), '');

    return '%2B55$phone';
  }

  String? clearPhone() {
    var phone = this;

    if(phone == null) {
      return null;
    }

    phone = phone.replaceAll('%2B55', '');
    phone = phone.replaceAll('+55', '');
    phone = phone.replaceAll(RegExp(r'[^0-9]'), '');

    return phone;
  }
}