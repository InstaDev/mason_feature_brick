{{#with_repository_stream}}
import 'dart:async';
import 'package:{{project_name.snakeCase()}}/src/core/error/data_error.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/either.dart';
{{/with_repository_stream}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/repository/{{feature_name.snakeCase()}}_repository_impl.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/repository/{{feature_name.snakeCase()}}_repository.dart';

final {{feature_name.pascalCase()}}NotifierProvider = StateNotifierProvider.autoDispose<{{feature_name.pascalCase()}}Notifier, {{feature_name.pascalCase()}}>(
  (ref) {
    return {{feature_name.pascalCase()}}Notifier(
      repository: ref.read({{feature_name.camelCase()}}RepositoryProvider),
    );
  },
);

class {{feature_name.pascalCase()}}Notifier extends StateNotifier<{{> entity_for_repo_response }}> {
  {{feature_name.pascalCase()}}Notifier({
    required {{feature_name.pascalCase()}}Repository repository,
  })  : _repository = repository,
        super(const {{feature_name.pascalCase()}}()) {
    {{#with_repository_stream}}
    _subscription = _repository.{{feature_name.camelCase()}}Stream.listen((event) {
      event.when(
        left: (e) => null,
        right: (data) {

        },
      );
    });
    {{/with_repository_stream}}
  }

  final {{feature_name.pascalCase()}}Repository _repository;

  {{#with_repository_stream}}
  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
  {{/with_repository_stream}}
}
