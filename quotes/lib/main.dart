import 'package:flutter/material.dart';
import 'package:quotes/models/quote.dart';
import 'package:quotes/quotecard.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuoteList(),
    );
  }
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
      author: 'Sergio',
      quote:
          'Melhor perambular ao relento do que conviver com uma mulher rixosa e iracunda',
    ),
    Quote(
      author: 'Oscar Wilde',
      quote: 'Be yourself; everyone else is already taken',
    ),
    Quote(
      author: 'Oscar Wilde',
      quote: 'I have nothing to declare except my genious',
    ),
    Quote(
      author: 'Oscar Wilde',
      quote: 'The truth is rarely pure and never simple',
    ),
  ];

  Widget renderList() {
    if (quotes.isEmpty)
      return Center(
        child: Text(
          'No quotes to show :(',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
      );
    else
      return SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ...quotes
              .map(
                (q) => QuoteCard(
                  quote: q,
                  delete: () => setState(() {
                    quotes.remove(q);
                  }),
                ),
              )
              .toList(),
          SizedBox(height: 30),
        ]),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Quotes'),
        leading: Icon(Icons.menu),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF282a57), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: renderList(),
      ),
    );
  }
}
