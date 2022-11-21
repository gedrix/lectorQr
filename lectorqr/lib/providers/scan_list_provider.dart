import 'package:flutter/material.dart';
import 'package:lectorqr/providers/db_provider.dart';


class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = [];

  String tipoSeleccionado = 'http';

  Future<ScanModel?>nuevoScan(String valor)async{

    final nuevoScan = new ScanModel( valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    
    //asignar el id de la bd al modelo
    nuevoScan.id = id;
    if(this.tipoSeleccionado == nuevoScan.tipo){
      this.scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async{
      final scans = await DBProvider.db.getAllScans();

    this.scans = [...scans!];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo)async{
    final scans = await DBProvider.db.getScanTypo(tipo);
    this.scans = [...scans!];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrartodos()async{

    await DBProvider.db.deleteAllScan();
    this.scans=[];
    notifyListeners();

  }

  borrarScanId(int id )async{

    await DBProvider.db.deleteScan(id);
    // this.cargarScansPorTipo(this.tipoSeleccionado);
  }

}