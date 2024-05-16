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

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Collega type in your schema. */
@immutable
class Collega extends Model {
  static const classType = const _CollegaModelType();
  final String id;
  final String? _nome;
  final String? _cognome;
  final String? _email;
  final String? _username;
  final List<CollegaAttivita>? _attivita;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CollegaModelIdentifier get modelIdentifier {
      return CollegaModelIdentifier(
        id: id
      );
  }
  
  String? get nome {
    return _nome;
  }
  
  String? get cognome {
    return _cognome;
  }
  
  String? get email {
    return _email;
  }
  
  String? get username {
    return _username;
  }
  
  List<CollegaAttivita>? get attivita {
    return _attivita;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Collega._internal({required this.id, nome, cognome, email, username, attivita, createdAt, updatedAt}): _nome = nome, _cognome = cognome, _email = email, _username = username, _attivita = attivita, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Collega({String? id, String? nome, String? cognome, String? email, String? username, List<CollegaAttivita>? attivita}) {
    return Collega._internal(
      id: id == null ? UUID.getUUID() : id,
      nome: nome,
      cognome: cognome,
      email: email,
      username: username,
      attivita: attivita != null ? List<CollegaAttivita>.unmodifiable(attivita) : attivita);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Collega &&
      id == other.id &&
      _nome == other._nome &&
      _cognome == other._cognome &&
      _email == other._email &&
      _username == other._username &&
      DeepCollectionEquality().equals(_attivita, other._attivita);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Collega {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nome=" + "$_nome" + ", ");
    buffer.write("cognome=" + "$_cognome" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Collega copyWith({String? nome, String? cognome, String? email, String? username, List<CollegaAttivita>? attivita}) {
    return Collega._internal(
      id: id,
      nome: nome ?? this.nome,
      cognome: cognome ?? this.cognome,
      email: email ?? this.email,
      username: username ?? this.username,
      attivita: attivita ?? this.attivita);
  }
  
  Collega.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nome = json['nome'],
      _cognome = json['cognome'],
      _email = json['email'],
      _username = json['username'],
      _attivita = json['attivita'] is List
        ? (json['attivita'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => CollegaAttivita.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nome': _nome, 'cognome': _cognome, 'email': _email, 'username': _username, 'attivita': _attivita?.map((CollegaAttivita? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'nome': _nome, 'cognome': _cognome, 'email': _email, 'username': _username, 'attivita': _attivita, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<CollegaModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<CollegaModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NOME = QueryField(fieldName: "nome");
  static final QueryField COGNOME = QueryField(fieldName: "cognome");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField USERNAME = QueryField(fieldName: "username");
  static final QueryField ATTIVITA = QueryField(
    fieldName: "attivita",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'CollegaAttivita'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Collega";
    modelSchemaDefinition.pluralName = "Collegas";
    
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
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["email"], name: null)
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Collega.NOME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Collega.COGNOME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Collega.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Collega.USERNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Collega.ATTIVITA,
      isRequired: false,
      ofModelName: 'CollegaAttivita',
      associatedKey: CollegaAttivita.COLLEGA
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

class _CollegaModelType extends ModelType<Collega> {
  const _CollegaModelType();
  
  @override
  Collega fromJson(Map<String, dynamic> jsonData) {
    return Collega.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Collega';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Collega] in your schema.
 */
@immutable
class CollegaModelIdentifier implements ModelIdentifier<Collega> {
  final String id;

  /** Create an instance of CollegaModelIdentifier using [id] the primary key. */
  const CollegaModelIdentifier({
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
  String toString() => 'CollegaModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CollegaModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}