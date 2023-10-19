import 'package:flutter/material.dart';

class ReservationsFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String fecha = '';
  String hora = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$fecha - $hora ');

    return formKey.currentState?.validate() ?? false;
  }
}
