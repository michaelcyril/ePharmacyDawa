import 'package:flutter/material.dart';
import 'package:flutter_project_template/providers/cart_management_provider.dart';
import 'package:flutter_project_template/providers/chat_management_provider.dart';
import 'package:flutter_project_template/providers/default_provider.dart';
import 'package:flutter_project_template/providers/disease_management_provider.dart';
import 'package:flutter_project_template/providers/medicine_management_provider.dart';
import 'package:flutter_project_template/providers/order_management_provider.dart';
import 'package:flutter_project_template/providers/prescription_management_provider.dart';
import 'package:flutter_project_template/providers/user_management_provider.dart';
import 'package:flutter_project_template/views/base/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DefaultProvider()),
        ChangeNotifierProvider(create: (context) => DiseaseManagementProvider()),
        ChangeNotifierProvider(create: (context) => PrescriptionManagementProvider()),
        ChangeNotifierProvider(create: (context) => OrderManagementProvider()),
        ChangeNotifierProvider(create: (context) => MedicineManagementProvider()),
        ChangeNotifierProvider(create: (context) => ChatManagementProvider()),
        ChangeNotifierProvider(create: (context) => CartManagementProvider()),
        ChangeNotifierProvider(create: (context) => UserManagementProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
