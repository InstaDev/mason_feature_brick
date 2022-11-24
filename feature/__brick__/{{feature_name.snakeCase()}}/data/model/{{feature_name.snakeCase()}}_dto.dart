{{#with_cache}}import 'package:hive/hive.dart';{{/with_cache}}
import 'package:json_annotation/json_annotation.dart';
part '{{feature_name.snakeCase()}}_dto.g.dart';

{{#with_cache}}@HiveType(typeId: {{hive_type_id}}){{/with_cache}}
@JsonSerializable(createToJson: false)
class {{feature_name.pascalCase()}}DTO {
  const {{feature_name.pascalCase()}}DTO();

  factory {{feature_name.pascalCase()}}DTO.fromJson(Map<String, dynamic> json) =>
      _${{feature_name.pascalCase()}}DTOFromJson(json);
}
