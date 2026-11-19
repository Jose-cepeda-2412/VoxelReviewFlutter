import 'package:material_ui/material_ui.dart';


// Pantalla principal: solo organiza los widgets.
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0D1F),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LogoApp(),
                const NameApp(),
                const SubtitleApp(),
                const SizedBox(height: 28),
                const LoginForm(),
                const SizedBox(height: 22),
                const TermsText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Contenedor del formulario de inicio de sesión.
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF191430),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IniciarSesion(),
          SizedBox(height: 20),
          EmailForm(),
          SizedBox(height: 12),
          PasswordForm(),
          Align(
            alignment: Alignment.centerRight,
            child: ForgotPassword(),
          ),
          LoginButton(),
          SizedBox(height: 10),
          RegisterButton(),
        ],
      ),
    );
  }
}

// Logo de la aplicación.
class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_app.png',
      width: 126,
      height: 126,
    );
  }
}

// Nombre de la aplicación.
class NameApp extends StatelessWidget {
  const NameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Voxel Review',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Subtítulo de la aplicación.
class SubtitleApp extends StatelessWidget {
  const SubtitleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Explora. Reseña. Crea.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFC9C4CF),
        fontSize: 13,
      ),
    );
  }
}

// Título del formulario.
class IniciarSesion extends StatelessWidget {
  const IniciarSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Iniciar sesión',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Campo de correo electrónico.
class EmailForm extends StatelessWidget {
  const EmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Correo electrónico',
        labelStyle: const TextStyle(
          color: Color(0xFFC9C4CF),
        ),
        suffixIcon: const Icon(
          Icons.email_outlined,
          color: Color(0xFFC9C4CF),
        ),
        filled: true,
        fillColor: const Color(0xFF2A2254),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}

// Campo de contraseña.
class PasswordForm extends StatelessWidget {
  const PasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Contraseña',
        labelStyle: const TextStyle(
          color: Color(0xFFC9C4CF),
        ),
        suffixIcon: const Icon(
          Icons.visibility_off_outlined,
          color: Color(0xFFC9C4CF),
        ),
        filled: true,
        fillColor: const Color(0xFF2A2254),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}

// Botón de recuperar contraseña.
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        '¿Olvidaste tu contraseña?',
        style: TextStyle(
          color: Color(0xFF00F0FF),
        ),
      ),
    );
  }
}

// Botón de iniciar sesión.
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF2E93),
        foregroundColor: const Color(0xFF040C15),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: const Text('Iniciar sesión'),
    );
  }
}

// Botón de crear cuenta.
class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF00F0FF),
        side: const BorderSide(
          color: Color(0xFF00F0FF),
        ),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: const Text('Crear cuenta'),
    );
  }
}

// Texto de términos y condiciones.
class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Al continuar acepta nuestros términos de servicio',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFC9C4CF),
        fontSize: 11,
      ),
    );
  }
}
