// lib/providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_notifier.dart';

// Provider for CounterNotifier using ChangeNotifierProvider
final counterProvider = ChangeNotifierProvider<CounterNotifier>((ref) => CounterNotifier());
