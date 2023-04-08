import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivrpd_crud/number_notifier.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final a = ref.watch(numberProvider);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref
                .read(numberProvider.notifier)
                .add('num${Random().nextInt(100)}');
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('RIVERPOD_CRUD'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: a
                  .map((e) => InkWell(
                        onLongPress: () {
                          ref.read(numberProvider.notifier).remove(e);
                          ref
                              .read(numberProvider.notifier)
                              .add('num${Random().nextInt(10)}');
                        },
                        onTap: () {
                          ref.read(numberProvider.notifier).remove(e);
                        },
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 30),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
