import 'package:flutter/material.dart';

class cunavbar extends StatefulWidget {
  final int? selectedTab;
  final Function(int)? tabPressed;

  cunavbar({
    this.selectedTab,
    this.tabPressed,
  });

  @override
  State<cunavbar> createState() => _cunavbarState();
}

class _cunavbarState extends State<cunavbar> {
  int _selectedtab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedtab = widget.selectedTab ?? 0;
    return Container(

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 30.0,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            imagePath: "assets/images/home.png",
            selected: _selectedtab == 0 ? true : false,
            onPressed: () {
              widget.tabPressed!(0);
            },
          ),
          BottomTabBtn(
            imagePath: "assets/images/order.png",
            selected: _selectedtab == 1 ? true : false,
            onPressed: () {
              widget.tabPressed!(1);
            },
          ),
          BottomTabBtn(
            imagePath: "assets/images/noti.png",
            selected: _selectedtab == 2 ? true : false,
            onPressed: () {
              widget.tabPressed!(2);
            },
          ),
          BottomTabBtn(
            imagePath: "assets/images/ptofile.png",
            selected: _selectedtab == 3 ? true : false,
            onPressed: () {
              widget.tabPressed!(3);
            },
          ),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final String? imagePath;
  final bool? selected;
  final Function()? onPressed;

  BottomTabBtn({
    this.imagePath,
    this.selected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: _selected
                  ? Theme.of(context).accentColor
                  : Colors.transparent,
              width: 3.0,
            ),
          ),
        ),
        child: Image(
          image: AssetImage(imagePath ?? "assets/images/home.png"),
          width: 26.0,
          height: 30.0,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}
