import 'package:flutter_riverpod/flutter_riverpod.dart';
{{#with_repository_stream}}import 'package:rxdart/rxdart.dart';{{/with_repository_stream}}
import 'package:{{project_name.snakeCase()}}/src/app/default_chopper_client.dart';
import 'package:{{project_name.snakeCase()}}/src/core/error/data_error.dart';
import 'package:{{project_name.snakeCase()}}/src/core/persistence/data_repository.dart';
import 'package:{{project_name.snakeCase()}}/src/core/persistence/error_bus.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/either.dart';
{{#with_cache}}
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/cache/{{feature_name.snakeCase()}}_cache.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/cache/{{feature_name.snakeCase()}}_cache_impl.dart';
{{/with_cache}}
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/mapping/{{feature_name.snakeCase()}}_dto_mapper.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/model/{{feature_name.snakeCase()}}_dto.dart';
{{#with_service}}
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/service/{{feature_name.snakeCase()}}_service.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/service/{{feature_name.snakeCase()}}_service_impl.dart';
{{/with_service}}
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/repository/{{feature_name.snakeCase()}}_repository.dart';


final {{feature_name.camelCase()}}RepositoryProvider = Provider<{{feature_name.pascalCase()}}Repository>(
  (ref) {
    return {{feature_name.pascalCase()}}RepositoryImpl(
      errorBus: ref.read(errorBusProvider),
      {{#with_service}}service: {{feature_name.pascalCase()}}ServiceImpl.create(
        client: ref.read(chopperClientProvider),
      ),{{/with_service}}
      {{#with_cache}}cache: ref.read({{feature_name.camelCase()}}CacheProvider),{{/with_cache}}
    );
  },
);

class {{feature_name.pascalCase()}}RepositoryImpl extends DataRepository implements {{feature_name.pascalCase()}}Repository {
  {{feature_name.pascalCase()}}RepositoryImpl({
    required super.errorBus,
    {{#with_service}}required this.service,{{/with_service}}
    {{#with_cache}}required this.cache,{{/with_cache}}
  });

  {{#with_service}}final {{feature_name.pascalCase()}}Service service;{{/with_service}}
  {{#with_cache}}final {{feature_name.pascalCase()}}Cache cache;{{/with_cache}}

  {{#with_repository_stream}}
  @override
  late final {{feature_name.camelCase()}}Stream = _{{feature_name.camelCase()}}Stream.stream;
  final _{{feature_name.camelCase()}}Stream =
      BehaviorSubject<Either<DataError, {{> entity_for_repo_response }}>>();
  {{/with_repository_stream}}

  @override
  Future<Either<DataError, {{> entity_for_repo_response }}>> get{{feature_name.pascalCase()}}() async {
    throw UnimplementedError();
  }

}

