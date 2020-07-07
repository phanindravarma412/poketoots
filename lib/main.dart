import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(PokeToots());
}

class PokeToots extends StatefulWidget {
  @override
  _PokeTootsState createState() => _PokeTootsState();
}

class _PokeTootsState extends State<PokeToots> {
  var pokemonNames = [
    "blastoise",
    "bulbasaur",
    "eevee",
    "pikachu",
    "squirtle",
    "togepi"
  ];
  void playSound(int pokeNum) {
    final player = AudioCache();
    player.play("${pokemonNames[pokeNum]}.wav");
  }

  Expanded generatePokemon({color, pokeNum}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: FlatButton(
          splashColor: color,
          highlightColor: color,
          padding: EdgeInsets.all(0),
          onPressed: () {
            playSound(pokeNum);
          },
          child: (Container(
//        height: 231,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage("images/${pokemonNames[pokeNum]}.png"),
                    height: 120,
                    width: 120,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${pokemonNames[pokeNum][0].toUpperCase() + pokemonNames[pokeNum].substring(1)} ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    generatePokemon(color: Colors.brown, pokeNum: 0),
                    generatePokemon(color: Colors.green, pokeNum: 1),
                  ],
                ),
                Row(
                  children: <Widget>[
                    generatePokemon(color: Colors.orange, pokeNum: 2),
                    generatePokemon(color: Colors.yellow, pokeNum: 3),
                  ],
                ),
                Row(
                  children: <Widget>[
                    generatePokemon(color: Colors.blue, pokeNum: 4),
                    generatePokemon(color: Colors.purple, pokeNum: 5),
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
