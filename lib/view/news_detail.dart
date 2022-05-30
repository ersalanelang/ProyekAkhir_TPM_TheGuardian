import 'package:flutter/material.dart';
import 'package:proyekakhir_123190163_3/models/user_model.dart';

class Detail extends StatelessWidget {
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

Detail(
      {this.url,
        this.title,
        this.content,
        this.publishedAt,
        this.author,
        this.urlToImage,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                //let's add the height

                image: DecorationImage(
                    image: NetworkImage(urlToImage), fit: BoxFit.cover),
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
                '$author',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              '$publishedAt',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              '$content',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text('Sumber: $url'),
          ],
        ),

        // children: <Widget>[
        //   urlToImage != null? Image.network(urlToImage) :
        //   Container(
        //     height: 100,
        //     color: Colors.black45,
        //   ),
        //   Container(
        //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         Text(
        //           '$title',
        //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //         ),
        //         SizedBox(height: 10),
        //         Text(
        //           '$publishedAt',
        //           style: TextStyle(fontStyle: FontStyle.italic),
        //         ),
        //         SizedBox(height: 10),
        //         Text('$content'),
        //         Divider(),
        //         Text('Penulis: $author'),
        //         Text('Sumber: $url'),
        //       ],
        //     ),
        //   )
        // ],

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
