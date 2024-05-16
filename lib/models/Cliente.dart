/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Cliente type in your schema. */
@immutable
class Cliente extends Model {
  static const classType = const _ClienteModelType();
  final String id;
  final String? _nome;
  final String? _colore;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ClienteModelIdentifier get modelIdentifier {
      return ClienteModelIdentifier(
        id: id
      );
  }
  
  String? get nome {
    return _nome;
  }
  
  String? get colore {
    return _colore;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Cliente._internal({required this.id, nome, colore, createdAt, updatedAt}): _nome = nome, _colore = colore, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Cliente({String? id, String? nome, String? colore}) {
    return Cliente._internal(
      id: id == null ? UUID.getUUID() : id,
      nome: nome,
      colore: colore);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cliente &&
      id == other.id &&
      _nome == other._nome &&
      _colore == other._colore;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Cliente {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nome=" + "$_nome" + ", ");
    buffer.write("colore=" + "$_colore" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Cliente copyWith({String? nome, String? colore}) {
    return Cliente._internal(
      id: id,
      nome: nome ?? this.nome,
      colore: colore ?? this.colore);
  }
  
  Cliente.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nome = json['nome'],
      _colore = json['colore'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nome': _nome, 'colore': _colore, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'nome': _nome, 'colore': _colore, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<ClienteModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ClienteModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NOME = QueryField(fieldName: "nome");
  static final QueryField COLORE = QueryField(fieldName: "colore");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Cliente";
    modelSchemaDefinition.pluralName = "Clientes";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Cliente.NOME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Cliente.COLORE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ClienteModelType extends ModelType<Cliente> {
  const _ClienteModelType();
  
  @override
  Cliente fromJson(Map<String, dynamic> jsonData) {
    return Cliente.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Cliente';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Cliente] in your schema.
 */
@immutable
class ClienteModelIdentifier implements ModelIdentifier<Cliente> {
  final String id;

  /** Create an instance of ClienteModelIdentifier using [id] the primary key. */
  const ClienteModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ClienteModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ClienteModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}