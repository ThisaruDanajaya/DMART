
import 'package:final_projrct/pages/InSide/NavBar/cunavbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tabs/home_tab.dart';
import 'tabs/homeorder_tab.dart';
import 'tabs/notificationtab.dart';
import 'tabs/profile_tab.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  PageController? _tabspagecontroller;
  int? _selecedTab;

  @override
  void initState() {
    _tabspagecontroller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabspagecontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabspagecontroller,
              onPageChanged: (num) {
                setState(() {
                  _selecedTab = num;
                });
              },
              children: [
                hometab(),
                ordertab(),
                notificationtab(),
                profiletab(),
              ],
            ),
          ),
          cunavbar(
            selectedTab: _selecedTab,
            tabPressed: (num) {
              _tabspagecontroller!.animateToPage(num,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInCubic);
            },
          ),
        ],
      ),
    );
  }
}
