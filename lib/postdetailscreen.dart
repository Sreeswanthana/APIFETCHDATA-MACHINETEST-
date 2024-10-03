
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  final String content;

  PostDetailScreen({
    required this.content, required title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text(content),

          ],
        ),

      ),
    );
  }
}
