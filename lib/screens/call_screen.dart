import 'package:flutter/material.dart';
import 'package:whatsapp/models/call_item_model/call_helper.dart';
import 'package:whatsapp/models/call_item_model/call_model.dart';
import 'package:whatsapp/widgets/app_icon.dart';

class Callscreen extends StatelessWidget {
  const Callscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CallHelper.itemCount,
        itemBuilder: (context, position) {
          CallItemModel callItem = CallHelper.getCallItem(position);
          return Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(callItem.image),
              ),
              title: Text(callItem.name),
              subtitle: Row(
                children: [
                  Icon(
                    position % 2 == 0
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color: position % 2 == 0 ? Colors.green : Colors.red,
                  ),
                  Text(callItem.dateTime),
                  Divider(),
                ],
              ),
              trailing: AppIcon(
                icon: Icons.call,
                backgroundcolor: Colors.transparent,
                bordercolor: Colors.transparent,
                iconsize: 28,
              ),
            ),
          );
        });
  }
}
