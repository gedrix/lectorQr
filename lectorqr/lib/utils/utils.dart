

import 'package:flutter/material.dart';
import 'package:lectorqr/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
 
  if (scan.tipo == 'http') {
    //abrir el sitio web
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
    // } else {
    //   throw 'Could not launch $url';
    // }

    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) throw '';
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}

