import 'package:flutter/material.dart';
import 'package:productos_app/services/sucursales_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sucursalesService = Provider.of<SucursalesService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Usuario'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0), //ldimenciones de la targeta
        children: <Widget>[
          _cardTipo1(context),
          SizedBox(
            height: 20.0,
          ),
          _cardTipo2(context),
          SizedBox(
            height: 20.0,
          ),
          _cardTipo3(context),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  _cardTipo1(BuildContext context) {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            FadeInImage(
              image: NetworkImage(
                  'https://previews.123rf.com/images/azvector/azvector1803/azvector180300822/97767732-icono-de-configuraci%C3%B3n-con-signo-de-configuraci%C3%B3n-icono-de-configuraci%C3%B3n-y-personalizar-configurar-a.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 200.0,
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.build_sharp, size: 40, color: Colors.blue),
              title: Text('Configuracion Parametros de Usuario',
                  textAlign: TextAlign.center),
              subtitle: Text(''),
              onTap: () => Navigator.pushNamed(context, 'settings'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     TextButton(
            //         onPressed: () =>
            //             Navigator.pushReplacementNamed(context, 'setting'),
            //         child: Text('entrar'))
            //   ],
            // )
          ],
        ));
  }

  _cardTipo2(BuildContext context) {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            FadeInImage(
              image: NetworkImage(
                  'https://califragilisticos.files.wordpress.com/2014/06/81.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.map, size: 40, color: Colors.blue),
              title:
                  Text('Seleccion de Gimnasios', textAlign: TextAlign.center),
              subtitle: Text(''),
              onTap: () => Navigator.pushNamed(context, 'gimnasios'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     TextButton(
            //         onPressed: () =>
            //             Navigator.pushReplacementNamed(context, 'setting'),
            //         child: Text('entrar'))
            //   ],
            // )
          ],
        ));
  }

  _cardTipo3(BuildContext context) {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            FadeInImage(
              image: NetworkImage(
                  'https://www.sistemaimpulsa.com/blog/wp-content/uploads/2020/06/las-ventas-como-factor-de-%C3%A9xito-en-las-empresas.png'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag_outlined,
                  size: 35, color: Colors.blue),
              title: Text('Productos', textAlign: TextAlign.center),
              subtitle: Text(''),
              onTap: () => Navigator.pushNamed(context, 'productos'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     TextButton(
            //         onPressed: () =>
            //             Navigator.pushReplacementNamed(context, 'setting'),
            //         child: Text('entrar'))
            //   ],
            // )
          ],
        ));
  }
}
