import 'package:flutter/material.dart';

class ClaimFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String reclamo = '';
  String sugerencia = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$reclamo - $sugerencia');

    return formKey.currentState?.validate() ?? false;
  }
}
