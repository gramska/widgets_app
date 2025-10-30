
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable (sin cambiar)
final colorListProvider = Provider((red) => colorList);

// Booleano simple 
final darkModeProvider = StateProvider<bool>((ref) => true);

final selectedColorProvider = StateProvider<int>((ref) => 0);
