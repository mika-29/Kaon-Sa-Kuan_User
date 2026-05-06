import 'package:flutter/material.dart';

/*
==================================================================================
   This is a dumb file containing the app colors for our app, derived from figma.
   This will be structured in a manner that if someday, you guys decide to add more
   themes. It will be used by the app themes, which will be the one containing the
   logic. If you ever need to change a color or whatever, go to this file.
==================================================================================
*/

class AppColors {
  AppColors._();

  static const orange = _OrangeColorCollection(); // DEFAULT ORANGE THEME ONLY FOR NOW
}

class _OrangeColorCollection{
  const _OrangeColorCollection();

  // Background colors for page, card, and field
  final appBackground = const Color(0xFFFFF5F0); // CREAM PEACH, for page background
  final cardSectionBackground = const Color(0xFFF0E8E2); // LINEN ROSE, for cards and sections

  // Widget and Branding colors
  final activeElement = const Color(0xFFF47B42); // WARM TANGERINE, for primary CTA and active tabs
  final highlights = const Color(0xFFF9C06A); // HONEY GOLD, for ratings and highlights
  final healthyTag = const Color(0xFFD5EDDB); // MINT LEAF, for healthy / vegan tags
  final categoryChip = const Color(0xFFFCEBD5); // SOFT APRICOT, for category chips
  final promoElement = const Color(0xFFEDE6FB); // LAVENDER MIST, for promo / new items
  final favoriteElement = const Color(0xFFFDDE7); // BLUSH BERRY, for favorites and hearts
  final cancelButton = const Color(0xFF3A2F2E); // BROWN???

  // text colors
  final pageTitleText = const Color(0xFFFFFFFF); // WHITE
  final bodyText = const Color(0xFF000000); // BLACK
  final hintText = const Color(0xFFF47B42); // ORANGE
}
