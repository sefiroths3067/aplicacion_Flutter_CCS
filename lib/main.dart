import 'package:flutter/material.dart';
import 'package:productos_app/providers/claim_form_provider.dart';
import 'package:productos_app/providers/reservations_form_provider.dart';
import 'package:productos_app/screens/Productos.dart';
import 'package:productos_app/screens/gimnasios.dart';

import 'package:productos_app/screens/homePage.dart';

import 'package:productos_app/screens/reservations_claim.dart';
import 'package:productos_app/screens/user_secreen.dart';
import 'package:productos_app/services/sucursales_service.dart';

import 'package:provider/provider.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ReservationsFormProvider()),
        ChangeNotifierProvider(create: (_) => ClaimFormProvider()),
        ChangeNotifierProvider(create: (_) => SucursalesService())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Css App',
      initialRoute: 'checking',
      routes: {
        'homepage': (_) => HomePage(),
        'checking': (_) => CheckAuthScreen(),
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'settings': (_) => UserScreen(),
        'productos': (_) => Productos(),
        'gimnasios': (_) => Gimnasios(),
        'reservaciones': (_) => Reservations_Claims(),

        //'test': (_) => ProductScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.indigo),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo, elevation: 0)),
    );
  }
}
