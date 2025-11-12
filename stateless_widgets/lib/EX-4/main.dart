import 'package:flutter/material.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Weather'),
          actions: const [Icon(Icons.menu)],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7EC5E8), Color(0xFF6AA9E8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: const WeatherList(),
          ),
        ),
      ),
    );
  }
}

enum WeatherType {
  cloudy(
    asset: 'assets/ex4/cloudy.png',
    gradient: const [Color(0xFFAF63D6), Color(0xFF6B59E5)],
  ),
  sunnyCloudy(
    asset: 'assets/ex4/sunnyCloudy.png',
    gradient: const [Color(0xFF3AD0AC), Color(0xFF4FD1C5)],
  ),
  sunny(
    asset: 'assets/ex4/sunny.png',
    gradient: const [Color(0xFFE65C7B), Color(0xFFDF4A73)],
  ),
  veryCloudy(
    asset: 'assets/ex4/veryCloudy.png',
    gradient: const [Color(0xFFE5A057), Color(0xFFDFA069)],
  );

  final String asset;
  final List<Color> gradient;
  const WeatherType({required this.asset, required this.gradient});
}

class WeatherInfo {
  final String city;
  final double current;
  final double min;
  final double max;
  final WeatherType type;

  const WeatherInfo({
    required this.city,
    required this.current,
    required this.min,
    required this.max,
    required this.type,
  });
}

class WeatherList extends StatelessWidget {
  const WeatherList({super.key});

  static const items = <WeatherInfo>[
    WeatherInfo(
      city: 'PhnomPenh',
      current: 12.2,
      min: 10.0,
      max: 30.0,
      type: WeatherType.cloudy,
    ),
    WeatherInfo(
      city: 'Paris',
      current: 22.2,
      min: 10.0,
      max: 40.0,
      type: WeatherType.sunnyCloudy,
    ),
    WeatherInfo(
      city: 'Rome',
      current: 45.2,
      min: 10.0,
      max: 40.0,
      type: WeatherType.sunny,
    ),
    WeatherInfo(
      city: 'Toulouse',
      current: 45.2,
      min: 10.0,
      max: 40.0,
      type: WeatherType.veryCloudy,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, i) => WeatherCard(info: items[i]),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final WeatherInfo info;
  const WeatherCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(24);
    return PhysicalModel(
      color: Colors.white,
      elevation: 8,
      borderRadius: radius,
      shadowColor: Colors.black26,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 96,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: info.type.gradient,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: radius,
              ),
            ),
            Positioned(
              right: -20,
              top: -8,
              bottom: -8,
              child: Container(
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white.withOpacity(0.18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.white30, width: 2),
                        ),
                        child: Center(
                          child: _WeatherIcon(asset: info.type.asset),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            info.city,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Min ${_fmt(info.min)}°C',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Max ${_fmt(info.max)}°C',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '${_fmt(info.current)}°C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _fmt(double v) => v.toStringAsFixed(1);
}

class _WeatherIcon extends StatelessWidget {
  final String asset;
  const _WeatherIcon({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: 26,
      height: 26,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) =>
          const Icon(Icons.wb_sunny, color: Colors.orange, size: 22),
    );
  }
}
