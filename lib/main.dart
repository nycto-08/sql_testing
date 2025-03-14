import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _sendController = TextEditingController();
  String _receivedText = "";

  void _sendMessage() {
    setState(() {
      _receivedText = _sendController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sendController,
              decoration: const InputDecoration(
                labelText: 'Type a message',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _sendMessage,
              child: const Text('Send'),
            ),
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Received Message',
                border: const OutlineInputBorder(),
                hintText: _receivedText,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Receive'),
            ),
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Received Message',
                border: const OutlineInputBorder(),
                hintText: _receivedText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}