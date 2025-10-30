
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable (sin cambiar)
final colorListProvider = Provider((red) => colorList);

// Booleano 
final darkModeProvider = StateProvider<bool>((ref) => true);

// Entero
final selectedColorProvider = StateProvider<int>((ref) => 0);


// Objeto personalizado [AppTheme]
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>((ref) => ThemeNotifier(AppTheme()));

// Tambien se podria definir como un controller [ThemeNotifierController]
class ThemeNotifier extends StateNotifier<AppTheme> {

  // Crea una estancioa de AppTheme()
  ThemeNotifier(super.state);
  // ThemeNotifier(): super(AppTheme());

  void toggleDarkMode() { 
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }  
}