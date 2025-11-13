import 'package:flutter/material.dart';

enum Weather {
  phnompenh(
    name: "PhnomPenh",
    min: "10.0°C",
    max: "30.0°C",
    temp: "12.2°C",
    gradient: LinearGradient(colors: [Colors.purpleAccent, Colors.purple]),
    circleColor: Colors.purpleAccent,
    image: "assets/ex4/cloudy.png",
  ),
  paris(
    name: "Paris",
    min: "10.0°C",
    max: "40.0°C",
    temp: "22.2°C",
    gradient: LinearGradient(colors: [Colors.greenAccent, Colors.green]),
    circleColor: Colors.greenAccent,
    image: "assets/ex4/sunnyCloudy.png",
  ),
  rome(
    name: "Rome",
    min: "10.0°C",
    max: "40.0°C",
    temp: "45.2°C",
    gradient: LinearGradient(colors: [Colors.redAccent, Colors.red]),
    circleColor: Colors.redAccent,
    image: "assets/ex4/sunny.png",
  ),
  toulouse(
    name: "Toulouse",
    min: "10.0°C",
    max: "40.0°C",
    temp: "42.2°C",
    gradient: LinearGradient(colors: [Colors.orange, Colors.orangeAccent]),
    circleColor: Colors.orangeAccent,
    image: "assets/ex4/veryCloudy.png",
  );

  final String name;
  final String min;
  final String max;
  final String temp;
  final Gradient gradient;
  final String image;
  final Color circleColor;

  const Weather({
    required this.name,
    required this.min,
    required this.max,
    required this.temp,
    required this.gradient,
    required this.circleColor,
    required this.image,
  });
}

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 10,
      shadowColor: Colors.black.withValues(alpha: 0.7),
      borderRadius: BorderRadius.circular(25),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: weather.gradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(weather.image),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Min: ${weather.min}",
                      style: TextStyle(color: Colors.grey[300], fontSize: 11),
                    ),
                    Text(
                      "Max: ${weather.max}",
                      style: TextStyle(color: Colors.grey[300], fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -60,
            top: -20,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                gradient: weather.gradient,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 35,
            child: Text(
              weather.temp,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.menu, color: Colors.white),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              WeatherCard(weather: Weather.phnompenh),
              SizedBox(height: 10),
              WeatherCard(weather: Weather.paris),
              SizedBox(height: 10),
              WeatherCard(weather: Weather.rome),
              SizedBox(height: 10),
              WeatherCard(weather: Weather.toulouse),
            ],
          ),
        ),
      ),
    ),
  );
}
