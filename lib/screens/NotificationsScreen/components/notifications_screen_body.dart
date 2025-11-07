import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socks_store/screens/NotificationsScreen/components/notification_tile.dart';

class NotificationsScreenBody extends StatefulWidget {
  const NotificationsScreenBody({super.key});

  @override
  State<NotificationsScreenBody> createState() =>
      _NotificationsScreenBodyState();
}

class _NotificationsScreenBodyState extends State<NotificationsScreenBody> {
  List<Map<String, dynamic>> notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString('notifications');
    if (savedData != null) {
      final List<dynamic> decoded = jsonDecode(savedData);
      setState(() {
        notifications = decoded.map((e) => Map<String, dynamic>.from(e)).toList();
      });
    } else {
      notifications = [
        {
          'icon': Icons.notifications.codePoint,
          'title': 'Welcome!',
          'subtitle': 'Thanks for signing up.'
        },
        {
          'icon': Icons.update.codePoint,
          'title': 'Update Required',
          'subtitle': 'Please update the app to continue.'
        },
        {
          'icon': Icons.message.codePoint,
          'title': 'New Message',
          'subtitle': 'You have a new message from support.'
        },
        {
          'icon': Icons.event.codePoint,
          'title': 'Event Reminder',
          'subtitle': 'Don\'t forget the event tomorrow.'
        },
        {
          'icon': Icons.info.codePoint,
          'title': 'Info',
          'subtitle': 'Some useful information for you.'
        },
      ];
      await _saveNotifications();
    }
  }

  Future<void> _saveNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('notifications', jsonEncode(notifications));
  }

  void _deleteNotification(int index) async {
    setState(() {
      notifications.removeAt(index);
    });
    await _saveNotifications();
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
              icon: IconData(notifications[index]["icon"], fontFamily: 'MaterialIcons'),
              title: notifications[index]["title"],
              subtitle: notifications[index]["subtitle"],
              onDelete: () => _deleteNotification(index),
            ),
          ),
        ),
      ),
    );
  }
}
