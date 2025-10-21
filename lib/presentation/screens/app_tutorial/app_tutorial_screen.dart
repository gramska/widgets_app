import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Slideinfo {
  final String title;
  final String caption;
  final String imageUrl;

  Slideinfo(this.title, this.caption, this.imageUrl);
}

final slides = <Slideinfo>[
  Slideinfo(
    'Busca la comida',
    'orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
    'assets/images/1.png',
  ),
  Slideinfo(
    'Entrega rápida',
    'orem ipsum dolor sit amet, consectetur adipiscing elit, ',
    'assets/images/2.png',
  ),
  Slideinfo(
    'Disfruta la comida',
    'orem ipsum dolor sit amet, ',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;
  // String pagination = '1/3';

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {   

      

      final page = pageViewController.page ?? 0;

      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      } 

      // if(page%1==0){
      //   pagination = '${page.toInt()+1}/${slides.length}';
      // }
      // setState(() {});
      
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: (slides
              .map(
                (slideData) => _Slide(
                  title: slideData.title,
                  caption: slideData.caption,
                  imageUrl: slideData.imageUrl,
                ),
              ).toList()),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(), 
              child: const Text('Salir')
            )
          ),
          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: ()=> context.pop(), 
                child: const Text('Comenzar'),
              ),
            )
          ): const SizedBox(),
          // Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,           
          //     children: [
          //       Text(pagination),
          //       const SizedBox(
          //         height: 30
          //       )
          //     ]
          //   ),
          // )
        ]        
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //* Alineacion vertical (alinea al centro)
          crossAxisAlignment: CrossAxisAlignment.start, //* Alineacion horizontal (alinea a la izquierda)
          children: [
            Image(
              image: AssetImage(imageUrl)
            ),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle,)
          ],
        ),
      ),
    );
  }
}
