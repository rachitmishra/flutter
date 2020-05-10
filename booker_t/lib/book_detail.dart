import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'album.dart';

class BookDetail extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return BookDetailState();
  }
}

class BookDetailState extends State {

  Future<Album> futureBook;

  final String _imageUrl = "https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true";


  @override
  void initState() {
    super.initState();
    futureBook = fetchBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.network(_imageUrl, width: 80, height: 80),
          FutureBuilder<Album>(
            future: futureBook,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Text(snapshot.data.title),
                );
              } else if (snapshot.hasError) {
                return Container(
                  child: Text("${snapshot.error}"),
                );
              }

              return Center(
                  child: CircularProgressIndicator()
              );
            },
          )],
      ),
    );
  }

  Future<Album> fetchBook() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/albums/2');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
