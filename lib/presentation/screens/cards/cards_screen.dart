import 'package:flutter/material.dart';

const cards = <Map<String,dynamic>>[
  {'elevantion':0.0, 'label':'Elevantion 0'},
  {'elevantion':1.0, 'label':'Elevantion 1'},
  {'elevantion':2.0, 'label':'Elevantion 2'},
  {'elevantion':3.0, 'label':'Elevantion 3'},
  {'elevantion':4.0, 'label':'Elevantion 4'},
  {'elevantion':5.0, 'label':'Elevantion 5'},
];

class CardsScreen extends StatelessWidget {

  static const name ='cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) => _CardElevantion(label: card['label'], elevantion: card['elevantion'])),
          ...cards.map((card) => _CardBorder(label: card['label'], elevantion: card['elevantion'])),
          ...cards.map((card) => _CardColor(label: card['label'], elevantion: card['elevantion'])),
          ...cards.map((card) => _CardImage(label: card['label'], elevantion: card['elevantion'])),
          // const SizedBox(height: 30) //Para dejar un escacio al final de la pantalla
        ],
        
      ),
    );
  }
}

class _CardElevantion extends StatelessWidget {

  final String label;
  final double elevantion;

  const _CardElevantion({
    required this.label, 
    required this.elevantion
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevantion,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                        icon: const Icon(Icons.more_vert_outlined),
                        onPressed: (){},
                      )
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardBorder extends StatelessWidget {

  final String label;
  final double elevantion;

  const _CardBorder({
    required this.label, 
    required this.elevantion
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevantion,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                        icon: const Icon(Icons.more_vert_outlined),
                        onPressed: (){},
                      )
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardColor extends StatelessWidget {

  final String label;
  final double elevantion;

  const _CardColor({
    required this.label, 
    required this.elevantion
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceContainerHighest,
      elevation: elevantion,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                        icon: const Icon(Icons.more_vert_outlined),
                        onPressed: (){},
                      )
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$label - Filled'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {

  final String label;
  final double elevantion;

  const _CardImage({
    required this.label, 
    required this.elevantion
    });

  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevantion,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevantion.toInt()}/600/250',
            height: 250,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
              ),
              child: IconButton(
                        icon: const Icon(Icons.more_vert_outlined),
                        onPressed: (){},
                      ),
            )
          ),           
        ],
      ),
    );
  }
}