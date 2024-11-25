import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Colors.amber,
            title: const Text("Wilkommen zu meiner\nZitat App",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Man muss das Unmögliche versuchen, um das Mögliche zu erreichen.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.amber),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text("Nächstes Zitat",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
