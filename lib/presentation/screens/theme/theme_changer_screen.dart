import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screeen';

  const ThemeChangerScreen({super.key});

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //  final bool isDarkMode = ref.watch(darkModeProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode; 
     
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: (){
              // ref.read(darkModeProvide.notifier).state = !isDarkMode;
              // ref.read(darkModeProvider.notifier).update((isDarkMode) => !isDarkMode);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: Icon(isDarkMode?
                        Icons.light_mode_outlined:
                        Icons.dark_mode_outlined)
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {

  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        
        return RadioGroup(
          onChanged: (value){
            //* UPDATE si necesitamos conocer el valor anterios
            // ref.read(selectedColorProvider.notifier).update((selectColor) => value!); 
            // ref.read(selectedColorProvider.notifier).state = value;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);

          }, 
          groupValue: selectedColor,
          child: Column(
            children: [
              RadioListTile(
                title: Text('Este color', style: TextStyle(color: color)),
                subtitle: Text('${color.toARGB32()}'),
                activeColor: color,
                value: index
              )
            ],
          )
        );
      },
    );
  }
}