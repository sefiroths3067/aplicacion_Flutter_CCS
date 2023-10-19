import 'package:flutter/material.dart';

class ScheduleFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String fecha = '';
  String estado = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$estado - $estado');

    return formKey.currentState?.validate() ?? false;
  }
}
