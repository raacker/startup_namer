import "package:flutter/material.dart";
import "package:english_words/english_words.dart";
import "starred_list.dart";

class NameList extends StatefulWidget {
  @override
  State<NameList> createState() =>_NameListState();
}

class _NameListState extends State<NameList> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);
  List<WordPair> _words = <WordPair>[];
  Set<WordPair> _savedWords = <WordPair>{};
  final int _listIncrementFactor = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StarredList(
                        _savedWords.map((wordPair) => wordPair.asPascalCase).toList()
                    ),
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: generateWordLists(),
      ),
    );
  }

  ListView generateWordLists() {
    return ListView.builder(
      padding: const EdgeInsets.all(5.0),
      itemBuilder: (context, position) {
        if (position.isOdd) {
          return Divider();
        }

        // Get integer result from divide
        int currentWordIndex = position ~/ 2;
        if (currentWordIndex >= _words.length) {
          _words.addAll(generateWordPairs().take(_listIncrementFactor));
        }
        return generateRow(_words[currentWordIndex]);
      },
    );
  }

  ListTile generateRow(WordPair pair) {
    bool isStarred = _savedWords.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      trailing: IconButton(
        icon: Icon(isStarred ? Icons.star : Icons.star_border),
        color: isStarred ? Colors.red : Colors.grey,
        onPressed: () {
          setState(() {
            if (isStarred) {
              _savedWords.remove(pair);
            } else {
              _savedWords.add(pair);
            }
          });
        },
      ),
    );
  }
}
