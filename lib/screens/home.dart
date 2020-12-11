import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quote_and_joke/screens/bookmarks.dart';
import 'package:quote_and_joke/screens/jokes.dart';
import 'package:quote_and_joke/screens/quotes.dart';
import 'package:quote_and_joke/screens/today.dart';
import 'package:quote_and_joke/services/visibility_helper.dart';
import 'package:quote_and_joke/widgets/bottom_nav_bar.dart';

final _currentPageIndexProvider = StateProvider<int>((ref) => 0);

class Home extends HookWidget {
  final List<Widget> _screens = [
    Today(),
    QuotesScreen(),
    Jokes(),
    Bookmarks(),
  ];

  void _onTap(int index, PageController pageController) {
    final context = useContext();
    final currentPageIndex = context.read(_currentPageIndexProvider);
    final hideScreen = context.read(hideScreenProvider);

    index == 1
        ? hideScreen.state = true
        : Future.delayed(
            const Duration(milliseconds: 20), () => hideScreen.state = false);

    currentPageIndex.state = index;

    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPageIndex = useProvider(_currentPageIndexProvider).state;

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: _screens,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentPageIndex,
        onTap: (index) => _onTap(index, pageController),
      ),
    );
  }
}
