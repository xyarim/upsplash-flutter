import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  static int _inverted(int color) {
    return Color(0xffffff).value ^ color;
  }

  HexColor(final String hexColor, {bool inverted = false})
      : super(inverted
      ? _inverted(_getColorFromHex(hexColor))
      : _getColorFromHex(hexColor));
}
