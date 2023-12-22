import 'package:intl/intl.dart';
import 'package:boookbytes/models/book.dart';
import 'package:boookbytes/models/user.dart';
import 'package:boookbytes/shared/myserverconfig.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final User user;
  final Book book;

  const BookDetails({Key? key, required this.user, required this.book})
      : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  late double screenWidth, screenHeight;
  final f = DateFormat('dd-MM-yyyy hh:mm a');
  bool bookowner = false;

  @override
  Widget build(BuildContext context) {
    if (widget.user.userid == widget.book.userId) {
      bookowner = true;
    } else {
      bookowner = false;
    }
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.bookTitle.toString()),
        
        
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.4,
                width: screenWidth,
                child: Image.network(
                  fit: BoxFit.fill,
                  "${MyServerConfig.server}/bookbytes/assets/books/${widget.book.bookId}.jpg",
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey, 
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.book.bookTitle.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Text(
                      widget.book.bookAuthor.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Date Available ${f.format(DateTime.parse(widget.book.bookDate.toString()))}",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "ISBN ${widget.book.bookIsbn}",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.book.bookDesc.toString(),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "RM ${widget.book.bookPrice}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 121, 10),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Quantity Available ${widget.book.bookQty}",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
