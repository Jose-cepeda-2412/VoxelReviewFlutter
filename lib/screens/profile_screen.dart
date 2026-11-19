import 'package:material_ui/material_ui.dart';

// Pantalla principal: solo organiza los widgets.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0D1F),
      appBar: const ProfileAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                ProfileAvatar(),
                SizedBox(height: 8),
                ProfileUsername(),
                SizedBox(height: 10),
                ProfileBio(),
                SizedBox(height: 22),
                FollowersStatsCard(),
                SizedBox(height: 16),
                ProfileActionButtons(),
                SizedBox(height: 14),
                VerifyEmailButton(),
                SizedBox(height: 22),
                ProfileTabs(),
                SizedBox(height: 20),
                MyGamesTitle(),
                SizedBox(height: 36),
                EmptyReviewsText(),
                SizedBox(height: 44),
                LogoutButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(activeIndex: 4),
    );
  }
}

// Barra superior del perfil.
class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0F0D1F),
      elevation: 0,
      leading: const Icon(Icons.arrow_back, color: Colors.white),
      centerTitle: true,
      title: const Text(
        'Mi Perfil',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.settings_outlined, color: Colors.white),
        ),
      ],
    );
  }
}

// Avatar del usuario.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.person_outline,
      size: 86,
      color: Color(0xFFC9C4CF),
    );
  }
}

// Nombre de usuario.
class ProfileUsername extends StatelessWidget {
  const ProfileUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Usuario123',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Sección de biografía del usuario.
class ProfileBio extends StatelessWidget {
  const ProfileBio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Biografía',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFC9C4CF),
            fontSize: 13,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '¡Hola! Soy un apasionado de los videojuegos',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

// Tarjeta dividida de seguidores y seguidos.
class FollowersStatsCard extends StatelessWidget {
  const FollowersStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF191430),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              children: [
                Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.group_outlined,
                        color: Color(0xFFC9C4CF), size: 16),
                    SizedBox(width: 6),
                    Text(
                      'Seguidores',
                      style: TextStyle(
                        color: Color(0xFFC9C4CF),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 42,
            color: const Color(0xFF2A2254),
          ),
          const Expanded(
            child: Column(
              children: [
                Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_add_outlined,
                        color: Color(0xFFC9C4CF), size: 16),
                    SizedBox(width: 6),
                    Text(
                      'Seguidos',
                      style: TextStyle(
                        color: Color(0xFFC9C4CF),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Botones de editar perfil y cambiar foto.
class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9BE7F5),
              foregroundColor: const Color(0xFF0F0D1F),
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: const Icon(Icons.edit_outlined, size: 18),
            label: const Text(
              'Editar perfil',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF9BE7F5),
              side: const BorderSide(color: Color(0xFF2A2254)),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: const Icon(Icons.camera_alt_outlined, size: 18),
            label: const Text(
              'Cambiar foto',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.5),
            ),
          ),
        ),
      ],
    );
  }
}

// Botón de confirmar o verificar correo.
class VerifyEmailButton extends StatelessWidget {
  const VerifyEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 260,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Color(0xFF6B6588)),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Confirmar / Verificar correo',
            style: TextStyle(fontSize: 13.5),
          ),
        ),
      ),
    );
  }
}

// Pestañas de reseñas y colección.
class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2254),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Text(
            'Reseñas',
            style: TextStyle(
              color: Color(0xFF00F0FF),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 24),
        const Text(
          'Colección',
          style: TextStyle(
            color: Color(0xFFC9C4CF),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

// Título de la sección Mis Juegos.
class MyGamesTitle extends StatelessWidget {
  const MyGamesTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Mis Juegos',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Mensaje cuando no existen reseñas publicadas.
class EmptyReviewsText extends StatelessWidget {
  const EmptyReviewsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Todavía no hay reseñas. Los juegos\nreseñados aparecerán aquí.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFC9C4CF),
        fontSize: 14,
        height: 1.4,
      ),
    );
  }
}

// Botón de cerrar sesión.
class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFFF28B82),
        side: const BorderSide(color: Color(0xFF2A2254)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      icon: const Icon(Icons.logout, size: 18),
      label: const Text(
        'Cerrar sesión',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}

// Barra de navegación inferior reutilizable.
class CustomBottomNavBar extends StatelessWidget {
  final int activeIndex;

  const CustomBottomNavBar({
    super.key,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF191430),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFF2A2254),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(
            icon: Icons.home_outlined,
            label: 'Clasificación',
            isSelected: activeIndex == 0,
          ),
          NavBarItem(
            icon: Icons.search,
            label: 'Descubrir',
            isSelected: activeIndex == 1,
          ),
          NavBarItem(
            icon: Icons.star,
            label: 'Reseñas',
            isSelected: activeIndex == 2,
          ),
          NavBarItem(
            icon: Icons.chat_bubble_outline,
            label: 'Chats',
            isSelected: activeIndex == 3,
          ),
          NavBarItem(
            icon: Icons.person,
            label: 'Perfil',
            isSelected: activeIndex == 4,
          ),
        ],
      ),
    );
  }
}

// Ítem individual de la barra de navegación inferior.
class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color color =
        isSelected ? const Color(0xFFFF2E93) : const Color(0xFFC9C4CF);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}