// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:incognito__chat/Bulkmessage.dart';
import 'package:incognito__chat/singlemessage.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController controller = TextEditingController();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("INCOGNITO CHAT"),
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text("SINGLE MESSAGE"),
                ),
                Tab(
                  child: Text("BULK MESSAGE"),
                ),
              ],
            ),
            leading: Container(
              padding: const EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/logo.png"),
              ),
            ),
            actions: const [
              Icon(Icons.light, color: Colors.white),
            ],
          ),
          body: TabBarView(
            children: [
              const Singlemessage(),
              BulkMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
