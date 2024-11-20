import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

class AiChat extends StatefulWidget {
  const AiChat({super.key});

  @override
  State<AiChat> createState() => _AiChatState();
}

class _AiChatState extends State<AiChat> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "data:image/webp;base64,UklGRvYBAABXRUJQVlA4IOoBAAAwCQCdASocABwAPtE+tFooIigoFAEAGglsAJ0zY7aPwCTAOlQJ+Z9KbN39IewH+X/XG9Eb9QA7e3lq700LwkTf6tPlz9rj2xFkBKAK0WkM43EAAP7nH24YD4MowFGs+za0fpeD7S0ineEDNhz6RmzXvo4PM8QzHrYHR9D2Tq55piUOXAJHoHGx4s5435jsc8/Q21UuDq3bE0gYYP9dkuf5wES3Tzss8enXh3f/O9Uog/4af1NfT2hc/OpQdVr2DwmOs6M5xIm0O1dnpmCme4DtkMB4sEOYjpyw0MPeHrei85w4Ri8n+UFf7gO8+4td6k1/QU3g+5JAonp78c/TpTfzKKLDQp/2krv0me1tLq/5Y1Zu93tvZ1JuWaHf8sZfQ28jUXjfL+ALHQ8QKVWGuSB5Of/hyO7hdfVU1uqKum+gCiP/VDfdWm2Tf3c94SiaYFZnV7TtHSsMBfGJRI6r/3vXm03Uf+Y2GdhdYvje3fcuBnjehf7r/wiPeunCGBDIF9yH4WeE8mSGqnx7KCd/DGXlidDHoIdLaD4w83QR5fV130huibeCxRI1YVpS+76QvmPi7s85yix0ul9P4SCqnXEhErZbdgs5GWnuYqhrbgES/TtB26fSpQSlQWefA2+/+V0BxoEmRD/i4AAA",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "AI farm Asisitant",
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      inputOptions: InputOptions(trailing: [
        IconButton(
          onPressed: _sendMediaMessage,
          icon: const Icon(
            Icons.image,
          ),
        )
      ]),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessage(chatMessage);
    }
  }
}
