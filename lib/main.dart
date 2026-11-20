import 'package:material_ui/material_ui.dart';
import 'package:voxel_review/screens/Create_account.dart';
import 'package:voxel_review/screens/start_screen.dart';
import 'package:voxel_review/screens/rankings_screen.dart';
import 'package:voxel_review/screens/discover_screen.dart';
//import 'screens/profile_screen.dart';
//import 'screens/novedades_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //pantalla crear cuenta
    return const MaterialApp(
      home: CreateAccount()
    );

  }
}
