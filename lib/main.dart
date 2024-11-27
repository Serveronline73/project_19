import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MainApp> {
  String quote =
      "Es ist Unmöglich, auf zwei Hochzeiten gleichzeitig zu Tanzen.";
  String author = "Dennis Durmus";

  Future<void> getQuote() async {
    final response = await http.get(
      Uri.parse("https://api.api-ninjas.com/v1/quotes"), //API URL
      headers: {
        'X-Api-Key': 'XF+7Za8J2OnKzmCpWUvk0A==6XqWT1IqNknaRRHq'
      }, //API Key
    );

    if (response.statusCode == 200) {
      //Status Code 200 = OK
      final data = json.decode(response.body); //JSON Decodieren
      setState(() {
        quote = data[0]['quote'];
        author = data[0]['author'];
      });
    } else {
      throw Exception("Fehler Laden vom Zitat");
    }
  }

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
              Text(
                quote, //Zitat
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24.0, color: Colors.amber),
              ),
              Text("- $author", //Autor
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.amber,
                  )),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: getQuote,
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
