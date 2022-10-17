import 'package:flutter/material.dart';
import 'package:whatsapp/screens/call_screen.dart';
import 'package:whatsapp/screens/camera.dart';
import 'package:whatsapp/screens/chat_list.dart';
import 'package:whatsapp/screens/status_list.dart';
import 'package:whatsapp/widgets/app_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(232, 32, 44, 51),
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.grey,
            onPressed: () {},
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.more_vert_outlined,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        bottom: TabBar(
            isScrollable: true,
            indicatorColor: Color.fromARGB(255, 75, 180, 129),
            labelColor: Color.fromARGB(255, 75, 180, 129),
            unselectedLabelColor: Colors.grey,
            controller: tabController,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.grey,
                ),
              ),
              Tab(
                child: Container(
                    height: 40,
                    width: 90,
                    alignment: Alignment.center,
                    child: Text(
                      "Chats",
                    )),
              ),
              Tab(
                child: Container(
                  height: 40,
                  width: 90,
                  alignment: Alignment.center,
                  child: Text(
                    "Status",
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 90,
                alignment: Alignment.center,
                child: Text(
                  "Calls",
                ),
              ),
            ]),
      ),
      body: TabBarView(controller: tabController, children: [
        Camera(),
        ChatList(),
        StatusList(),
        Callscreen(),
      ]),
    );
  }
}
