import 'package:{{project_name.snakeCase()}}/src/core/error/data_error.dart';
import 'package:{{project_name.snakeCase()}}/src/core/utils/either.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  {{#with_repository_stream}}abstract final Stream<Either<DataError, {{> entity_for_repo_response }}>> {{feature_name.camelCase()}}Stream;{{/with_repository_stream}}
  Future<Either<DataError, {{> entity_for_repo_response }}>> get{{feature_name.pascalCase()}}();
}
