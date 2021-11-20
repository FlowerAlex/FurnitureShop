import 'package:cqrs/cqrs.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:login_client/login_client.dart';
import 'package:login_client_flutter/login_client_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginClient = LoginClient(
      oAuthSettings: OAuthSettings(
        authorizationUri: Uri.parse('https://api.mindy.test.lncd.pl')
            .resolve('/auth/connect/token'),
        clientId: 'client_app',
        scopes: [
          'offline_access',
          'internal_api',
        ],
      ),
      credentialsStorage: const FlutterSecureCredentialsStorage(),
    );
    final cqrs = CQRS(
      loginClient,
      Uri.parse('https://api.mindy.test.lncd.pl').resolve('/api/'),
    );

    cqrs.run(ExampleCommand(arg: 'arg'));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
