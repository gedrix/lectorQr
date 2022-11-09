import 'package:flutter/material.dart';
import 'package:lectorqr/pages/direcciones_page.dart';
import 'package:lectorqr/pages/mapas_paga.dart';
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

    //cambiar para ir a la pag respectiva
    final currentIndex = uiProvider.selectMenuOption;
      switch (currentIndex){
        case 0:  return MapasPage();

        case 1:  return DireccionesPage();

        default: return MapasPage();
      }
  }
}