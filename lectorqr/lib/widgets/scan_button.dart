import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:lectorqr/providers/scan_list_provider.dart';
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
        // print(barcodeScanRes);

        final scanListProvider = Provider.of<ScanListProvider>(context, listen:false);

        scanListProvider.nuevoScan(barcodeScanRes);
        scanListProvider.nuevoScan('geo:07.09.1.18');
        
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}