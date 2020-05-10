import 'package:booker_t/book_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booker-T',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BookList(),
    );
  }
}

// VM
class BookModel with ChangeNotifier {
  List<String> _bookList = [];

  int get itemCount => _bookList.length;

  String itemAtIndex(int index) {
    return _bookList[index];
  }

  void addBook(String bookName) {
    _bookList.add(bookName);
    notifyListeners();
  }
}

class BookList extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Booker-T")),
        body: ChangeNotifierProvider(
            create: (_) => BookModel(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: _buildBookList(),
                    ),
                    Center(
                      child: BookInput(),
                    )
                  ],
                ),
              ),
            )),
      );
}



Widget _buildBookList() {
  return Consumer<BookModel>(builder: (context, model, child) {
    if (model.itemCount == 0) {
      return Column(children: <Widget>[
        Container(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
          child: Text("Let's add few 📚"),
        )),
      ]);
    } else {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: model.itemCount,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: BookItem(model.itemAtIndex(index)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookDetail()),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      );
    }
  });
}

class BookItem extends StatelessWidget {
  final String _title;
  final String _imageUrl = "https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true";

  BookItem(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Image.network(_imageUrl, width: 80, height: 80),
          Text(_title)
        ],
      ),
    ));
  }
}

class BookInput extends StatelessWidget {
  final TextEditingController bookNameController = TextEditingController();

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: <Widget>[
            Center(
              child: TextField(
                  controller: bookNameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(4.0),
                      hintText: "Book Name",
                      border: OutlineInputBorder())),
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 0),
                    child: MaterialButton(
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      child: Text("Add Book"),
                      onPressed: () => {addBook(context)},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  void addBook(BuildContext bc) {
    Provider.of<BookModel>(bc, listen: false)
        .addBook(bookNameController.value.text);
  }
}
