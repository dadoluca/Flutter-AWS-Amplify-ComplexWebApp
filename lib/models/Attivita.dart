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


/** This is an auto generated class representing the Attivita type in your schema. */
@immutable
class Attivita extends Model {
  static const classType = const _AttivitaModelType();
  final String id;
  final String? _titolo;
  final int? _stima;
  final int? _stimaFunzionale;
  final double? _efficenza;
  final double? _consuntivato;
  final double? _etc;
  final String? _codFinanziamento;
  final Cliente? _clienteID;
  final referenteCliente? _referenteClienteID;
  final List<CollegaAttivita>? _Risorse;
  final Collega? _ReferenteInterno;
  final String? _stato;
  final String? _allocazioneCompilata;
  final int? _numCDT;
  final String? _note;
  final Release? _target;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _attivitaClienteIDId;
  final String? _attivitaReferenteClienteIDId;
  final String? _attivitaReferenteInternoId;
  final String? _attivitaTargetId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AttivitaModelIdentifier get modelIdentifier {
      return AttivitaModelIdentifier(
        id: id
      );
  }
  
  String? get titolo {
    return _titolo;
  }
  
  int? get stima {
    return _stima;
  }
  
  int? get stimaFunzionale {
    return _stimaFunzionale;
  }
  
  double? get efficenza {
    return _efficenza;
  }
  
  double? get consuntivato {
    return _consuntivato;
  }
  
  double? get etc {
    return _etc;
  }
  
  String? get codFinanziamento {
    return _codFinanziamento;
  }
  
  Cliente? get clienteID {
    return _clienteID;
  }
  
  referenteCliente? get referenteClienteID {
    return _referenteClienteID;
  }
  
  List<CollegaAttivita>? get Risorse {
    return _Risorse;
  }
  
  Collega? get ReferenteInterno {
    return _ReferenteInterno;
  }
  
  String? get stato {
    return _stato;
  }
  
  String? get allocazioneCompilata {
    return _allocazioneCompilata;
  }
  
  int? get numCDT {
    return _numCDT;
  }
  
  String? get note {
    return _note;
  }
  
  Release? get target {
    return _target;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get attivitaClienteIDId {
    return _attivitaClienteIDId;
  }
  
  String? get attivitaReferenteClienteIDId {
    return _attivitaReferenteClienteIDId;
  }
  
  String? get attivitaReferenteInternoId {
    return _attivitaReferenteInternoId;
  }
  
  String? get attivitaTargetId {
    return _attivitaTargetId;
  }
  
  const Attivita._internal({required this.id, titolo, stima, stimaFunzionale, efficenza, consuntivato, etc, codFinanziamento, clienteID, referenteClienteID, Risorse, ReferenteInterno, stato, allocazioneCompilata, numCDT, note, target, createdAt, updatedAt, attivitaClienteIDId, attivitaReferenteClienteIDId, attivitaReferenteInternoId, attivitaTargetId}): _titolo = titolo, _stima = stima, _stimaFunzionale = stimaFunzionale, _efficenza = efficenza, _consuntivato = consuntivato, _etc = etc, _codFinanziamento = codFinanziamento, _clienteID = clienteID, _referenteClienteID = referenteClienteID, _Risorse = Risorse, _ReferenteInterno = ReferenteInterno, _stato = stato, _allocazioneCompilata = allocazioneCompilata, _numCDT = numCDT, _note = note, _target = target, _createdAt = createdAt, _updatedAt = updatedAt, _attivitaClienteIDId = attivitaClienteIDId, _attivitaReferenteClienteIDId = attivitaReferenteClienteIDId, _attivitaReferenteInternoId = attivitaReferenteInternoId, _attivitaTargetId = attivitaTargetId;
  
  factory Attivita({String? id, String? titolo, int? stima, int? stimaFunzionale, double? efficenza, double? consuntivato, double? etc, String? codFinanziamento, Cliente? clienteID, referenteCliente? referenteClienteID, List<CollegaAttivita>? Risorse, Collega? ReferenteInterno, String? stato, String? allocazioneCompilata, int? numCDT, String? note, Release? target, String? attivitaClienteIDId, String? attivitaReferenteClienteIDId, String? attivitaReferenteInternoId, String? attivitaTargetId}) {
    return Attivita._internal(
      id: id == null ? UUID.getUUID() : id,
      titolo: titolo,
      stima: stima,
      stimaFunzionale: stimaFunzionale,
      efficenza: efficenza,
      consuntivato: consuntivato,
      etc: etc,
      codFinanziamento: codFinanziamento,
      clienteID: clienteID,
      referenteClienteID: referenteClienteID,
      Risorse: Risorse != null ? List<CollegaAttivita>.unmodifiable(Risorse) : Risorse,
      ReferenteInterno: ReferenteInterno,
      stato: stato,
      allocazioneCompilata: allocazioneCompilata,
      numCDT: numCDT,
      note: note,
      target: target,
      attivitaClienteIDId: attivitaClienteIDId,
      attivitaReferenteClienteIDId: attivitaReferenteClienteIDId,
      attivitaReferenteInternoId: attivitaReferenteInternoId,
      attivitaTargetId: attivitaTargetId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Attivita &&
      id == other.id &&
      _titolo == other._titolo &&
      _stima == other._stima &&
      _stimaFunzionale == other._stimaFunzionale &&
      _efficenza == other._efficenza &&
      _consuntivato == other._consuntivato &&
      _etc == other._etc &&
      _codFinanziamento == other._codFinanziamento &&
      _clienteID == other._clienteID &&
      _referenteClienteID == other._referenteClienteID &&
      DeepCollectionEquality().equals(_Risorse, other._Risorse) &&
      _ReferenteInterno == other._ReferenteInterno &&
      _stato == other._stato &&
      _allocazioneCompilata == other._allocazioneCompilata &&
      _numCDT == other._numCDT &&
      _note == other._note &&
      _target == other._target &&
      _attivitaClienteIDId == other._attivitaClienteIDId &&
      _attivitaReferenteClienteIDId == other._attivitaReferenteClienteIDId &&
      _attivitaReferenteInternoId == other._attivitaReferenteInternoId &&
      _attivitaTargetId == other._attivitaTargetId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Attivita {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("titolo=" + "$_titolo" + ", ");
    buffer.write("stima=" + (_stima != null ? _stima!.toString() : "null") + ", ");
    buffer.write("stimaFunzionale=" + (_stimaFunzionale != null ? _stimaFunzionale!.toString() : "null") + ", ");
    buffer.write("efficenza=" + (_efficenza != null ? _efficenza!.toString() : "null") + ", ");
    buffer.write("consuntivato=" + (_consuntivato != null ? _consuntivato!.toString() : "null") + ", ");
    buffer.write("etc=" + (_etc != null ? _etc!.toString() : "null") + ", ");
    buffer.write("codFinanziamento=" + "$_codFinanziamento" + ", ");
    buffer.write("stato=" + "$_stato" + ", ");
    buffer.write("allocazioneCompilata=" + "$_allocazioneCompilata" + ", ");
    buffer.write("numCDT=" + (_numCDT != null ? _numCDT!.toString() : "null") + ", ");
    buffer.write("note=" + "$_note" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("attivitaClienteIDId=" + "$_attivitaClienteIDId" + ", ");
    buffer.write("attivitaReferenteClienteIDId=" + "$_attivitaReferenteClienteIDId" + ", ");
    buffer.write("attivitaReferenteInternoId=" + "$_attivitaReferenteInternoId" + ", ");
    buffer.write("attivitaTargetId=" + "$_attivitaTargetId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Attivita copyWith({String? titolo, int? stima, int? stimaFunzionale, double? efficenza, double? consuntivato, double? etc, String? codFinanziamento, Cliente? clienteID, referenteCliente? referenteClienteID, List<CollegaAttivita>? Risorse, Collega? ReferenteInterno, String? stato, String? allocazioneCompilata, int? numCDT, String? note, Release? target, String? attivitaClienteIDId, String? attivitaReferenteClienteIDId, String? attivitaReferenteInternoId, String? attivitaTargetId}) {
    return Attivita._internal(
      id: id,
      titolo: titolo ?? this.titolo,
      stima: stima ?? this.stima,
      stimaFunzionale: stimaFunzionale ?? this.stimaFunzionale,
      efficenza: efficenza ?? this.efficenza,
      consuntivato: consuntivato ?? this.consuntivato,
      etc: etc ?? this.etc,
      codFinanziamento: codFinanziamento ?? this.codFinanziamento,
      clienteID: clienteID ?? this.clienteID,
      referenteClienteID: referenteClienteID ?? this.referenteClienteID,
      Risorse: Risorse ?? this.Risorse,
      ReferenteInterno: ReferenteInterno ?? this.ReferenteInterno,
      stato: stato ?? this.stato,
      allocazioneCompilata: allocazioneCompilata ?? this.allocazioneCompilata,
      numCDT: numCDT ?? this.numCDT,
      note: note ?? this.note,
      target: target ?? this.target,
      attivitaClienteIDId: attivitaClienteIDId ?? this.attivitaClienteIDId,
      attivitaReferenteClienteIDId: attivitaReferenteClienteIDId ?? this.attivitaReferenteClienteIDId,
      attivitaReferenteInternoId: attivitaReferenteInternoId ?? this.attivitaReferenteInternoId,
      attivitaTargetId: attivitaTargetId ?? this.attivitaTargetId);
  }

  Attivita.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _titolo = json['titolo'],
        _stima = (json['stima'] as num?)?.toInt(),
        _stimaFunzionale = (json['stimaFunzionale'] as num?)?.toInt(),
  //_efficenza = (json['efficenza'] as num?)?.toDouble(),
        _efficenza = (((json['stima']??0) - (json['etc']??0) - (json['consuntivato']??0))*100)/json['stima'] ,

        _consuntivato = (json['consuntivato'] as num?)?.toDouble(),
        _etc = (json['etc'] as num?)?.toDouble(),
        _codFinanziamento = json['codFinanziamento'],
        _clienteID = json['clienteID']!= null
            ? Cliente.fromJson(new Map<String, dynamic>.from(json['clienteID']))
            : null,
        _referenteClienteID = json['referenteClienteID'] != null
            ? referenteCliente.fromJson(new Map<String, dynamic>.from(json['referenteClienteID']))
            : null,
        _Risorse = json['Risorse'] is List
            ? (json['Risorse'] as List)
            .where((e) => e?['serializedData'] != null)
            .map((e) => CollegaAttivita.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
            .toList()
            : null,
        _ReferenteInterno = json['ReferenteInterno'] != null
            ? Collega.fromJson(new Map<String, dynamic>.from(json['ReferenteInterno']))
            : null,
        _stato = json['stato'],
        _allocazioneCompilata = json['allocazioneCompilata'],
        _numCDT = (json['numCDT'] as num?)?.toInt(),
        _note = json['note'],
        _target = json['target'] != null
            ? Release.fromJson(new Map<String, dynamic>.from(json['target']))
            : null,
        _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
        _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
        _attivitaClienteIDId = json['attivitaClienteIDId'],
        _attivitaReferenteClienteIDId = json['attivitaReferenteClienteIDId'],
        _attivitaReferenteInternoId = json['attivitaReferenteInternoId'],
        _attivitaTargetId = json['attivitaTargetId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'titolo': _titolo, 'stima': _stima, 'stimaFunzionale': _stimaFunzionale, 'efficenza': _efficenza, 'consuntivato': _consuntivato, 'etc': _etc, 'codFinanziamento': _codFinanziamento, 'clienteID': _clienteID?.toJson(), 'referenteClienteID': _referenteClienteID?.toJson(), 'Risorse': _Risorse?.map((CollegaAttivita? e) => e?.toJson()).toList(), 'ReferenteInterno': _ReferenteInterno?.toJson(), 'stato': _stato, 'allocazioneCompilata': _allocazioneCompilata, 'numCDT': _numCDT, 'note': _note, 'target': _target?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'attivitaClienteIDId': _attivitaClienteIDId, 'attivitaReferenteClienteIDId': _attivitaReferenteClienteIDId, 'attivitaReferenteInternoId': _attivitaReferenteInternoId, 'attivitaTargetId': _attivitaTargetId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'titolo': _titolo, 'stima': _stima, 'stimaFunzionale': _stimaFunzionale, 'efficenza': _efficenza, 'consuntivato': _consuntivato, 'etc': _etc, 'codFinanziamento': _codFinanziamento, 'clienteID': _clienteID, 'referenteClienteID': _referenteClienteID, 'Risorse': _Risorse, 'ReferenteInterno': _ReferenteInterno, 'stato': _stato, 'allocazioneCompilata': _allocazioneCompilata, 'numCDT': _numCDT, 'note': _note, 'target': _target, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'attivitaClienteIDId': _attivitaClienteIDId, 'attivitaReferenteClienteIDId': _attivitaReferenteClienteIDId, 'attivitaReferenteInternoId': _attivitaReferenteInternoId, 'attivitaTargetId': _attivitaTargetId
  };

  static final QueryModelIdentifier<AttivitaModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<AttivitaModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITOLO = QueryField(fieldName: "titolo");
  static final QueryField STIMA = QueryField(fieldName: "stima");
  static final QueryField STIMAFUNZIONALE = QueryField(fieldName: "stimaFunzionale");
  static final QueryField EFFICENZA = QueryField(fieldName: "efficenza");
  static final QueryField CONSUNTIVATO = QueryField(fieldName: "consuntivato");
  static final QueryField ETC = QueryField(fieldName: "etc");
  static final QueryField CODFINANZIAMENTO = QueryField(fieldName: "codFinanziamento");
  static final QueryField CLIENTEID = QueryField(
    fieldName: "clienteID",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Cliente'));
  static final QueryField REFERENTECLIENTEID = QueryField(
    fieldName: "referenteClienteID",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'referenteCliente'));
  static final QueryField RISORSE = QueryField(
    fieldName: "Risorse",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'CollegaAttivita'));
  static final QueryField REFERENTEINTERNO = QueryField(
    fieldName: "ReferenteInterno",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Collega'));
  static final QueryField STATO = QueryField(fieldName: "stato");
  static final QueryField ALLOCAZIONECOMPILATA = QueryField(fieldName: "allocazioneCompilata");
  static final QueryField NUMCDT = QueryField(fieldName: "numCDT");
  static final QueryField NOTE = QueryField(fieldName: "note");
  static final QueryField TARGET = QueryField(
    fieldName: "target",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Release'));
  static final QueryField ATTIVITACLIENTEIDID = QueryField(fieldName: "attivitaClienteIDId");
  static final QueryField ATTIVITAREFERENTECLIENTEIDID = QueryField(fieldName: "attivitaReferenteClienteIDId");
  static final QueryField ATTIVITAREFERENTEINTERNOID = QueryField(fieldName: "attivitaReferenteInternoId");
  static final QueryField ATTIVITATARGETID = QueryField(fieldName: "attivitaTargetId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Attivita";
    modelSchemaDefinition.pluralName = "Attivitas";
    
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
      key: Attivita.TITOLO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.STIMA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.STIMAFUNZIONALE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.EFFICENZA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.CONSUNTIVATO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.ETC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.CODFINANZIAMENTO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Attivita.CLIENTEID,
      isRequired: false,
      ofModelName: 'Cliente',
      associatedKey: Cliente.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Attivita.REFERENTECLIENTEID,
      isRequired: false,
      ofModelName: 'referenteCliente',
      associatedKey: referenteCliente.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Attivita.RISORSE,
      isRequired: false,
      ofModelName: 'CollegaAttivita',
      associatedKey: CollegaAttivita.ATTIVITA
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Attivita.REFERENTEINTERNO,
      isRequired: false,
      ofModelName: 'Collega',
      associatedKey: Collega.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.STATO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.ALLOCAZIONECOMPILATA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.NUMCDT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.NOTE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Attivita.TARGET,
      isRequired: false,
      ofModelName: 'Release',
      associatedKey: Release.ID
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
      key: Attivita.ATTIVITACLIENTEIDID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.ATTIVITAREFERENTECLIENTEIDID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.ATTIVITAREFERENTEINTERNOID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Attivita.ATTIVITATARGETID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _AttivitaModelType extends ModelType<Attivita> {
  const _AttivitaModelType();
  
  @override
  Attivita fromJson(Map<String, dynamic> jsonData) {
    return Attivita.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Attivita';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Attivita] in your schema.
 */
@immutable
class AttivitaModelIdentifier implements ModelIdentifier<Attivita> {
  final String id;

  /** Create an instance of AttivitaModelIdentifier using [id] the primary key. */
  const AttivitaModelIdentifier({
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
  String toString() => 'AttivitaModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AttivitaModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}