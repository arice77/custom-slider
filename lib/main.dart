import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double? sliderValue;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 33, 64, 67),
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app))
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'How Are you Feeling Today',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                CustomSlider(topText: 'I feel Blessed'),
                CustomSlider(topText: 'I feel free'),
                CustomSlider(topText: "I'm thinking about past"),
                CustomSlider(topText: 'I have meaningful life'),
                CustomSlider(topText: 'Random'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSlider extends StatefulWidget {
  String topText;
  CustomSlider({required this.topText, super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double? sliderValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 110, 142, 145))),
      child: SliderTheme(
        data: const SliderThemeData(
          activeTrackColor: Color.fromARGB(255, 212, 211, 210),
          activeTickMarkColor: Color.fromARGB(255, 212, 211, 210),
          inactiveTickMarkColor: Color.fromARGB(255, 115, 152, 146),
          inactiveTrackColor: Color.fromARGB(255, 115, 152, 146),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
          tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 10),
          thumbColor: Color.fromARGB(255, 212, 211, 210),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.topText,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            Slider(
              min: 1,
              max: 5,
              divisions: 4,
              value: sliderValue ??= 1,
              onChanged: (newValue) {
                setState(() => sliderValue = newValue);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '2',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Disagree',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Agree',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
