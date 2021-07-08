import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_repo/core/presentation/app_widget.dart';

void main() => runApp(ProviderScope(child: AppWidget()));

// TODO: Replace Flutter Secure Storage with MacOS implementation.
