import 'package:flutter/material.dart';
import 'themes.dart';
import 'widgets/top_bar_component.dart';
import 'app/trophy_collection.dart';
import 'app/training_page.dart';
import 'app/horse_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
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
  @override
  Widget build(BuildContext context) {
    // Naming the tabs, which will be used in the TabBar and TabBarView
    final List<String> tabNames = ["Horse", "Training", "Collection"];

    return DefaultTabController(
      length: tabNames.length,
      child: Scaffold(
        appBar: TopBar(tabNames, showTitle: true),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // Horse-tab
                  HorsePage(),

                  // Training-tab
                  TrainingPage(),

                  // Collection-tab met scroll functionaliteit
                  TrophyCollection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
