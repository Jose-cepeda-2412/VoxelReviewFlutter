import 'package:material_ui/material_ui.dart';
import 'profile_screen.dart'; 

// Pantalla principal: solo organiza los widgets.
class NovedadesScreen extends StatelessWidget {
  const NovedadesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0D1F),
      appBar: const NovedadesAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                MapBannerCard(),
                SizedBox(height: 12),
                FilterTabs(),
                SizedBox(height: 20),
                SectionTitle(),
                SizedBox(height: 12),
                ReviewedGamesList(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(activeIndex: 2),
    );
  }
}

// Barra superior de la pantalla.
class NovedadesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NovedadesAppBar({super.key});

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
        'Novedades y Reseñas',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.notifications_none, color: Colors.white),
        ),
      ],
    );
  }
}

// Tarjeta de acceso al mapa de reseñas.
class MapBannerCard extends StatelessWidget {
  const MapBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF191430),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2254),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: Color(0xFF00F0FF),
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mapa de reseñas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Explora reseñas por ubicación',
                  style: TextStyle(
                    color: Color(0xFFC9C4CF),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward,
            color: Color(0xFF00F0FF),
            size: 22,
          ),
        ],
      ),
    );
  }
}

// Pestañas de filtro (Todos / Siguiendo).
class FilterTabs extends StatelessWidget {
  const FilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF191430),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2254),
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Todos',
                style: TextStyle(
                  color: Color(0xFF00F0FF),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: Text(
                  'Siguiendo',
                  style: TextStyle(
                    color: Color(0xFFC9C4CF),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Título de la sección de juegos.
class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Juegos reseñados',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

// Lista de tarjetas de juegos reseñados con datos quemados.
class ReviewedGamesList extends StatelessWidget {
  const ReviewedGamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GameReviewCard(
          title: 'Mystic Realms 2',
          studio: 'Indie Studio',
          rating: '1,7',
          description:
              'Amita debilito administratio calcar cinis ubi distinctio commodi ducimus. Volva sed ...',
          imagePath: 'assets/images/juegoNov1.jpg',
        ),
        SizedBox(height: 12),
        GameReviewCard(
          title: 'Eternal Kingdom 2',
          studio: 'Ubisoft',
          rating: '2,8',
          description:
              'Claustrum tollo vulgus facere. Tenuis appono thesis attero sursum. Canto conculc...',
          imagePath: 'assets/images/juegoNov2.jpg',
        ),
        SizedBox(height: 12),
        GameReviewCard(
          title: 'Shadow Legends 2',
          studio: 'FromSoftware',
          rating: '2,3',
          description:
              'Tamen cariosus arbustum administratio sui valde defleo sol pauper cumque. Coepi vulg...',
          imagePath: 'assets/images/juegoNov3.jpg',
        ),
        SizedBox(height: 12),
        GameReviewCard(
          title: 'Lost Memories 2',
          studio: 'Rockstar Games',
          rating: '3,0',
          description:
              'Celo tego ante testimonium careo audax placeat acsi. Animus tener apparatus arbor...',
          imagePath: 'assets/images/juegoNov4.jpg',
        ),
        SizedBox(height: 12),
        GameReviewCard(
          title: 'Forza Horizon 5',
          studio: 'Playground Games',
          rating: '2,9',
          description:
              'Un juego de carreras de mundo abierto ambientado en los vibrantes paisajes de M...',
          imagePath: 'assets/images/juegoNov5.jpg',
        ),
      ],
    );
  }
}

// Tarjeta individual de reseña de videojuego.
class GameReviewCard extends StatelessWidget {
  final String title;
  final String studio;
  final String rating;
  final String description;
  final String imagePath;

  const GameReviewCard({
    super.key,
    required this.title,
    required this.studio,
    required this.rating,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      decoration: BoxDecoration(
        color: const Color(0xFF191430),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF2A2254),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(17),
              bottomLeft: Radius.circular(17),
            ),
            child: Image.asset(
              imagePath,
              width: 105,
              height: 118,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Color(0xFFC9C4CF),
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        studio,
                        style: const TextStyle(
                          color: Color(0xFFC9C4CF),
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFCA28),
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: const TextStyle(
                              color: Color(0xFFFFCA28),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFC9C4CF),
                      fontSize: 11.5,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}