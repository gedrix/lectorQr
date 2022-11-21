import 'package:flutter/material.dart';
import 'package:lectorqr/models/scan_model.dart';


class MapaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

     final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar(title: Text('Mapa'),),
      body: Center(
        child: Text(scan.valor),
     ),
   );
  }
}