import 'package:flutter/material.dart';

import '../../global/color.dart';
import './hexagon.dart';

class NavBar extends StatefulWidget {
  final int idx;
  final Function change;
  const NavBar({
    Key? key,
    required this.idx,
    required this.change,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(2, -4),
                color: Colors.black12,
              ),
            ],
          ),
          width: width,
          padding: EdgeInsets.fromLTRB(0, 4, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => widget.change(0),
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                  color: widget.idx == 0
                      ? kdarkBlue
                      : kblackSubHeading.withOpacity(0.3),
                ),
              ),
              SizedBox(
                width: 60,
              ),
              IconButton(
                onPressed: () => widget.change(1),
                icon: Icon(
                  Icons.health_and_safety,
                  size: 30,
                  color: widget.idx == 1
                      ? kdarkBlue
                      : kblackSubHeading.withOpacity(0.3),
                ),
              ),
              SizedBox(
                width: 60,
              ),
              IconButton(
                onPressed: () => widget.change(2),
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: widget.idx == 2
                      ? kdarkBlue
                      : kblackSubHeading.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   child: HexagonWidget(),
        //   top: -30,
        //   left: width / 2 - 30,
        //   right: width / 2 - 30,
        // )
      ],
    );
  }
}
