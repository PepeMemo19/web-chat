import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {

  final client = StreamChatClient(
    'yapky4xuhyqg',
    logLevel: Level.INFO,
  );


  await client.connectUser(
    User(id: 'PepeMemo11'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiUGVwZU1lbW8xMSJ9.jHJo_NUqlRbtsHxXfxDF4zZaf-q25fsrzkwn1XwScwk',
  );



  final channel = client.channel('messaging', id: 'team');


  await channel.watch();

  runApp(
    MyApp(
      client: client,
      channel: channel,
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({
    Key? key,
    required this.client,
    required this.channel,
  }) : super(key: key);


  final StreamChatClient client;


  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return StreamChat(
          client: client,
          child: widget,
        );
      },
      home: StreamChannel(
        channel: channel,
        child: const ChannelPage(),
      ),
    );
  }
}


class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StreamChannelHeader(),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }
}
