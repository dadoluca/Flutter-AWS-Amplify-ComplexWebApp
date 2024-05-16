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


/** This is an auto generated class representing the referenteCliente type in your schema. */
@immutable
class referenteCliente extends Model {
  static const classType = const _referenteClienteModelType();
  final String id;
  final String? _email;
  final Cliente? _cliente;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _referenteClienteClienteId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  referenteClienteModelIdentifier get modelIdentifier {
      return referenteClienteModelIdentifier(
        id: id
      );
  }
  
  String? get email {
    return _email;
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
  
  String? get referenteClienteClienteId {
    return _referenteClienteClienteId;
  }
  
  const referenteCliente._internal({required this.id, email, cliente, createdAt, updatedAt, referenteClienteClienteId}): _email = email, _cliente = cliente, _createdAt = createdAt, _updatedAt = updatedAt, _referenteClienteClienteId = referenteClienteClienteId;
  
  factory referenteCliente({String? id, String? email, Cliente? cliente, String? referenteClienteClienteId}) {
    return referenteCliente._internal(
      id: id == null ? UUID.getUUID() : id,
      email: email,
      cliente: cliente,
      referenteClienteClienteId: referenteClienteClienteId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is referenteCliente &&
      id == other.id &&
      _email == other._email &&
      _cliente == other._cliente &&
      _referenteClienteClienteId == other._referenteClienteClienteId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("referenteCliente {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("referenteClienteClienteId=" + "$_referenteClienteClienteId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  referenteCliente copyWith({String? email, Cliente? cliente, String? referenteClienteClienteId}) {
    return referenteCliente._internal(
      id: id,
      email: email ?? this.email,
      cliente: cliente ?? this.cliente,
      referenteClienteClienteId: referenteClienteClienteId ?? this.referenteClienteClienteId);
  }
  
  referenteCliente.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _email = json['email'],
      _cliente = json['cliente']?['serializedData'] != null
        ? Cliente.fromJson(new Map<String, dynamic>.from(json['cliente']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _referenteClienteClienteId = json['referenteClienteClienteId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'email': _email, 'cliente': _cliente?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'referenteClienteClienteId': _referenteClienteClienteId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'email': _email, 'cliente': _cliente, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'referenteClienteClienteId': _referenteClienteClienteId
  };

  static final QueryModelIdentifier<referenteClienteModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<referenteClienteModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField CLIENTE = QueryField(
    fieldName: "cliente",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Cliente'));
  static final QueryField REFERENTECLIENTECLIENTEID = QueryField(fieldName: "referenteClienteClienteId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "referenteCliente";
    modelSchemaDefinition.pluralName = "referenteClientes";
    
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
      key: referenteCliente.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: referenteCliente.CLIENTE,
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
      key: referenteCliente.REFERENTECLIENTECLIENTEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _referenteClienteModelType extends ModelType<referenteCliente> {
  const _referenteClienteModelType();
  
  @override
  referenteCliente fromJson(Map<String, dynamic> jsonData) {
    return referenteCliente.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'referenteCliente';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [referenteCliente] in your schema.
 */
@immutable
class referenteClienteModelIdentifier implements ModelIdentifier<referenteCliente> {
  final String id;

  /** Create an instance of referenteClienteModelIdentifier using [id] the primary key. */
  const referenteClienteModelIdentifier({
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
  String toString() => 'referenteClienteModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is referenteClienteModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}