import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:useful_widget_sample/controllers/home_controller.dart';
import 'package:useful_widget_sample/view/adaptive_page.dart';
import 'package:useful_widget_sample/view/fitted_box_page.dart';
import 'package:useful_widget_sample/view/wrap_page.dart';

enum Menu { terms, privacy, contact }
final List<String> _tabNames = [
  "FittedBox",
  "Adaptive",
  "Wrap",
];

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.watch(homeProvider);
    return Scaffold(
      appBar: _homeAppBar(homeController),
      body: _homeBody(context, homeController),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black12,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          fixedColor: Colors.deepOrange,
          onTap: homeController.onTabTapped,
          currentIndex: homeController.currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.fit_screen),
              label: _tabNames[0],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.mobile_friendly),
              label: _tabNames[1],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.subdirectory_arrow_left),
              label: _tabNames[2],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _homeAppBar(HomeController homeController) {
    final currentIndex = homeController.currentIndex;
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: _tabNames[currentIndex],
              style: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeBody(BuildContext context, HomeController homeController) {
    final currentIndex = homeController.currentIndex;
    return Stack(
      children: <Widget>[
        _tabPage(currentIndex, 0, const FittedBoxPage()),
        _tabPage(currentIndex, 1, const AdaptivePage()),
        _tabPage(currentIndex, 2, const WrapPage()),
      ],
    );
  }

  Widget _tabPage(int currentIndex, int tabIndex, StatelessWidget page) {
    return Visibility(
      visible: currentIndex == tabIndex,
      maintainState: true,
      child: page,
    );
  }
}
