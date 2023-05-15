import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onIndexChanged;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BottomAppBar(
          color: const Color(0xFF0093E5),
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Image.asset(
                  'assets/home-button.png',
                  color: selectedIndex == 0
                      ? const Color(0xFFBBF246)
                      : Colors.white,
                ),
                onPressed: () {
                  onIndexChanged(0);
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/Variant2.png',
                  color: selectedIndex == 1
                      ? const Color(0xFFBBF246)
                      : Colors.white,
                ),
                onPressed: () {
                  onIndexChanged(1);
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/bubble.png',
                  color: selectedIndex == 2
                      ? const Color(0xFFBBF246)
                      : Colors.white,
                ),
                onPressed: () {
                  onIndexChanged(2);
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/Profilenav.png',
                  color: selectedIndex == 3
                      ? const Color(0xFFBBF246)
                      : Colors.white,
                ),
                onPressed: () {
                  onIndexChanged(3);
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/Profilebar.png',
                  color: selectedIndex == 4
                      ? const Color(0xFFBBF246)
                      : Colors.white,
                ),
                onPressed: () {
                  onIndexChanged(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
