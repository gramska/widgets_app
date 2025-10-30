
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const name ='home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scafolKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: scafolKey,
      appBar: AppBar(
        title: const Text('Widgets + Material3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scafolKey: scafolKey)
    );
  }
}

class _HomeView extends StatelessWidget {

  const _HomeView(); 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index){
        final menuItem = appMenuItems[index];
        return _CustomListTitle(menuItem: menuItem);
      }, 
      
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: (){
        //* Usamos un complemento fuera de Flutter llamado go_router
        //* context.pushNamed(CardsScreen.name); //Implementado Rutas con nombres
        context.push(menuItem.link);
      },
    );
  }
}