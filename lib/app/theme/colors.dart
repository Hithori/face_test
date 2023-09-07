import 'dart:ui';

class ColorsClass {
  final Brand brand;
  final Ui ui;
  final Bg background;

  const ColorsClass({
    required this.brand,
    required this.ui,
    required this.background,
  });
}

class Brand {
  final Color primary;
  final Color secondary;

  const Brand({
    required this.primary,
    required this.secondary,
  });
}

class Ui {
  final Color white;
  final Color black;

  const Ui({
    required this.white,
    required this.black,
  });
}

class Bg {
  final Color gray1;
  final Color gray2;
  final Color gray3;
  final Color gray4;
  final Color gray4_2;

  const Bg({
    required this.gray1,
    required this.gray2,
    required this.gray3,
    required this.gray4,
    required this.gray4_2,
  });
}
