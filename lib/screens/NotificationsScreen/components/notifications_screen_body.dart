import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/screens/NotificationsScreen/components/notification_tile.dart';

class NotificationsScreenBody extends StatefulWidget {
  const NotificationsScreenBody({super.key});

  @override
  State<NotificationsScreenBody> createState() =>
      _NotificationsScreenBodyState();
}

class _NotificationsScreenBodyState extends State<NotificationsScreenBody> {
  List<Map<String, dynamic>> notifications = [
    {
      'icon': Icons.notifications,
      'title': 'Welcome!',
      'subtitle': 'Thanks for signing up.'
    },
    {
      'icon': Icons.update,
      'title': 'Update Required',
      'subtitle': 'Please update the app to continue.'
    },
    {
      'icon': Icons.message,
      'title': 'New Message',
      'subtitle': 'You have a new message from support.'
    },
    {
      'icon': Icons.event,
      'title': 'Event Reminder',
      'subtitle': 'Don\'t forget the event tomorrow.'
    },
    {
      'icon': Icons.info,
      'title': 'Info',
      'subtitle': 'Some useful information for you.'
    },
  ];

  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10.h,
          children: List.generate(
            notifications.length,
            (index) => NotificationTile(
              icon: notifications[index]["icon"],
              title: notifications[index]["title"],
              subtitle: notifications[index]["subtitle"],
              onDelete: () => deleteNotification(index),
            ),
          ),
        ),
      ),
    );
  }
}
