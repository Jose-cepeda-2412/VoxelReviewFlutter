import 'package:material_ui/material_ui.dart';

// Barra de búsqueda reutilizada en las pantallas de Clasificación y Descubrir.
class VoxelSearchBar extends StatelessWidget {
  final String hintText;

  const VoxelSearchBar({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        cursorColor: const Color(0xFFFF2E93),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFC9C4CF),
            fontSize: 14,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFFC9C4CF),
            size: 20,
          ),
          filled: true,
          fillColor: const Color(0xFF191430),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFF2E2B5F),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFF2E2B5F),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
