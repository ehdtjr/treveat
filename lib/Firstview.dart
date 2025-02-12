import 'package:flutter/material.dart';
import 'package:flutter_app/tab/before_friend.dart';
import 'package:flutter_app/kakao/login_view.dart';
import 'package:flutter_app/tab/map.dart';
import 'package:flutter_app/tab/list.dart';

String loc_code_='A1002';

class Firstview extends StatefulWidget {
  @override
  State<Firstview> createState() => _TestViewState();
}

class _TestViewState extends State<Firstview>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(
            () => setState(() => _selectedIndex = _tabController.index));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          //FormScreen(loc_code_),
          MapScreen(),
          ImageDisplay(),
          Before_friend(),
          login_view(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.black,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                _selectedIndex == 0 ? Icons.map : Icons.map_outlined,
              ),
              text: "Map",
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 1 ? Icons.article : Icons.article_outlined,
              ),
              text: "List",
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 2
                    ? Icons.people_alt
                    : Icons.people_alt_outlined,
              ),
              text: "Friends",
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 3 ? Icons.person : Icons.person_2_outlined,
              ),
              text: "MyPage",
            ),
          ],
        ),
      ),
    );
  }
}
