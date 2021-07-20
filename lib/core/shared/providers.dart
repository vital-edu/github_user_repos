import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/github/core/infrastructure/sembast_database.dart';

final sembastDatabaseProvider = Provider((_) => SembastDatabase());
