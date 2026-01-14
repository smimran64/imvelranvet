import 'dart:async';
import 'package:flutter/material.dart';
import 'package:imvelranvet/my_app.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        // ignore: avoid_print
        print('FlutterError caught: ${details.exceptionAsString()}');
      };

      runApp(const MyApp());
    },
    (error, stack) {
      // ignore: avoid_print
      print('Uncaught error: $error\n$stack');
    },
  );
}
