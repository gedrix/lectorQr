import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:lectorqr/providers/scan_list_provider.dart';
import 'package:lectorqr/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //                           '#3D8BEF', 
        //                           'Cancelar', 
        //                           false, 
        //                           ScanMode.QR
        //                         );


        final barcodeScanRes = 'https://gedrix.github.io/portafolio/';
        // final barcodeScanRes = 'geo:-0.108574,-78.472637';
        // print(barcodeScanRes);
        if (barcodeScanRes == -1) return;
        
        final scanListProvider = Provider.of<ScanListProvider>(context, listen:false);

        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        launchURL(context, nuevoScan!);
        
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}