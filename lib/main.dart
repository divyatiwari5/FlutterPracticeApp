import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Test title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),
              Text(
                'Text random',
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text('20'),
      ],
    ),
  );

  @override
  Widget build(BuildContext buildContext) {
    final wordPair = WordPair.random();
    Color color = Theme.of(buildContext).primaryColor;

    Widget buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBottomColumn(color, Icons.call, 'CALL'),
        _buildBottomColumn(color, Icons.star, 'STAR'),
        _buildBottomColumn(color, Icons.near_me, 'ROUTE')
      ],
    ),
  );

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'This is a dummy description. This is a dummy description. This is a dummy description. This is a dummy description. This is a dummy description. This is a dummy description. This is a dummy description. This is a dummy description.',
      softWrap: true,
    ),
  );

    return MaterialApp(
      title: 'Welcome to flutter',
      // home: RandomWords(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome Page'),
        ),
        body: ListView(children: [
          Image.asset(
            'images/PhotoBG1.png',
            width: 600,
            height: 240,
            fit: BoxFit.cover
          ),
          titleSection,
          buttonSection,
          textSection],),
      )
    );
  }
  
  Column _buildBottomColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            )
          ),
        )
      ],
    );
  }
}

class RandomWordsState extends State<RandomWords> {
    final List<WordPair> _suggestions = <WordPair>[];
    final TextStyle _biggerFont = const TextStyle(fontSize: 18);
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: _buildSuggestions(),
      );
    }
    Widget _buildSuggestions() {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
      );
    }
    Widget _buildRow(WordPair pair) {
      return ListTile(title: Text(pair.asCamelCase, style: _biggerFont,));
    }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}