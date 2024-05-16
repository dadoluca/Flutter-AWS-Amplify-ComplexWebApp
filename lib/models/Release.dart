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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Release type in your schema. */
@immutable
class Release extends Model {
  static const classType = const _ReleaseModelType();
  final String id;
  final String? _titolo;
  final TemporalDate? _data;
  final Cliente? _cliente;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _releaseClienteId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ReleaseModelIdentifier get modelIdentifier {
      return ReleaseModelIdentifier(
        id: id
      );
  }
  
  String? get titolo {
    return _titolo;
  }
  
  TemporalDate? get data {
    return _data;
  }
  
  Cliente? get cliente {
    return _cliente;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get releaseClienteId {
    return _releaseClienteId;
  }
  
  const Release._internal({required this.id, titolo, data, cliente, createdAt, updatedAt, releaseClienteId}): _titolo = titolo, _data = data, _cliente = cliente, _createdAt = createdAt, _updatedAt = updatedAt, _releaseClienteId = releaseClienteId;
  
  factory Release({String? id, String? titolo, TemporalDate? data, Cliente? cliente, String? releaseClienteId}) {
    return Release._internal(
      id: id == null ? UUID.getUUID() : id,
      titolo: titolo,
      data: data,
      cliente: cliente,
      releaseClienteId: releaseClienteId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Release &&
      id == other.id &&
      _titolo == other._titolo &&
      _data == other._data &&
      _cliente == other._cliente &&
      _releaseClienteId == other._releaseClienteId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Release {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("titolo=" + "$_titolo" + ", ");
    buffer.write("data=" + (_data != null ? _data!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("releaseClienteId=" + "$_releaseClienteId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Release copyWith({String? titolo, TemporalDate? data, Cliente? cliente, String? releaseClienteId}) {
    return Release._internal(
      id: id,
      titolo: titolo ?? this.titolo,
      data: data ?? this.data,
      cliente: cliente ?? this.cliente,
      releaseClienteId: releaseClienteId ?? this.releaseClienteId);
  }
  
  Release.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _titolo = json['titolo'],
      _data = json['data'] != null ? TemporalDate.fromString(json['data']) : null,
      _cliente = json['cliente']?['serializedData'] != null
        ? Cliente.fromJson(new Map<String, dynamic>.from(json['cliente']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _releaseClienteId = json['releaseClienteId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'titolo': _titolo, 'data': _data?.format(), 'cliente': _cliente?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'releaseClienteId': _releaseClienteId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'titolo': _titolo, 'data': _data, 'cliente': _cliente, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'releaseClienteId': _releaseClienteId
  };

  static final QueryModelIdentifier<ReleaseModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ReleaseModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITOLO = QueryField(fieldName: "titolo");
  static final QueryField DATA = QueryField(fieldName: "data");
  static final QueryField CLIENTE = QueryField(
    fieldName: "cliente",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Cliente'));
  static final QueryField RELEASECLIENTEID = QueryField(fieldName: "releaseClienteId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Release";
    modelSchemaDefinition.pluralName = "Releases";
    
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
      key: Release.TITOLO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Release.DATA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Release.CLIENTE,
      isRequired: false,
      ofModelName: 'Cliente',
      associatedKey: Cliente.ID
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Release.RELEASECLIENTEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ReleaseModelType extends ModelType<Release> {
  const _ReleaseModelType();
  
  @override
  Release fromJson(Map<String, dynamic> jsonData) {
    return Release.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Release';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Release] in your schema.
 */
@immutable
class ReleaseModelIdentifier implements ModelIdentifier<Release> {
  final String id;

  /** Create an instance of ReleaseModelIdentifier using [id] the primary key. */
  const ReleaseModelIdentifier({
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
  String toString() => 'ReleaseModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ReleaseModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}