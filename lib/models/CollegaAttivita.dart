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


/** This is an auto generated class representing the CollegaAttivita type in your schema. */
@immutable
class CollegaAttivita extends Model {
  static const classType = const _CollegaAttivitaModelType();
  final String id;
  final Collega? _collega;
  final Attivita? _attivita;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CollegaAttivitaModelIdentifier get modelIdentifier {
      return CollegaAttivitaModelIdentifier(
        id: id
      );
  }
  
  Collega get collega {
    try {
      return _collega!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Attivita get attivita {
    try {
      return _attivita!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CollegaAttivita._internal({required this.id, required collega, required attivita, createdAt, updatedAt}): _collega = collega, _attivita = attivita, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CollegaAttivita({String? id, required Collega collega, required Attivita attivita}) {
    return CollegaAttivita._internal(
      id: id == null ? UUID.getUUID() : id,
      collega: collega,
      attivita: attivita);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollegaAttivita &&
      id == other.id &&
      _collega == other._collega &&
      _attivita == other._attivita;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CollegaAttivita {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("collega=" + (_collega != null ? _collega!.toString() : "null") + ", ");
    buffer.write("attivita=" + (_attivita != null ? _attivita!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CollegaAttivita copyWith({Collega? collega, Attivita? attivita}) {
    return CollegaAttivita._internal(
      id: id,
      collega: collega ?? this.collega,
      attivita: attivita ?? this.attivita);
  }
  
  CollegaAttivita.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _collega = json['collega']?['serializedData'] != null
        ? Collega.fromJson(new Map<String, dynamic>.from(json['collega']['serializedData']))
        : null,
      _attivita = json['attivita']?['serializedData'] != null
        ? Attivita.fromJson(new Map<String, dynamic>.from(json['attivita']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'collega': _collega?.toJson(), 'attivita': _attivita?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'collega': _collega, 'attivita': _attivita, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<CollegaAttivitaModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<CollegaAttivitaModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField COLLEGA = QueryField(
    fieldName: "collega",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Collega'));
  static final QueryField ATTIVITA = QueryField(
    fieldName: "attivita",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Attivita'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CollegaAttivita";
    modelSchemaDefinition.pluralName = "CollegaAttivitas";
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["collegaId"], name: "byCollega"),
      ModelIndex(fields: const ["attivitaId"], name: "byAttivita")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: CollegaAttivita.COLLEGA,
      isRequired: true,
      targetNames: ['collegaId'],
      ofModelName: 'Collega'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: CollegaAttivita.ATTIVITA,
      isRequired: true,
      targetNames: ['attivitaId'],
      ofModelName: 'Attivita'
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

class _CollegaAttivitaModelType extends ModelType<CollegaAttivita> {
  const _CollegaAttivitaModelType();
  
  @override
  CollegaAttivita fromJson(Map<String, dynamic> jsonData) {
    return CollegaAttivita.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CollegaAttivita';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CollegaAttivita] in your schema.
 */
@immutable
class CollegaAttivitaModelIdentifier implements ModelIdentifier<CollegaAttivita> {
  final String id;

  /** Create an instance of CollegaAttivitaModelIdentifier using [id] the primary key. */
  const CollegaAttivitaModelIdentifier({
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
  String toString() => 'CollegaAttivitaModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CollegaAttivitaModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}