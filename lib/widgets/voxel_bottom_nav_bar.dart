import 'package:material_ui/material_ui.dart';

// Barra de navegación inferior flotante (estática, sin navegación funcional).
class VoxelBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const VoxelBottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  static const List<_BottomNavItemData> _items = [
    _BottomNavItemData(
      label: 'Clasificación',
      filledIcon: Icons.home,
      outlinedIcon: Icons.home_outlined,
    ),
    _BottomNavItemData(
      label: 'Descubrir',
      filledIcon: Icons.search,
      outlinedIcon: Icons.search_outlined,
    ),
    _BottomNavItemData(
      label: 'Reseñas',
      filledIcon: Icons.star,
      outlinedIcon: Icons.star_outline,
    ),
    _BottomNavItemData(
      label: 'Chats',
      filledIcon: Icons.chat,
      outlinedIcon: Icons.chat_outlined,
      unselectedTint: Colors.white,
    ),
    _BottomNavItemData(
      label: 'Perfil',
      filledIcon: Icons.person,
      outlinedIcon: Icons.person_outline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xD12A2254),
              Color(0xED191430),
            ],
          ),
          border: Border.all(
            color: const Color(0x4DFFFFFF),
            width: 1,
          ),
        ),
        child: Row(
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isSelected = index == selectedIndex;
            final iconColor = isSelected
                ? const Color(0xFFFF2E93)
                : (item.unselectedTint ?? const Color(0xFFC9C4CF));
            final textColor = isSelected
                ? const Color(0xFFFF2E93)
                : const Color(0xFFC9C4CF);

            return Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isSelected ? item.filledIcon : item.outlinedIcon,
                    size: isSelected ? 26 : 24,
                    color: iconColor,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 11,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _BottomNavItemData {
  final String label;
  final IconData filledIcon;
  final IconData outlinedIcon;
  final Color? unselectedTint;

  const _BottomNavItemData({
    required this.label,
    required this.filledIcon,
    required this.outlinedIcon,
    this.unselectedTint,
  });
}
