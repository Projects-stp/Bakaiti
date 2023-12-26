import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/chat_user.dart';

class ChatScreen extends StatefulWidget {
  //**
  final ChatUser user;

  const ChatScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: messageScreenColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: _appBar(),
        ),
        //?? body ->
        body: Column(
          children: [
            _chatInput(),
          ],
        ),
      ),
    );
  }

  //?? custom app bar ->
  Widget _appBar() {
    //*** media query ->
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      splashColor: Colors.orange,
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: CachedNetworkImage(
              width: size.height * 0.055,
              height: size.height * 0.055,
              imageUrl: widget.user.image,
              errorWidget: (context, url, error) => const CircleAvatar(
                backgroundColor: appBarColor,
                child: Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                ),
              ),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15.0),

          //?? for user name ->
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user.name,
                style: const TextStyle(
                  fontFamily: 'poppins_bold',
                  fontSize: 16.0,
                  letterSpacing: 0.8,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4.0),

              //?? for last seen ->
              const Text(
                'last seen not available',
                style: TextStyle(
                  fontFamily: 'poppins_medium',
                  fontSize: 12.0,
                  letterSpacing: 0.8,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //?? bottom chat input field ->
  Widget _chatInput() {
    //*** media query ->
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * .01,
        horizontal: size.width * .025,
      ),
      child: Row(
        children: [
          //*** input field & buttons ->
          Expanded(
            child: Card(
              color: textFieldColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  //*** emoji button ->
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.emoji_emotions_sharp,
                      color: Colors.white70,
                      size: 25.0,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        fontFamily: 'poppins_medium',
                        fontSize: 15.0,
                        letterSpacing: 0.8,
                        color: Colors.white,
                      ),
                      // controller: _textController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onTap: () {},
                      decoration: const InputDecoration(
                        hintText: 'Likho Kuch...',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //*** pick image from gallery button ->
                  IconButton(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.image,
                      color: Colors.white70,
                      size: 26.0,
                    ),
                  ),
                  //*** take image from camera button ->
                  IconButton(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.camera_alt_sharp,
                      color: Colors.white70,
                      size: 26.0,
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                ],
              ),
            ),
          ),
          //*** send message button ->
          MaterialButton(
            onPressed: () {},
            minWidth: 0,
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              right: 5.0,
              left: 10.0,
            ),
            shape: const CircleBorder(),
            color: floatingActionButtonColor,
            child: const Icon(
              Icons.send_sharp,
              color: Colors.white,
              size: 28.0,
            ),
          )
        ],
      ),
    );
  }
}