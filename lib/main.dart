// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'ETH Test',
      ),
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
  Future<void> _generateKeyPair() async {
    var random = Random.secure();
    EthPrivateKey pKey = EthPrivateKey.createRandom(random);

    String s = bytesToHex(pKey.privateKey);
    print(s);

    var address = await pKey.extractAddress();
    print(address.hex);

    Wallet wallet = Wallet.createNew(pKey, "", random);
    print(wallet.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          "Hello",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateKeyPair,
        child: const Icon(Icons.add),
      ),
    );
  }
}
