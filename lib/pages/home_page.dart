import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../controller/bottom_nav_controller.dart';
import '../widgets/health_needs.dart';
import '../widgets/nearby_doctors.dart';
import '../widgets/upcoming_card.dart';
import 'calender_page.dart';

class HomePage extends StatelessWidget {
  // إنشاء instance من Controller
  final BottomNavController controller = Get.put(BottomNavController());

  // صفحات التنقل
  final List<Widget> pages = [
    const MainHomePage(),
    const CalendarPage(),
    const Center(child: Text('Chat Page')),
    const Center(child: Text('Profile Page')),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, Jane"),
            Text(
              "How are you feeling today?",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.notifications_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.search_outline),
          ),
        ],
      ),
      // استخدام Obx لمراقبة الصفحة الحالية بناءً على الفهرس
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Theme.of(context)
              .primaryColor
              .withOpacity(0.8), // لون العنصر النشط
          unselectedItemColor: Colors.grey, // لون العنصر غير النشط
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              activeIcon: Icon(Ionicons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.calendar_outline),
              activeIcon: Icon(Ionicons.calendar),
              label: "Calendar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.chatbubble_ellipses_outline),
              activeIcon: Icon(Ionicons.chatbubble_ellipses),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person_outline),
              activeIcon: Icon(Ionicons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(14),
      children: [
        const UpcomingCard(),
        const SizedBox(height: 20),
        Text(
          "Health Needs",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 15),
        const HealthNeeds(),
        const SizedBox(height: 25),
        Text(
          "Nearby Doctors",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 15),
        const NearbyDoctors(),
      ],
    );
  }
}
