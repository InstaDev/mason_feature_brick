import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  context.logger.info('${context.vars['feature_name']} created at');
  context.logger.info('${Directory.current.path}');

  await Process.start(
    'flutter', // Or full path, for example 'C:\\flutter\\bin\\flutter.bat'
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
  ).then((process) => process.stdout.pipe(stdout));
}
