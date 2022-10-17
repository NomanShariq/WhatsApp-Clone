import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_item.model/Chat_Model.dart';
import 'package:whatsapp/models/chat_item.model/Chat_helper.dart';
import 'package:whatsapp/models/message_item_model/message_helper.dart';
import 'package:whatsapp/models/message_item_model/message_model.dart';
import 'package:whatsapp/screens/chat_list.dart';
import 'package:whatsapp/widgets/app_icon.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  final String image;
  const ChatScreen({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(232, 32, 44, 51),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Online",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: AppIcon(
              backgroundcolor: Colors.transparent,
              bordercolor: Colors.transparent,
              iconColour: Colors.white,
              iconsize: 26,
              icon: Icons.video_call,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: AppIcon(
                backgroundcolor: Colors.transparent,
                bordercolor: Colors.transparent,
                iconColour: Colors.white,
                iconsize: 26,
                icon: Icons.call),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: AppIcon(
                backgroundcolor: Colors.transparent,
                bordercolor: Colors.transparent,
                iconColour: Colors.white,
                iconsize: 26,
                icon: Icons.more_vert_outlined),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: MessageHelper.itemCount,
                  itemBuilder: (context, index) {
                    MessageItemModel chatItem =
                        MessageHelper.getCHatList(index);
                    return Column(
                      crossAxisAlignment: index % 2 == 0
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        MessageBubble(
                          index: index,
                          message: chatItem.mostRecentMessage,
                          isSeen: false,
                          isMe: false,
                          time: chatItem.messageDate,
                          onPress: () {},
                          listLength: MessageHelper.itemCount,
                          type: chatItem.type,
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromARGB(232, 32, 44, 51)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff9C9EB9)),
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 0.0),
                                    hintText: 'Message...',
                                    hintStyle: TextStyle(
                                      color: Color(0xff8E8E93),
                                    ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              AppIcon(
                                icon: Icons.attach_file,
                                backgroundcolor: Colors.transparent,
                                iconColour: Colors.grey,
                                bordercolor: Colors.transparent,
                                iconsize: 24,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              AppIcon(
                                icon: Icons.camera_alt,
                                backgroundcolor: Colors.transparent,
                                iconColour: Colors.grey,
                                bordercolor: Colors.transparent,
                                iconsize: 23,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: AppIcon(
                      bordercolor: Color.fromARGB(255, 75, 180, 129),
                      backgroundcolor: Color.fromARGB(255, 75, 180, 129),
                      icon: Icons.mic,
                      iconsize: 24,
                      iconColour: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.isMe,
    required this.message,
    required this.time,
    required this.onPress,
    required this.index,
    required this.listLength,
    required this.isSeen,
    required this.type,
  });

  final bool isMe;
  final String message, type;
  final String time;
  final VoidCallback onPress;
  int index;
  int listLength;
  bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment:
            index % 2 == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2,
          ),

          if (type == "msj")
            Align(
              alignment:
                  index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
              child: InkWell(
                onTap: onPress,
                child: Material(
                  elevation: 1,
                  color: index % 2 == 0
                      ? Colors.teal
                      : Colors.black.withOpacity(0.5),
                  borderRadius: index % 2 == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text(
                      message,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          if (type == "image")
            Align(
              alignment:
                  index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
              child: InkWell(
                onTap: onPress,
                child: Material(
                  elevation: 1,
                  borderRadius: index % 2 == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0)),
                  color: index % 2 == 0
                      ? Colors.teal
                      : Colors.black.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image(
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width * .5,
                        fit: BoxFit.cover,
                        image: NetworkImage(message)),
                  ),
                ),
              ),
            ),

          SizedBox(
            height: 2,
          ),
          Text(
            time.toString(),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),

          SizedBox(
            height: 4,
          ),
          // Text(time.toString())
        ],
      ),
    );
  }
}
