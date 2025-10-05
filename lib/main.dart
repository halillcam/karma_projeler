import 'package:flutter/material.dart';
import 'package:karma_projeler/Sepet/views/sepet_view.dart';
import 'package:karma_projeler/getx_tekrar/increment/increment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const SepetView(),
    );
  }
}
