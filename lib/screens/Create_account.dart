import 'package:material_ui/material_ui.dart';
import 'start_screen.dart';

// Pantalla principal.
class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

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
                LogoApp(),
                NameApp(),
                SubtitleApp(),
                SizedBox(height: 28),
                RegisterForm(),
                SizedBox(height: 22),
                TermsText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Contenedor del formulario.
class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

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
          CrearCuentaTitle(),
          SizedBox(height: 20),
          UsernameForm(),
          SizedBox(height: 12),
          EmailForm(),
          SizedBox(height: 12),
          PasswordForm(),
          SizedBox(height: 12),
          ConfirmPasswordForm(),
          SizedBox(height: 20),
          CreateAccountButton(),
          SizedBox(height: 10),
          BackToLoginButton(),
        ],
      ),
    );
  }
}

// Título del formulario.
class CrearCuentaTitle extends StatelessWidget {
  const CrearCuentaTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Crear cuenta',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Campo de nombre de usuario.
class UsernameForm extends StatelessWidget {
  const UsernameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Nombre de usuario',
        labelStyle: const TextStyle(
          color: Color(0xFFC9C4CF),
        ),
        suffixIcon: const Icon(
          Icons.person_outline,
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

// Campo para confirmar la contraseña.
class ConfirmPasswordForm extends StatelessWidget {
  const ConfirmPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Confirmar contraseña',
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

// Botón de crear cuenta.
class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

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
      child: const Text('Crear cuenta'),
    );
  }
}

// Botón para regresar al inicio de sesión.
class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pop(context);
      },
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
      child: const Text('Ya tengo cuenta'),
    );
  }
}