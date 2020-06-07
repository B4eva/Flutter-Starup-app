import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 //   final wordPair = WordPair.random();
    return MaterialApp(
      title:  'Startup Name Generator',
      home: RandomWords(
       // appBar: AppBar(
        //  title: const Text('Startup Names'),
        ),
     //   body:  Center(
       //    child:  Text(wordPair.asPascalCase),
     //   ),
    //  ),
    );
  }
}

 class RandomWords extends StatefulWidget{
    @override
   RandomWordsState createState() => RandomWordsState();
 }

class RandomWordsState extends State<RandomWords> {
   final List<WordPair>_suggestions = <WordPair>[];
   final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context){
  //  final WordPair  wordPair = WordPair.random();
  //  return Text(wordPair.asPascalCase);
      return Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),

        ),
        body: _buildSuggestions(),

      );

  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16),

      // ignore: missing_return
      itemBuilder: (BuildContext _context, int i){
        if(i.isOdd){
          return Divider();
        }

        final int index = i ~/ 2;

          if (index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);

      }
    );


  }
  Widget _buildRow(WordPair pair){
     return ListTile(
       title: Text(
         pair.asPascalCase,
         style: _biggerFont,
       )
     );

  }


}