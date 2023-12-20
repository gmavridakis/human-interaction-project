import 'package:flutter/material.dart';
import 'randomFacts.dart';
import 'upload_photo.dart';

class FeedPage extends StatelessWidget {
  Widget _buildFeedCard({
    required String userImage,
    required String username,
    required String location,
    required String animalImage,
    required String animalDescription,
    required String description,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
            title: Text(username),
            subtitle: Text(location),
          ),
          Image.network(
            animalImage,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              animalDescription,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: const Color(0xFF16805A), // Text color
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  description,
                  style: TextStyle(
                    color: const Color(0xFF16805A), // Text color
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.message,
                        color: const Color(0xFF16805A)), // Icon color
                    Icon(Icons.favorite,
                        color: const Color(0xFF16805A)), // Icon color
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void showFeed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FeedPage(),
        ),
      );
    }

    void uploadPhoto() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UploadPhotoPage(),
        ),
      );
    }

    void showFacts() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RandomFactsPage(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Feed',
          style: TextStyle(
            color: Color.fromRGBO(22, 128, 90, 1),
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            color: Color.fromRGBO(
                22, 128, 90, 1)), // #16805A // App bar background color
      ),
      body: Container(
        color: Colors.black, // Body background color
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            _buildFeedCard(
              userImage:
                  'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/user_man.jpeg',
              username: 'JohnDoe',
              location: 'Oslo, Norway',
              animalImage:
                  'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/1.jpeg',
              animalDescription: 'Siamese Cat',
              description: 'Enjoying a lazy afternoon',
            ),
            _buildFeedCard(
              userImage:
                  'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/user_man.jpeg',
              username: 'JaneDoe',
              location: 'Stockholm, Sweden',
              animalImage:
                  'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/2.jpeg',
              animalDescription: 'Persian Cat',
              description: 'Just woke up from a catnap',
            ),
            _buildFeedCard(
              userImage:
                  'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/user_woman.png',
              username: 'Alice',
              location: 'Copenhagen, Denmark',
              animalImage:
                  'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/3.jpeg',
              animalDescription: 'Maine Coon Cat',
              description: 'Exploring the backyard',
            ),
            _buildFeedCard(
              userImage:
                  'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/user_man.jpeg',
              username: 'Bob',
              location: 'Helsinki, Finland',
              animalImage:
                  'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/4.jpeg',
              animalDescription: 'British Shorthair Cat',
              description: 'Playing with a yarn ball',
            ),
            _buildFeedCard(
              userImage:
                  'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/user_woman.png',
              username: 'Eva',
              location: 'Reykjavik, Iceland',
              animalImage:
                  'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/5.jpeg',
              animalDescription: 'Ragdoll Cat',
              description: 'Sunbathing by the window',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
                Icon(Icons.home, color: const Color(0xFF16805A)), // Icon color
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.camera_alt_sharp, color: Colors.white), // Icon color
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded,
                color: Colors.white), // Icon color
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            showFeed();
          } else if (index == 1) {
            uploadPhoto();
          } else if (index == 2) {
            showFacts();
          }
        },
        backgroundColor: Colors.black, // Bottom navigation bar background color
      ),
    );
  }
}
