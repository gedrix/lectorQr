

import 'package:flutter/material.dart';
import 'package:lectorqr/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class MapasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount:scans.length,
        itemBuilder: (_, i)=> Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red
          ),
          onDismissed: (DismissDirection direccion) {
            Provider.of<ScanListProvider>(context, listen: false).borrarScanId(scans[i].id!);
          } ,
          child: ListTile(
            leading: Icon(Icons.map, color:Theme.of(context).primaryColor),
            title: Text(scans[i].valor),
            subtitle:Text(scans[i].id.toString()),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            onTap: () => print(scans[i].id),
          ),
        )
    );
  }
}