import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/UI/get_weather/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherApiProvider(),
      child: Consumer<WeatherApiProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Check the weather for your desired location',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: model.textController,
                  decoration: const InputDecoration(
                    label: Text('Enter the location'),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    model.getData(); // Trigger the API call
                  },
                  child: const Text('Get Weather'),
                ),
                const SizedBox(height: 20),
                model.isLoading
                    ? const CircularProgressIndicator()
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (model.Weather.location != null)
                            Text(
                              'Location: ${model.Weather.location?.name}',
                              style: const TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          if (model.Weather.current != null) ...[
                            Text(
                              'Weather: ${model.Weather.current?.weatherDescriptions?.join(", ")}',
                              style: const TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Temp: ${model.Weather.current?.temperature} Celcius',
                              style: const TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Wind Speed: ${model.Weather.current?.windSpeed} km/hr',
                              style: const TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                          ],
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
