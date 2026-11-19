
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            LogoApp(),
            NameApp(),
            SubtitleApp(),
            Spacer(),
          ],),
        ),
      )
    );
  }
}

class LogoApp extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo_app.png', width: 120, height: 120);
  }
}

class SubtitleApp extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Explora. Reseña. Crea.", style: TextStyle(fontSize: 20, color: Colors.white));
  }
}

class NameApp extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Voxel Review", style: TextStyle(fontSize: 40, color: Colors.white));
  }
}

