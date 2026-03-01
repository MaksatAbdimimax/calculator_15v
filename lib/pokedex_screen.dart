import 'package:calculator_15v/pokedex_model.dart';
import 'package:calculator_15v/pokemon_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final bulbaUrl = 'https://sg.portal-pokemon.com/play/resources/pokedex/img/pm/cf47f9fac4ed3037ff2a8ea83204e32aff8fb5f3.png';

  final charmaUrl = 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/detail/004.png';

  final cquirUrl = 'https://static.wikia.nocookie.net/p__/images/7/79/Squirtle_SSBU.png/revision/latest?cb=20200728042547&path-prefix=protagonist';

  final buttrUrl = 'https://i.pinimg.com/474x/e5/e0/15/e5e015e6454faebee45b5065cbf9c888.jpg';

  final pikaUrl = 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/detail/025.png';

  final castUrl = 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/detail/092.png';

  final dittUrl = 'https://marriland.com/wp-content/plugins/marriland-core/images/pokemon/sprites/home/full/ditto.png';

  final mewUrl = 'https://p1.hiclipart.com/preview/191/603/589/mew-png-clipart.jpg';

  final aronUrl = 'https://e7.pngegg.com/pngimages/281/573/png-clipart-pokemon-x-and-y-pokemon-gold-and-silver-aron-lairon-aron-pilhofer-video-game-sports-equipment-thumbnail.png';

  late List <PokedexModel> listPokemon;

  @override
  void initState(){
    super.initState();
     listPokemon =   [
      PokedexModel(name: 'Bulbasaur', number: 1, imageUrl: bulbaUrl, color: Colors.green),
      PokedexModel(name: 'Charmander', number: 2, imageUrl: charmaUrl, color: Colors.orange),
      PokedexModel(name: 'Squirtle', number: 3, imageUrl: cquirUrl, color: Colors.blue),
       PokedexModel(name: 'Butterfly', number: 4, imageUrl: buttrUrl, color: Colors.lightGreen),
       PokedexModel(name: 'Pikachu', number: 5, imageUrl: pikaUrl, color: Colors.yellow),
       PokedexModel(name: 'Gastly', number: 6, imageUrl: castUrl, color: Colors.purple),
       PokedexModel(name: 'Ditto', number: 7, imageUrl: dittUrl, color: Colors.lime),
       PokedexModel(name: 'Mew', number: 8, imageUrl: mewUrl, color: Colors.pinkAccent),
       PokedexModel(name: 'Aron', number: 9, imageUrl: aronUrl, color: Colors.grey),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              buildToolbar(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = listPokemon[index];
                    return pokemonCard(context, item);
                  },
                  itemCount: listPokemon.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pokemonCard(BuildContext context, PokedexModel model) {
    return GestureDetector(

      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute<void>(
              builder: (context)=> PokemonDetailScreen(model: model)),
        );
      },
      child: Container(

        decoration: BoxDecoration(
          border: Border.all(color: model.color, width: 10),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('#${model.number}', style: TextStyle(fontSize: 12, color: model.color)),
            Center(child: Image.network(
                model.imageUrl,
                height: 50,
            )
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              color: model.color,
              child: Text(
                model.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildToolbar() {
    return Row(
      children: [
        Icon(Icons.catching_pokemon, size: 48),
        SizedBox(width: 16),
        Text(
          'Pokedex',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        Spacer(),
        Icon(Icons.arrow_downward_outlined, size: 50),
      ],
    );
  }
}
