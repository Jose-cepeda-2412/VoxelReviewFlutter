
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset('assets/images/logo_app.png', width: 120, height: 120),
          Text("Voxel Review", style: TextStyle(fontSize: 40, color: Colors.white)),
          Text("Explora. Reseña. Crea.", style: TextStyle(fontSize: 20, color: Colors.white)),
          
        ],),
      )
    );
  }
}

