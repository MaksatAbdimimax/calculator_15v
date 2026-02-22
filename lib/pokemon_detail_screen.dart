import 'package:calculator_15v/pokedex_model.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokedexModel model;

  const PokemonDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: model.color,
        body: Stack(
          children: [

            Positioned(
              top: 20,
              right: -40,
              child: Icon(
                Icons.catching_pokemon,
                size: 260,
                color: Colors.white.withOpacity(0.2),
              ),
            ),


            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        model.name,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '#00${model.number}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),


                Image.network(
                  model.imageUrl,
                  height: 180,
                ),

                const SizedBox(height: 10),


                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [

                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            color: model.color,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Fire",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 20),


                        Text(
                          "About",
                          style: TextStyle(
                            color: model.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 15),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Column(
                              children: [
                                Icon(Icons.monitor_weight_outlined),
                                SizedBox(height: 4),
                                Text("8,5 kg"),
                                Text("Weight",
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.height),
                                SizedBox(height: 4),
                                Text("0,6 m"),
                                Text("Height",
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.flash_on),
                                SizedBox(height: 4),
                                Text("Mega-Punch\nFire-Punch",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.",
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 25),


                        Text(
                          "Base Stats",
                          style: TextStyle(
                            color: model.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 15),

                        statRow("HP", 0.39, model.color),
                        statRow("ATK", 0.52, model.color),
                        statRow("DEF", 0.43, model.color),
                        statRow("SATK", 0.60, model.color),
                        statRow("SDEF", 0.50, model.color),
                        statRow("SPD", 0.65, model.color),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget statRow(String name, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              name,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: value,
              minHeight: 6,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ],
      ),
    );
  }
}