import 'package:flutter/material.dart';
import 'package:whatsapp/models/status_item_model/status_helper.dart';
import 'package:whatsapp/models/status_item_model/status_model.dart';
import 'package:whatsapp/widgets/app_icon.dart';

class StatusList extends StatefulWidget {
  const StatusList({Key? key}) : super(key: key);

  @override
  State<StatusList> createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, top: 39),
                      child: AppIcon(
                        iconColour: Colors.white,
                        backgroundcolor: Color.fromARGB(255, 86, 196, 143),
                        size: 24,
                        icon: Icons.add,
                        bordercolor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Status",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Tap to add status update",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ])),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Viewed updates",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, position) {
                StatusItemModel statusitem =
                    StatusHelper.getStatusItem(position);
                return Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Colors.grey,
                            width: 3,
                          )),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(statusitem.image),
                      ),
                    ),
                    title: Text(statusitem.name),
                    subtitle: Text(statusitem.dateTime),
                  ),
                );
              },
              itemCount: StatusHelper.itemCount,
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (() {
      //   AppIcon(
      //     iconColour: Colors.white,
      //     backgroundcolor: Color.fromARGB(255, 86, 196, 143),
      //     size: 24,
      //     icon: Icons.add,
      //     bordercolor: Colors.black,
      //   );
      // })));
    );
  }
}
