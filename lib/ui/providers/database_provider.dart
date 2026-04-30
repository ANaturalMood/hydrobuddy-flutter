import 'package:riverpod/riverpod.dart';
import 'package:hydrobuddy/data/database.dart';

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());
