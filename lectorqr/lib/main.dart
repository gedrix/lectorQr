import 'package:flutter/material.dart';
import 'package:lectorqr/pages/home_page.dart';
import 'package:lectorqr/pages/mapa_page.dart';
import 'package:lectorqr/providers/scan_list_provider.dart';
import 'package:lectorqr/providers/ui_provider.dart';
import 'package:lectorqr/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'lector Qr',
        initialRoute: 'home',
        routes:{
          'home':(_) =>   HomePage() ,
          'mapa':(_) =>   MapaPage() ,
        },
        theme: AppTheme.lightTheme ,
        
    
      ),
    );
  }
}