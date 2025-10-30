import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final styleTextConunt = Theme.of(context).textTheme.titleLarge;
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: (){
              // ref.read(darkModeProvide.notifier).state = !isDarkMode;
                ref.read(darkModeProvider.notifier).update((isDarkMode) => !isDarkMode);
            },
            icon: Icon(isDarkMode?
                        Icons.light_mode_outlined:
                        Icons.dark_mode_outlined)
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter', style: styleTextConunt),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //       Text('Valor: 10', style: styleTextConunt),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          //* Otra forma de implemenetarlo
          // ref.read(counterProvider.notifier).update((state) => state+1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}