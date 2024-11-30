// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Accessing the CounterNotifier through the counterProvider
    final counterNotifier = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current Count:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '${counterNotifier.count}',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: counterNotifier.decrement,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: counterNotifier.increment,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
