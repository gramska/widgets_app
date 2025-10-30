import 'package:flutter/material.dart';

class MenuItem {

  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon
  });
}

const appMenuItems = <MenuItem>[

    MenuItem(
      title: 'Reverpod Counter', 
      subtitle: 'Introducción a Reverpod', 
      link: '/counter', 
      icon: Icons.add_circle_outline_rounded
    ),
    
    MenuItem(
      title: 'Botones', 
      subtitle: 'Varios botones en Flutter', 
      link: '/buttons', 
      icon: Icons.smart_button_outlined
    ),

    MenuItem(
      title: 'Targetas', 
      subtitle: 'Un contenedor estilizado', 
      link: '/cards', 
      icon: Icons.credit_card
    ),

    MenuItem(
      title: 'Progress Indicators',
      subtitle: 'Generales y Controlados',
      link: '/progress',
      icon: Icons.refresh_rounded
    ),

    MenuItem(
      title: 'Snackbars y diálogos', 
      subtitle: 'Indicadores en pantalla', 
      link: '/snackbars', 
      icon: Icons.info_outline
    ),

    MenuItem(
      title: 'Animated container', 
      subtitle: 'Stataful widget animado', 
      link: '/animated', 
      icon: Icons.check_box_outline_blank_rounded
    ),

    MenuItem(
      title: 'UI controls + Tiles', 
      subtitle: 'Seria de controles de Flutter', 
      link: '/ui-controls', 
      icon: Icons.car_rental_outlined
    ),

    MenuItem(
      title: 'Introducción a la aplicación', 
      subtitle: 'Tutorial introductorio', 
      link: '/tutorial', 
      icon: Icons.accessible_rounded
    ),

    MenuItem(
      title: 'Infinite scroll y Pull', 
      subtitle: 'Vistas infitas y refresh', 
      link: '/infinite', 
      icon: Icons.list_alt_rounded
    ),

    MenuItem(
      title: 'cambiar tema', 
      subtitle: 'Cambiar tema global de la aplicación', 
      link: '/theme-changer', 
      icon: Icons.color_lens_outlined
    )
  ];