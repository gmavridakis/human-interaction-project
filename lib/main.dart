import 'package:flutter/material.dart';
import 'package:ntua_project/get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Explorer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Welcome to Pet Explorer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(22, 128, 90, 1),
          title: Text(
            widget.title,
            style:
                TextStyle(color: Colors.white), // Set the text color to white
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/dog_intro.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Color.fromARGB(255, 189, 189, 189).withOpacity(0.6),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Replace the Icon with an image

                  Container(
                    child: Image.network(
                      'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/animal_paw.png',
                      width: 75, // Set the same width as the Container
                      height: 75, // Set the same height as the Container
                      fit: BoxFit
                          .contain, // Use 'contain' to maintain the image's aspect ratio
                    ),
                  ),

                  const SizedBox(height: 16), // Spacer between image and text
                  // Bold text centered
                  const Text(
                    'Discover, Share, and Connect with Pet Lovers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 100, // Adjust the position as needed
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GetStarted()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(22, 128, 90, 1)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.fromLTRB(57.58, 20, 57, 19),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9999),
                        side: const BorderSide(
                          color: Color.fromRGBO(22, 128, 90, 1),
                          width: 1,
                        ),
                      ),
                    ),
                    elevation: MaterialStateProperty.all<double>(12.0),
                  ),
                  child: Container(
                    width: 130,
                    height: 33,
                    alignment: Alignment.center,
                    child: const Text(
                      'Start Exploring',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
