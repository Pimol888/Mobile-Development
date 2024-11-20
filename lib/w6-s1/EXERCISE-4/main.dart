import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: const JokeList(),
      ),
    ));

// Joke model class
class Joke {
  String title;
  String description;
  bool isFavorite;
  bool isBest;

  Joke({
    required this.title,
    required this.description,
    this.isFavorite = false,
    this.isBest = false,
  });
}

class JokeList extends StatefulWidget {
  const JokeList({super.key});

  @override
  _JokeListState createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  // List of jokes
  final List<Joke> jokes = List.generate(
    20,
    (index) => Joke(
      title: 'Joke #${index + 1}',
      description: 'This is the description for joke #${index + 1}.',
    ),
  );

  // Function to handle favorite click
  void onFavoriteClick(int index) {
    setState(() {
      if (jokes[index].isFavorite) {
        jokes[index].isFavorite = false;  // Unmark the favorite
      } else {
        // Unmark all other jokes and mark this one as favorite
        for (var joke in jokes) {
          joke.isFavorite = false;
        }
        jokes[index].isFavorite = true;
      }
    });
  }

  // Function to handle best joke click
  void onBestJokeClick(int index) {
    setState(() {
      if (jokes[index].isBest) {
        jokes[index].isBest = false;  // Unmark the best joke
      } else {
        // Unmark all other jokes and mark this one as best joke
        for (var joke in jokes) {
          joke.isBest = false;
        }
        jokes[index].isBest = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return JokeCard(
          joke: jokes[index],
          onFavoriteClick: () => onFavoriteClick(index),
          onBestJokeClick: () => onBestJokeClick(index),
        );
      },
    );
  }
}

class JokeCard extends StatelessWidget {
  final Joke joke;
  final VoidCallback onFavoriteClick;
  final VoidCallback onBestJokeClick;

  const JokeCard({
    super.key,
    required this.joke,
    required this.onFavoriteClick,
    required this.onBestJokeClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: onFavoriteClick,
                icon: Icon(
                  joke.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: joke.isFavorite ? Colors.red : Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              IconButton(
                onPressed: onBestJokeClick,
                icon: Icon(
                  joke.isBest ? Icons.star : Icons.star_border,
                  color: joke.isBest ? Colors.yellow : Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
