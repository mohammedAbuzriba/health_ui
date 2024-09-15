import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, Jane"),
            Text(
              "How are you felling today?",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print("");
              }
            },
            icon: const Icon(Ionicons.notifications),
          ),
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print("");
              }
            },
            icon: const Icon(Ionicons.search_outline),
          )
        ],
      ),
      body: ListView(
        children: const [],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Ionicons.home_outline,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Ionicons.calendar_outline,
                ),
                label: "Calender"),
            BottomNavigationBarItem(
                icon: Icon(
                  Ionicons.chatbubble_ellipses_outline,
                ),
                label: "Chats"),
            BottomNavigationBarItem(
                icon: Icon(
                  Ionicons.person_outline,
                ),
                label: "Profile")
          ]),
    );
  }
}
