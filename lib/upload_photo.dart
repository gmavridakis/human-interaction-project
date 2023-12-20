import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'randomFacts.dart';
import 'feedpage.dart';

class UploadPhotoPage extends StatefulWidget {
  @override
  _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  TextEditingController descriptionController = TextEditingController();
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  void showFeed() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => FeedPage(),
      ),
    );
  }

  void showFacts() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => RandomFactsPage(),
      ),
    );
  }

  void showSuccessUploadMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Column(
            children: [
              Text('Image successfully uploaded!'),
              SizedBox(height: 20),
              Image.file(
                _image!,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                showFeed(); // Navigate to feed page or any other action
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Photo',
          style: TextStyle(
            color: Color.fromRGBO(22, 128, 90, 1),
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(22, 128, 90, 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _image == null
                ? Placeholder(
                    fallbackHeight: 0.0,
                  )
                : Image.file(_image!), // Use the null-aware operator here
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _getImage();
              },
              child: Text('Take a Picture'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform upload logic here
                // You can validate the fields and perform the upload
                // For simplicity, let's assume the upload is successful
                showSuccessUploadMessage();
              },
              child: Text('Upload'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_sharp, color: const Color(0xFF16805A)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded, color: Colors.white),
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            showFeed();
          } else if (index == 1) {
            // Do nothing as it's already on the upload page
          } else if (index == 2) {
            showFacts();
          }
        },
      ),
    );
  }
}
