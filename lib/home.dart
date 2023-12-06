import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/notification_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Push Notification"),
      ),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              print("button  press");
              AwesomeNotifications().createNotification(
                content: NotificationContent(
                    id: 12,
                    channelKey: 'basic_channel',
                    title: "The message send by vegetable mart",
                    body: "Notification is working"),
              );
            },
            icon: const Icon(Icons.notifications_none_rounded),
            label: const Text("Show Notification")),
      ),
    );
  }
}
