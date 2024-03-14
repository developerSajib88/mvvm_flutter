import 'package:flutter/material.dart';
import 'package:mvvm_flutter/configs/dependency_injection/dependency_injection.dart' as di;
import 'package:mvvm_flutter/view/home/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ///This is dependency injection initialize method
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
