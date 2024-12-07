import 'package:flutter/material.dart';
import 'package:friends_forever_flutter/src/serverpod_client.dart';
import 'package:friends_forever_flutter/src/widgets/profile_page_view.dart';
import 'package:friends_forever_flutter/src/widgets/sign_in_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeServerpodClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    // Make sure that we rebuild the page if signed in status changes.
    sessionManager.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          sessionManager.isSignedIn ? const AccountPage() : const SignInPage(),
    );
  }
}
