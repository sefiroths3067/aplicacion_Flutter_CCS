import 'package:flutter/material.dart';

class Gimnasios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccione un gimnasio'),
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
                  'https://califragilisticos.files.wordpress.com/2014/06/81.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 250.0,
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.map, size: 40, color: Colors.blue),
              title: Text('Gimnasio "Metamorfósis Gym" ',
                  textAlign: TextAlign.center),
              subtitle: Text(
                  'Direccion: Av.Libertador Bernardo O´Higgins 2220,Santiago de Chile',
                  textAlign: TextAlign.center),
              onTap: () => Navigator.pushNamed(context, 'reservaciones'),
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
                  'https://oasisfm.cl/oasisfm/site/artic/20201008/imag/foto_0000001320201008092909/7.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 250.0,
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.map, size: 40, color: Colors.blue),
              title:
                  Text('Gimnasio "Empower Gym"', textAlign: TextAlign.center),
              subtitle: Text(
                  'Direccion: Av.Libertador Bernardo O´Higgins 2220,Santiago de Chile',
                  textAlign: TextAlign.center),
              onTap: () => Navigator.pushNamed(context, 'reservaciones'),
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
