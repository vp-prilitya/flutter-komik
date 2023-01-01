import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komik/router/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Komik',
      getPages: Routes.getPages,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: AppRoutes.home,
    );
  }
}
