import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_item.model/Chat_Model.dart';
import 'package:whatsapp/models/chat_item.model/Chat_helper.dart';
import 'package:whatsapp/screens/chat_screen.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        ChatItemModel chatItem = Chathelper.getChatItems(position);
        return Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreen(
                          image: chatItem.image, name: chatItem.name)));
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(chatItem.image),
              ),
              title: Text(chatItem.name),
              subtitle: Row(
                children: [
                  Icon(
                    position % 2 == 0 ? Icons.done_all : Icons.done_all,
                    color: position % 2 == 0 ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    chatItem.mostRecentMessage,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Divider(),
                ],
              ),
              trailing: Text(chatItem.messageDate,
                  style: TextStyle(color: Colors.grey)),
            ),
          ),
        );
      },
      itemCount: Chathelper.itemCount,
    );
  }
}
