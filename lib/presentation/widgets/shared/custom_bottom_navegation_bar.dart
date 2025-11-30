import 'package:flutter/material.dart';

class CustomBottomNavegationBar extends StatelessWidget {
  const CustomBottomNavegationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border_outlined),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
