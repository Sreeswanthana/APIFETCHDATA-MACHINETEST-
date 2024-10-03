import 'package:apifetchdata/postdetailscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: PostListScreen(),
    );
  }
}

class PostListScreen extends StatelessWidget {
  // Dummy data for posts
  final List<Map<String, dynamic>> posts = [
    {
      'username': 'User1',
      'content': 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
      'likes': 2,
      'profileImage': 'https://via.placeholder.com/50'
    },
    {
      'username': 'User2',
      'content': 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
      'likes': 5,
      'profileImage': 'https://via.placeholder.com/50'
    } ,
    {
      'username': 'User3',
      'content': 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
      'likes': 8,
      'profileImage': 'https://via.placeholder.com/50'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/img.png'),
              radius: 16,
            ),
            SizedBox(width: 10),
            Text(
              'Social Media Posts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tab buttons for "Trending", "Relationship", "Self Care"
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: StadiumBorder(),
                  ),
                  child: Text('Trending'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Relationship'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Self Care'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (posts[index]['username'] == 'User1') {
                      // Navigate to the PostDetailScreen when User1's post is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailScreen(
                            title: posts[index]['username'],
                            content: posts[index]['content'],
                          ),
                        ),
                      );
                    }
                  },
                  child: PostCard(
                    username: posts[index]['username'],
                    content: posts[index]['content'],
                    initialLikes: posts[index]['likes'],
                    profileImage: posts[index]['profileImage'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final String username;
  final String content;
  final int initialLikes;
  final String profileImage;

  PostCard({
    required this.username,
    required this.content,
    required this.initialLikes,
    required this.profileImage,
  });

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int likes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.initialLikes;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likes--;
      } else {
        likes++;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.profileImage),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Text(
                  widget.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(widget.content),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: toggleLike,
                  icon: Icon(
                    isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                    color: isLiked ? Colors.blue : null,
                  ),
                ),
                Text('$likes'),
                Spacer(),
                IconButton(
                  onPressed: () {
                    // Share functionality can go here
                  },
                  icon: Icon(Icons.share_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
