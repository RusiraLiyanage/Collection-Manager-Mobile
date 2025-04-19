import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_code_blue/AppState/appState.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final ScrollController _scrollController = ScrollController();

  List<String> notifications =
      List.generate(30, (index) => "My Jobs - Job Update");

  void _clearAll() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: true);
    appState.setNoNotifications(notifications.length);
    return Scaffold(
      backgroundColor: AppColors.appWideBackground,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        toolbarHeight: 82,
        backgroundColor: AppColors.primary.withOpacity(0.9),
        centerTitle: true,
        title: Image.asset(
            "assets/images/icons/collectionManagerNotifications.png"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _clearAll();
                        appState.setNoNotifications(0);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Clear All",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset(
                            "assets/images/icons/deleteNotification.png",
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: notifications.isEmpty
                    ? const Center(
                        child: Text(
                          "No notifications for the moment",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : RefreshIndicator(
                        color: Colors.blueAccent,
                        onRefresh: () async {
                          // Simulate a network request or data fetch
                          //await Future.delayed(const Duration(seconds: 2));
                          setState(() {
                            // Refresh or reload the notifications list
                          });
                        },
                        child: Scrollbar(
                          thumbVisibility: true,
                          interactive: true,
                          trackVisibility: true,
                          controller: _scrollController,
                          child: ListView.builder(
                            controller: _scrollController,
                            padding: EdgeInsets.only(
                              top: 0,
                              right: 0,
                              left: 0,
                              bottom: 100,
                            ),
                            itemCount: notifications.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key:
                                    UniqueKey(), // Ensures proper widget tree updates
                                onDismissed: (direction) {
                                  setState(() {
                                    notifications.removeAt(index);
                                    appState.setNoNotifications(
                                        notifications.length - 1);
                                  });
                                },
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: const Icon(Icons.delete,
                                      color: Colors.white),
                                ),
                                child: Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: ListTile(
                                    leading: Image.asset(
                                        "assets/images/icons/notificationTile.png",
                                        width: 40,
                                        height: 40),
                                    title: Text(
                                      notifications[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: const Text(
                                        "A job you have accepted has been updated. Go to My Jobs to accept changes."),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
