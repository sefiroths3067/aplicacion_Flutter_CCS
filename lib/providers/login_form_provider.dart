import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String rut = '';
  String nombres = '';
  String apellidos = '';
  String email = '';
  String password = '';
  String contacto = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$rut - $nombres - $apellidos $email - $password - $contacto');

    return formKey.currentState?.validate() ?? false;
  }
}
