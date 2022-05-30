import 'package:flutter/material.dart';
import 'package:proyekakhir_123190163_3/helper/shared_preference.dart';
import 'package:proyekakhir_123190163_3/view/homepage.dart';
import 'package:proyekakhir_123190163_3/view/news_detail.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.web),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text("The Guardian"),
        backgroundColor: Color(0xff000000),
        actions: [
          IconButton(
            onPressed: () {
              SharedPreference().setLogout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
            },
            padding: EdgeInsets.only(right: 50),
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                    ),
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(_posts[index]['urlToImage']), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        '${_posts[index]['author']}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '${_posts[index]['title']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Detail(
                url: _posts[index]['url'],
                title: _posts[index]['title'],
                content: _posts[index]['content'],
                publishedAt: _posts[index]['publishedAt'],
                author: _posts[index]['author'],
                urlToImage: _posts[index]['urlToImage'],
              )));
            },
          );
        },
      ),

    );
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=1a07975ea41d4b67bda9784d2d593e36'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
