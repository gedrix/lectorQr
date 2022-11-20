import 'package:flutter/material.dart';
import 'package:lectorqr/pages/direcciones_page.dart';
import 'package:lectorqr/pages/mapas_paga.dart';
import 'package:lectorqr/providers/db_provider.dart';
import 'package:lectorqr/providers/scan_list_provider.dart';
import 'package:lectorqr/providers/ui_provider.dart';
import 'package:lectorqr/widgets/custom_navigatorbar.dart';
import 'package:lectorqr/widgets/scan_button.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {
              final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
              scanListProvider.borrartodos();
            }, 
            icon: Icon(Icons.delete_forever_sharp)
          )
        ],
      ),
      body: _HomePageBody(),
     bottomNavigationBar: CustomNavigationBar(),

     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
   );
  }
}


class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //obtener el select menu option

    final uiProvider = Provider.of<UiProvider>(context);

    final tempScan = new ScanModel( tipo: 'http', valor: 'http://gedrix.com');
    //todo temperal leer la bd C:\Users\Nombredesuusario\AppData\Local\Google\AndroidStudio2021.3\device-explorer\sudispositivo\data\data\com.example.{suproyecto}\app_flutter
    //  DBProvider.db.database;
    //DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.getScanById(1).then((value) => print(value!.valor));
    // DBProvider.db.getAllScans().then(print);
    //DBProvider.db.updateScan(tempScan);
    //DBProvider.db.deleteAllScan().then(print);

    //usar el ScanListProvider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    //cambiar para ir a la pag respectiva
    final currentIndex = uiProvider.selectMenuOption;
      switch (currentIndex){
        case 0:  
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();

        case 1:  
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();

        default: return MapasPage();
      }
  }
}