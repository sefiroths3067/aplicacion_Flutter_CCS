import 'package:flutter/material.dart';
import 'package:productos_app/providers/claim_form_provider.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/providers/reservations_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/card_container.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class Reservations_Claims extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 250),
          CardContainer(
              child: Column(
            children: [
              SizedBox(height: 10),
              Text('Reservaciones',
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: _ReservationsForm()),
            ],
          )),
          SizedBox(height: 50),
          TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'reservations'),
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: Text(
                '',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              )),
          SizedBox(height: 10),
          SizedBox(height: 10),
          CardContainer(
              child: Column(
            children: [
              SizedBox(height: 10),
              Text('Sugerencias o reclamos',
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(), child: _ClaimsForm()),
            ],
          )),
          SizedBox(height: 50),
          TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, 'claim'),
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: Text(
                '',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              )),
          SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _ReservationsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reservationsForm = Provider.of<ReservationsFormProvider>(context);

    return Container(
      child: Form(
        key: reservationsForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              //obscureText: false,
              keyboardType: TextInputType.datetime,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'ingrese fecha',
                  labelText: 'Fecha',
                  prefixIcon: Icons.calendar_today_rounded),
              onChanged: (value) => reservationsForm.fecha = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'dia/mes/año';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              //obscureText: false,
              keyboardType: TextInputType.datetime,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'ingrese Hora',
                  labelText: 'hora',
                  prefixIcon: Icons.calendar_today_rounded),
              onChanged: (value) => reservationsForm.hora = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'Hora : Minutos';
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      reservationsForm.isLoading ? 'Espere' : 'RESERVAR HORA',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: reservationsForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        if (!reservationsForm.isValidForm()) return;

                        reservationsForm.isLoading = true;

                        // ignore: todo
                        // TODO: validar si el login es correcto
                        final String? errorMessage =
                            await authService.reservations(
                                reservationsForm.fecha, reservationsForm.hora);

                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(context, 'HomePage');
                        } else {
                          // ignore: todo
                          // TODO: mostrar error en pantalla
                          // print( errorMessage );
                          NotificationsService.showSnackbar(errorMessage);
                          reservationsForm.isLoading = false;
                        }
                      })
          ],
        ),
      ),
    );
  }
}

class _ClaimsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final claimsForm = Provider.of<ClaimFormProvider>(context);

    return Container(
      child: Form(
        key: claimsForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              //obscureText: false,
              keyboardType: TextInputType.datetime,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'ingrese Reclamo',
                  labelText: 'Ingrese su reclamo',
                  prefixIcon: Icons.calendar_today_rounded),
              onChanged: (value) => claimsForm.reclamo = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'Ingrese su reclamo';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              //obscureText: false,
              keyboardType: TextInputType.datetime,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'ingrese su Sugerencia',
                  labelText: 'Ingrese su sugerencia',
                  prefixIcon: Icons.calendar_today_rounded),
              onChanged: (value) => claimsForm.sugerencia = value,
              validator: (value) {
                return (value != null && value.length >= 6) ? null : '';
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                        claimsForm.isLoading
                            ? 'Espere'
                            : 'INGRESAR RECLAMO O SUGERENCIA',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center)),
                onPressed: claimsForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        if (!claimsForm.isValidForm()) return;

                        claimsForm.isLoading = true;

                        // ignore: todo
                        // TODO: validar si el login es correcto
                        final String? errorMessage = await authService.claims(
                            claimsForm.reclamo, claimsForm.sugerencia);

                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(context, 'HomePage');
                        } else {
                          // ignore: todo
                          // TODO: mostrar error en pantalla
                          // print( errorMessage );
                          NotificationsService.showSnackbar(errorMessage);
                          claimsForm.isLoading = false;
                        }
                      })
          ],
        ),
      ),
    );
  }
}
