import 'package:{{project_name.snakeCase()}}/src/core/utils/data_mapper.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/data/model/{{feature_name.snakeCase()}}_dto.dart';
import 'package:{{project_name.snakeCase()}}/src/features/{{feature_name.snakeCase()}}/domain/entity/{{feature_name.snakeCase()}}.dart';

class {{feature_name.pascalCase()}}DTOMapper implements DataMapper<{{feature_name.pascalCase()}}DTO, {{feature_name.pascalCase()}}> {
  const {{feature_name.pascalCase()}}DTOMapper();

  @override
  {{feature_name.pascalCase()}} map({{feature_name.pascalCase()}}DTO data) => {{feature_name.pascalCase()}}();
}
