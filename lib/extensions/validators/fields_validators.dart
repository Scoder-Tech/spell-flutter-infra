import 'package:flutter/material.dart';

const List<String> _blockList = [
  '00000000000',
  '11111111111',
  '22222222222',
  '33333333333',
  '44444444444',
  '55555555555',
  '66666666666',
  '77777777777',
  '88888888888',
  '99999999999',
  '12345678909'
];

abstract class Validators {
  Validators._();

  ///validar espaçço eaail
  static FormFieldValidator<String> spaceEmail(String messageKey) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      var emailRegex = RegExp(r"^\S+@\S+\.\S+$");
      if (emailRegex.hasMatch(value!)) return null;
      return messageKey;
    };
  }

  /// Validar um campo de telefone
  static FormFieldValidator<String> phone(String messageKey) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      RegExp digitsRegex = RegExp(r'^\d{10,11}$');

      var newValue = value?.replaceAll(new RegExp(r'[^0-9]'), '');

      if (digitsRegex.hasMatch(newValue!)) return null;
      return messageKey;
    };
  }

  static FormFieldValidator<String> strong(String messageKey) {
    return (value) {
      String pattern =
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      RegExp regExp = RegExp(pattern);
      if (regExp.hasMatch(value ?? '')) {
        return null;
      }

      return messageKey;
    };
  }

  /// Validar que o campo é [obrigatorio]
  /// Validators.required('Campo obrigatório')
  static FormFieldValidator<String> required(String messageKey) {
    return (value) {
      if (value?.isEmpty ?? true) {
        return messageKey;
      }
      return null;
    };
  }

  /// Validar quantidade [minima] de caracteres no campo
  /// Validators.min(4, 'Mínimo 4 caracteres')
  static FormFieldValidator<String> min(num min, String messageKey) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if ((value?.length ?? 0) < min) return messageKey;
      return null;
    };
  }

  /// Validar quantidade [maxima] de caracteres no campo
  /// Validators.min(4, 'Máximo 4 caracteres')
  static FormFieldValidator<String> max(num max, String messageKey) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if ((value?.length ?? 0) > max) return messageKey;
      return null;
    };
  }

  /// Validar se o campo está entre a quantidade [minima] e [maxima] de caracteres
  /// Validators.between(6, 10, 'Senha deve conter entre 6 e 10 dígitos')
  static FormFieldValidator<String> between(
    int minimumLength,
    int maximumLength,
    String errorMessage,
  ) {
    assert(minimumLength < maximumLength);
    return multiple([
      min(minimumLength, errorMessage),
      max(maximumLength, errorMessage),
    ]);
  }

  /// Validar se todos os caracteres são [numeros]
  /// Validators.number('O valor não é número')
  static FormFieldValidator<String> number(String messageKey) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if (double.tryParse(value!) != null) {
        return null;
      } else {
        return messageKey;
      }
    };
  }

  /// Validar se é um [email]
  /// Validators.email('E-mail inválido')
  static FormFieldValidator<String> email(String messageKey) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      var emailRegex = RegExp(
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
      if (emailRegex.hasMatch(value!)) return null;
      return messageKey;
    };
  }

  /// Validar se é um [cpf]
  /// Validators.cpf('CPF Inválido')
  static FormFieldValidator<String> cpf(String messageKey) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if (CpfValidator.isValid(value!)) {
        return null;
      } else {
        return messageKey;
      }
    };
  }

  /// Validar se é um [cnpj]
  /// Validators.cnpj('CNPJ Inválido')
  static FormFieldValidator<String> cnpj(String messageKey) {
    return (value) {
      if (value?.isEmpty ?? true) return null;
      if (_CNPJValidator.isValid(value!)) {
        return null;
      } else {
        return messageKey;
      }
    };
  }

  /// Validar [varias] regras simultaneas
  /// Validators.multiple([
  ///   Validators.email('E-mail inválido')
  ///   Validators.max(4, 'Máximo 4 caracteres')
  /// ])
  static FormFieldValidator<String> multiple(
    List<FormFieldValidator<String>> values,
  ) {
    return (value) {
      for (var validator in values) {
        var result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  /// Validar se [data] é válida
  /// Validators.date('Data inválida')
  static FormFieldValidator<String> date(
    String messageKey, {
    String? inputFormat,
    String? outputFormat,
  }) {
    return (value) {
      var date = DateTime.tryParse(value ?? '');
      if (date == null) {
        return messageKey;
      }
      return null;
    };
  }

  /// [Comparar] dois campos
  /// Validators.compare(inputController, 'As senhas são diferentes')
  static FormFieldValidator<String> compare(
    TextEditingController? controller,
    String messageKey,
  ) {
    return (value) {
      var textCompare = controller?.text ?? '';
      if (value == null || textCompare != value) {
        return messageKey;
      }
      return null;
    };
  }
}

class CpfValidator {
  static const stripRegex = r'[^\d]';
  static int _verifierDigit(String cpf) {
    List<int> numbers =
        cpf.split('').map((number) => int.parse(number, radix: 10)).toList();
    int modulus = numbers.length + 1;
    List<int> multiplied = [];
    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }
    int mod = multiplied.reduce((buffer, number) => buffer + number) % 11;
    return (mod < 2 ? 0 : 11 - mod);
  }

  static String strip(String cpf) {
    RegExp regExp = RegExp(stripRegex);
    return cpf.replaceAll(regExp, '');
  }

  static bool isValid(String cpf, [stripBeforeValidation = true]) {
    if (stripBeforeValidation) {
      cpf = strip(cpf);
    }
    if (cpf.isEmpty) {
      return false;
    }
    if (cpf.length != 11) {
      return false;
    }
    if (_blockList.contains(cpf)) {
      return false;
    }
    String numbers = cpf.substring(0, 9);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();
    return numbers.substring(numbers.length - 2) ==
        cpf.substring(cpf.length - 2);
  }
}

class _CNPJValidator {
  static const stripRegex = r'[^\d]';
  static int _verifierDigit(String cnpj) {
    int index = 2;
    List<int> reverse =
        cnpj.split('').map((s) => int.parse(s)).toList().reversed.toList();
    int sum = 0;
    for (var number in reverse) {
      sum += number * index;
      index = (index == 9 ? 2 : index + 1);
    }
    int mod = sum % 11;
    return (mod < 2 ? 0 : 11 - mod);
  }

  static String strip(String cnpj) {
    RegExp regex = RegExp(stripRegex);
    return cnpj.replaceAll(regex, '');
  }

  static bool isValid(String cnpj, [stripBeforeValidation = true]) {
    if (stripBeforeValidation) {
      cnpj = strip(cnpj);
    }
    if (cnpj.isEmpty) {
      return false;
    }
    if (cnpj.length != 14) {
      return false;
    }
    if (_blockList.contains(cnpj)) {
      return false;
    }
    String numbers = cnpj.substring(0, 12);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();
    return numbers.substring(numbers.length - 2) ==
        cnpj.substring(cnpj.length - 2);
  }
}
