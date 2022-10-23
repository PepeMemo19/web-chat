// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {
  final client = StreamChatClient(
    'twhgvj3ype7w'
    logLevel: Level.INFO,
  );

  await client.connectUser(
    User(id: 'PepeMemo11'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiUGVwZU1lbW8xMSJ9.jHJo_NUqlRbtsHxXfxDF4zZaf-q25fsrzkwn1XwScwk',
  );

  final channel = client.channel('mensaging', id: 'team');

  channel.watch();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}