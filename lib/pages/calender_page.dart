import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/doctor_model.dart';
import '../widgets/appointment_card.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CupertinoSlidingSegmentedControl(
            padding: const EdgeInsets.all(5),
            groupValue: activeIndex,
            children: const {
              0: Text("Upcoming"),
              1: Text("Complete"),
              2: Text("Results")
            },
            onValueChanged: (value) {
              setState(() {
                activeIndex = value!;
              });
            },
          ),
          const SizedBox(
            height: 25,
          ),

          ...nearbyDoctors.map((doctor) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: AppointmentCard(
                  doctorImage: doctor.profile,
                  doctorName: doctor.name,
                ),
              )),

          // إنشاء قائمة تحتوي على 10 عناصر من AppointmentCard
          // ...List.generate(
          //   10,
          //   (index) => const Padding(
          //     padding: EdgeInsets.only(bottom: 16.0), // إضافة مسافة
          //     child: AppointmentCard(
          //       doctorImage: 'assets/doctor_2.jpg',
          //       doctorName: "Dr. Ruben Dorwart",
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
