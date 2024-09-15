import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorImage;
  final String doctorName;

  const AppointmentCard({
    super.key,
    required this.doctorImage,
    required this.doctorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 200, // يمكنك تقليل هذا الارتفاع إذا لزم الأمر
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              doctorImage, // استخدام الصورة المرسلة كمعامل
              width: 45,
              height: 45, // إضافة ارتفاع محدد للصورة لتجنب التجاوز
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName, // استخدام الاسم المرسل كمعامل
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Dental Specialist",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Ionicons.calendar_outline,
                        size: 18,
                        color: Colors.black87,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6, right: 14),
                        child: Text(
                          "Today",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(
                          Ionicons.time_outline,
                          size: 18,
                        ),
                      ),
                      Text(
                        "14:30 - 15:30 AM",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    SizedBox(
                      height: 32,
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text('Cancel')),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 32,
                      child: FilledButton(
                          onPressed: () {}, child: const Text('Reschedule')),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
