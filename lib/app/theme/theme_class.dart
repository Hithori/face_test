import 'dart:ui';

import 'colors.dart';

const theme = ThemeClass();

class ThemeClass {
  final ColorsClass colors;
  final ColorsClass darkColors;

  const ThemeClass({
    this.colors = const ColorsClass(
      brand: Brand(
        primary: Color(0xFFC60033),
        secondary: Color(0xFFFDf0F4),
      ),
      ui: Ui(
        white: Color(0xFFFFFFFF),
        black: Color(0xFF212122),
      ),
      background: Bg(
        gray1: Color(0xFF778A9B),
        gray2: Color(0xFFEBEDF0),
        gray3: Color(0xFFF9F9F9),
        gray4: Color(0xFFF5F5F5),
        gray4_2: Color(0xFFD3D2D3),
      ),
    ),

    /// TODO: need to refactored for dark theme
    this.darkColors = const ColorsClass(
      brand: Brand(
        primary: Color(0xFFC60033),
        secondary: Color(0xFFFDf0F4),
      ),
      ui: Ui(
        white: Color(0xFFFFFFFF),
        black: Color(0xFF212122),
      ),
      background: Bg(
        gray1: Color(0xFF778A9B),
        gray2: Color(0xFFEBEDF0),
        gray3: Color(0xFFF9F9F9),
        gray4: Color(0xFFF5F5F5),
        gray4_2: Color(0xFFD3D2D3),
      ),
    ),
  });
}
