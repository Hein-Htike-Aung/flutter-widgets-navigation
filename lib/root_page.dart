import 'package:flutter/material.dart';
import 'package:widgets_navigation/home_page.dart';
import 'package:widgets_navigation/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Widget Navigation'),
        ),
        body: pages[currentPage],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('Floating Action');
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
          ],
          onDestinationSelected: (int index) {
            // refresh the secreen (to use statefull widget)
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ));
  }
}
