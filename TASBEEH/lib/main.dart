import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'create.dart';
import 'package:tasbeeh/create.dart';
import 'package:tasbeeh/select.dart';
import 'home.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    title: 'Tasbeeh App',
    home: new createTasbeeh(),
  ));
}