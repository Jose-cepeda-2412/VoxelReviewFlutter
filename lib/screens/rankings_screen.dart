import 'package:material_ui/material_ui.dart';
import 'package:voxel_review/widgets/voxel_bottom_nav_bar.dart';
import 'package:voxel_review/widgets/voxel_search_bar.dart';

// Datos quemados de críticos para la pantalla estática de clasificación.
const List<CriticData> _critics = [
  CriticData(
    position: 1,
    nick: 'PixelKing',
    reviewCount: 150,
    avatarAsset: 'assets/images/game_profile.jpg',
    isVerified: true,
  ),
  CriticData(
    position: 2,
    nick: 'VoxelMaster',
    reviewCount: 127,
    avatarAsset: 'assets/images/nemesis_profile.jpg',
    isVerified: true,
  ),
  CriticData(
    position: 3,
    nick: 'GameHunter',
    reviewCount: 104,
    avatarAsset: 'assets/images/imagen_review_persona.jpg',
    isVerified: false,
  ),
  CriticData(
    position: 4,
    nick: 'RetroGamer',
    reviewCount: 81,
    avatarAsset: 'assets/images/profile_picture.png',
    isVerified: true,
  ),
  CriticData(
    position: 5,
    nick: 'DarkPlayer',
    reviewCount: 58,
    avatarAsset: 'assets/images/imagen_login_user.png',
    isVerified: false,
  ),
  CriticData(
    position: 6,
    nick: 'SynthCritico',
    reviewCount: 42,
    avatarAsset: 'assets/images/imagen_tres.jpg',
    isVerified: true,
  ),
  CriticData(
    position: 7,
    nick: 'NeonKnight',
    reviewCount: 29,
    avatarAsset: 'assets/images/game_profile.jpg',
    isVerified: false,
  ),
];

// Pantalla principal de clasificación: solo organiza los widgets.
class RankingsScreen extends StatelessWidget {
  const RankingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topThree = _critics.take(3).toList();
    final remainingCritics = _critics.skip(3).toList();

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF0F0D1F),
      bottomNavigationBar: const VoxelBottomNavBar(selectedIndex: 0),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.4],
            colors: [
              Color(0xFF191430),
              Color(0xFF0F0D1F),
            ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const RankingsHeader(),
              const SizedBox(height: 12),
              const VoxelSearchBar(hintText: 'Buscar críticos...'),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 108),
                  children: [
                    RankingPodium(leaders: topThree),
                    const Padding(
                      padding: EdgeInsets.only(top: 18, bottom: 10),
                      child: Text(
                        'Más críticos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ...remainingCritics.map(
                      (critic) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: RankingCard(critic: critic),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Encabezado con título y subtítulo de la pantalla de clasificación.
class RankingsHeader extends StatelessWidget {
  const RankingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 18, 20, 0),
      child: Column(
        children: [
          Text(
            'Clasificación',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Críticos por número de reseñas',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFC9C4CF),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// Podio superior para los tres críticos con más reseñas (#2, #1, #3).
class RankingPodium extends StatelessWidget {
  final List<CriticData> leaders;

  const RankingPodium({
    super.key,
    required this.leaders,
  });

  @override
  Widget build(BuildContext context) {
    final podiumOrder = [leaders[1], leaders[0], leaders[2]];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: _PodiumTile(critic: podiumOrder[0], isFirst: false)),
        const SizedBox(width: 8),
        Expanded(child: _PodiumTile(critic: podiumOrder[1], isFirst: true)),
        const SizedBox(width: 8),
        Expanded(child: _PodiumTile(critic: podiumOrder[2], isFirst: false)),
      ],
    );
  }
}

// Tarjeta individual del podio de líderes.
class _PodiumTile extends StatelessWidget {
  final CriticData critic;
  final bool isFirst;

  const _PodiumTile({
    required this.critic,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    final medal = _medalStyleFor(critic.position);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            medal.gradientTop,
            const Color(0xFF191430),
          ],
        ),
        border: Border.all(
          color: isFirst ? medal.featuredBorder : medal.podiumBorder,
          width: 1,
        ),
      ),
      padding: EdgeInsets.fromLTRB(7, isFirst ? 14 : 10, 7, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '#${critic.position}',
            style: TextStyle(
              color: medal.accent,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7),
          _CriticAvatar(
            assetPath: critic.avatarAsset,
            size: isFirst ? 54 : 40,
          ),
          const SizedBox(height: 7),
          RankingUserName(
            nick: critic.nick,
            isVerified: critic.isVerified,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 7),
          Text(
            _formatReviewCount(critic.reviewCount),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: medal.accent,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Tarjeta de la lista para el resto de críticos (#4 en adelante).
class RankingCard extends StatelessWidget {
  final CriticData critic;

  const RankingCard({
    super.key,
    required this.critic,
  });

  @override
  Widget build(BuildContext context) {
    final medal = _medalStyleFor(critic.position);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF191430),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF2E2B5F),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 34),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              color: medal.badgeBackground,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${critic.position}',
              style: TextStyle(
                color: medal.accent,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          _CriticAvatar(
            assetPath: critic.avatarAsset,
            size: 38,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RankingUserName(
                  nick: critic.nick,
                  isVerified: critic.isVerified,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  centered: false,
                ),
                const SizedBox(height: 3),
                Text(
                  _formatReviewCount(critic.reviewCount),
                  style: const TextStyle(
                    color: Color(0xFFC9C4CF),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Color(0xFFC9C4CF),
            size: 18,
          ),
        ],
      ),
    );
  }
}

// Nombre del crítico con insignia de verificación si corresponde.
class RankingUserName extends StatelessWidget {
  final String nick;
  final bool isVerified;
  final double fontSize;
  final FontWeight fontWeight;
  final bool centered;

  const RankingUserName({
    super.key,
    required this.nick,
    required this.isVerified,
    required this.fontSize,
    required this.fontWeight,
    this.centered = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: centered ? MainAxisSize.min : MainAxisSize.max,
      mainAxisAlignment:
          centered ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            nick,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
        if (isVerified) ...[
          const SizedBox(width: 4),
          const Icon(
            Icons.verified,
            color: Color(0xFFFF2E93),
            size: 18,
          ),
        ],
      ],
    );
  }
}

// Avatar circular del crítico.
class _CriticAvatar extends StatelessWidget {
  final String assetPath;
  final double size;

  const _CriticAvatar({
    required this.assetPath,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        assetPath,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}

String _formatReviewCount(int count) {
  return count == 1 ? '1 reseña' : '$count reseñas';
}

_MedalStyle _medalStyleFor(int position) {
  switch (position) {
    case 1:
      return const _MedalStyle(
        accent: Color(0xFFFFCF73),
        featuredBorder: Color(0x8CFFCF73),
        podiumBorder: Color(0x3DFFCF73),
        gradientTop: Color(0x21FFCF73),
        badgeBackground: Color(0x1FFFCF73),
      );
    case 2:
      return const _MedalStyle(
        accent: Color(0xFFBFD1FC),
        featuredBorder: Color(0x8CBFD1FC),
        podiumBorder: Color(0x3DBFD1FC),
        gradientTop: Color(0x21BFD1FC),
        badgeBackground: Color(0x1FBFD1FC),
      );
    case 3:
      return const _MedalStyle(
        accent: Color(0xFFF4A789),
        featuredBorder: Color(0x8CF4A789),
        podiumBorder: Color(0x3DF4A789),
        gradientTop: Color(0x21F4A789),
        badgeBackground: Color(0x1FF4A789),
      );
    default:
      return const _MedalStyle(
        accent: Color(0xFFC9C4CF),
        featuredBorder: Color(0xFF2E2B5F),
        podiumBorder: Color(0xFF2E2B5F),
        gradientTop: Color(0xFF191430),
        badgeBackground: Color(0x1FC9C4CF),
      );
  }
}

class CriticData {
  final int position;
  final String nick;
  final int reviewCount;
  final String avatarAsset;
  final bool isVerified;

  const CriticData({
    required this.position,
    required this.nick,
    required this.reviewCount,
    required this.avatarAsset,
    required this.isVerified,
  });
}

class _MedalStyle {
  final Color accent;
  final Color featuredBorder;
  final Color podiumBorder;
  final Color gradientTop;
  final Color badgeBackground;

  const _MedalStyle({
    required this.accent,
    required this.featuredBorder,
    required this.podiumBorder,
    required this.gradientTop,
    required this.badgeBackground,
  });
}
