import 'package:flutter/material.dart';

void main() {
  runApp(const MovieStreamingApp());
}

class MovieStreamingApp extends StatelessWidget {
  const MovieStreamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutFlix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF141414),
        primaryColor: const Color(0xFFE50914),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE50914),
          secondary: Colors.white,
        ),
        fontFamily: 'Roboto',
      ),
      home: const MovieHomeScreen(),
    );
  }
}

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({super.key});

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  // Mock data for movie carousels
  final List<String> trendingMovies = [
    'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
    'https://image.tmdb.org/t/p/w500/vJU3rXSP9hwUuLeq8IpfsJShLOk.jpg',
    'https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
    'https://image.tmdb.org/t/p/w500/t6HIqrHecpSy7AujZB1PiLh2Z2V.jpg',
    'https://image.tmdb.org/t/p/w500/ryKwNlAfDXu0jsmS70P1iQ2FqS3.jpg',
    'https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg',
    'https://image.tmdb.org/t/p/w500/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg',
  ];

  final List<String> actionMovies = [
    'https://image.tmdb.org/t/p/w500/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg',
    'https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg',
    'https://image.tmdb.org/t/p/w500/wigZBAmPhZAENpuVR2ePZKGZ023.jpg',
    'https://image.tmdb.org/t/p/w500/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg',
    'https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8SPFKbTe.jpg',
    'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
  ];

  final List<String> comedies = [
    'https://image.tmdb.org/t/p/w500/9n5e1vToJVbkXoB5xQ3S9w7y72.jpg',
    'https://image.tmdb.org/t/p/w500/8kOWDBK6XlPUzckuHDo3wwVRFwt.jpg',
    'https://image.tmdb.org/t/p/w500/uKVVjIQKzWDaFeh0LiaL27P1u6B.jpg',
    'https://image.tmdb.org/t/p/w500/aHtw2xEU4BqWfO1j2E3g1ySExuU.jpg',
    'https://image.tmdb.org/t/p/w500/fPzwHA1P1mHkS3Wq1lUvL98f8tW.jpg',
    'https://image.tmdb.org/t/p/w500/ryKwNlAfDXu0jsmS70P1iQ2FqS3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'FLUTFLIX',
              style: TextStyle(
                color: Color(0xFFE50914),
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: 2.0,
              ),
            ),
            // Chỉ hiện Menu khi màn hình đủ rộng (Responsive)
            if (screenSize.width > 800) ...[
              const SizedBox(width: 40),
              _buildNavButton('Home'),
              _buildNavButton('TV Shows'),
              _buildNavButton('Movies'),
              _buildNavButton('New & Popular'),
              _buildNavButton('My List'),
            ],
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 15),
          IconButton(
            icon: const Icon(Icons.notifications, size: 28, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[800],
              child: const Icon(Icons.person, color: Colors.white, size: 22),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeroBanner(),
            const SizedBox(height: 20),
            MovieRow(title: 'Trending Now', imageUrls: trendingMovies),
            MovieRow(title: 'Action & Adventure', imageUrls: actionMovies),
            MovieRow(title: 'Comedies', imageUrls: comedies),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 800;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Background Image
        Container(
          height: isDesktop ? 650 : 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://image.tmdb.org/t/p/original/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Dark Gradient for text readability
        Container(
          height: isDesktop ? 650 : 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black87,
                Colors.transparent,
                Colors.transparent,
                Color(0xFF141414)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.3, 0.7, 1.0],
            ),
          ),
        ),
        // Content (Title & Buttons)
        Positioned(
          bottom: 50,
          child: Column(
            children: [
              Text(
                'AVENGERS: ENDGAME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isDesktop ? 56 : 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Text(
                'Action • Adventure • Sci-Fi',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isDesktop ? 18 : 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow, color: Colors.black, size: 28),
                    label: const Text(
                      'Play',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.info_outline, color: Colors.white, size: 28),
                    label: const Text(
                      'More Info',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(109, 109, 110, 0.7),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class MovieRow extends StatelessWidget {
  final String title;
  final List<String> imageUrls;

  const MovieRow({super.key, required this.title, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(imageUrls[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () {
                      // Click effect
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
