import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const name ='buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _BottonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        }
        ),
    );
  }
}

class _BottonsView extends StatelessWidget {
  
  const _BottonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            //* Botones Prediseñados
            //* Elevate Button
            ElevatedButton(
              onPressed: (){}, 
              child: const Text('Elevated Button')
            ),
            const ElevatedButton(
              onPressed: null, 
              child: Text('Elevated Button Disabled')
            ),
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Button Icon')
            ),
            //* Filled Button
            FilledButton(
              onPressed: (){}, 
              child: const Text('Filled Button')
            ),
            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.accessibility_new),
              label: const Text('Filled Button Icon'),
            ),
            //* Outline Button
            OutlinedButton(
              onPressed: (){}, 
              child: const Text('Outlined Button')
            ),
            OutlinedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.terminal),
              label: const Text('Outlined Button Icon')
            ),
            //* Text Button
            TextButton(
              onPressed: (){}, 
              child: const Text('Text Button')
            ),
             TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.account_box_sharp),
              label: const Text('Text Button Icon')
            ),
            //* Icon Button
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.account_box_outlined)
            ),
             IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.account_box_outlined),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.secondary),
                iconColor: const WidgetStatePropertyAll(Colors.white)
              )
            ),
            const _CustomButton()
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {

  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo',style: TextStyle(color: Colors.white))
            ),
        ),
      ),
    );
  }
}