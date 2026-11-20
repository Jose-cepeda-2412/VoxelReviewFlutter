import 'package:material_ui/material_ui.dart';
import 'package:voxel_review/widgets/voxel_bottom_nav_bar.dart';
import 'package:voxel_review/widgets/voxel_search_bar.dart';

// Juego destacado quemado para la pantalla estática de Descubrir.
const DiscoverGameData _featuredGame = DiscoverGameData(
  title: 'Elden Ring',
  category: 'PC · PS5 · Xbox',
  imageAsset: 'assets/images/banner_games.jpg',
  reviewCount: 48,
);

// Lista quemada de juegos en tendencia.
const List<DiscoverGameData> _trendingGames = [
  DiscoverGameData(
    title: 'Hollow Knight',
    category: 'PC · Nintendo Switch',
    imageAsset: 'assets/images/reco_game.jpg',
    reviewCount: 34,
  ),
  DiscoverGameData(
    title: "Baldur's Gate 3",
    category: 'PC · PS5',
    imageAsset: 'assets/images/reco2_game.jpg',
    reviewCount: 29,
  ),
  DiscoverGameData(
    title: 'Celeste',
    category: 'PC · Switch · PS4',
    imageAsset: 'assets/images/reco3_game.png',
    reviewCount: 21,
  ),
  DiscoverGameData(
    title: 'Hades',
    category: 'PC · Switch · Xbox',
    imageAsset: 'assets/images/imagen_uno.png',
    reviewCount: 19,
  ),
  DiscoverGameData(
    title: 'Cyberpunk 2077',
    category: 'PC · PS5 · Xbox Series X',
    imageAsset: 'assets/images/imagen_dos.jpg',
    reviewCount: 15,
  ),
];

// Pantalla principal de Descubrir: solo organiza los widgets.
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF0F0D1F),
      bottomNavigationBar: const VoxelBottomNavBar(selectedIndex: 1),
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
              const DiscoverTopBar(),
              const SizedBox(height: 12),
              const VoxelSearchBar(hintText: 'Buscar juegos...'),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 108),
                  children: [
                    const FeaturedGameCard(game: _featuredGame),
                    const Padding(
                      padding: EdgeInsets.only(top: 22, bottom: 6),
                      child: Text(
                        'En tendencia',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ..._trendingGames.map(
                      (game) => Column(
                        children: [
                          TrendingSearchItem(game: game),
                          const Divider(
                            color: Color(0xA62E2B5F),
                            height: 1,
                            thickness: 1,
                          ),
                        ],
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

// Barra superior con botón de regreso, título centrado y campana de notificaciones.
class DiscoverTopBar extends StatelessWidget {
  const DiscoverTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            ),
          ),
          const Expanded(
            child: Text(
              'Descubrir',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

// Tarjeta destacada del juego más reseñado.
class FeaturedGameCard extends StatelessWidget {
  final DiscoverGameData game;

  const FeaturedGameCard({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    final reviewsText =
        game.reviewCount == 1 ? '1 reseña' : '${game.reviewCount} reseñas';

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        color: const Color(0xFF191430),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: Image.asset(
                game.imageAsset,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          game.reviewCount > 0
                              ? 'Más reseñado'
                              : 'Juego destacado',
                          style: const TextStyle(
                            color: Color(0xFF00F0FF),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          game.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${game.category} · $reviewsText',
                          style: const TextStyle(
                            color: Color(0xFFC9C4CF),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF00F0FF),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Fila individual de la lista "En tendencia".
class TrendingSearchItem extends StatelessWidget {
  final DiscoverGameData game;

  const TrendingSearchItem({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              game.imageAsset,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  game.category,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFC9C4CF),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          const Icon(
            Icons.north_east,
            color: Color(0xFF00F0FF),
            size: 18,
          ),
        ],
      ),
    );
  }
}

class DiscoverGameData {
  final String title;
  final String category;
  final String imageAsset;
  final int reviewCount;

  const DiscoverGameData({
    required this.title,
    required this.category,
    required this.imageAsset,
    required this.reviewCount,
  });
}
