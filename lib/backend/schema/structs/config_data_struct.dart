// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigDataStruct extends FFFirebaseStruct {
  ConfigDataStruct({
    String? apiKey,
    String? promptText,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _apiKey = apiKey,
        _promptText = promptText,
        super(firestoreUtilData);

  // "api_key" field.
  String? _apiKey;
  String get apiKey => _apiKey ?? '';
  set apiKey(String? val) => _apiKey = val;

  bool hasApiKey() => _apiKey != null;

  // "prompt_text" field.
  String? _promptText;
  String get promptText => _promptText ?? '';
  set promptText(String? val) => _promptText = val;

  bool hasPromptText() => _promptText != null;

  static ConfigDataStruct fromMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        apiKey: data['api_key'] as String?,
        promptText: data['prompt_text'] as String?,
      );

  static ConfigDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'api_key': _apiKey,
        'prompt_text': _promptText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'api_key': serializeParam(
          _apiKey,
          ParamType.String,
        ),
        'prompt_text': serializeParam(
          _promptText,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConfigDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        apiKey: deserializeParam(
          data['api_key'],
          ParamType.String,
          false,
        ),
        promptText: deserializeParam(
          data['prompt_text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConfigDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfigDataStruct &&
        apiKey == other.apiKey &&
        promptText == other.promptText;
  }

  @override
  int get hashCode => const ListEquality().hash([apiKey, promptText]);
}

ConfigDataStruct createConfigDataStruct({
  String? apiKey,
  String? promptText,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigDataStruct(
      apiKey: apiKey,
      promptText: promptText,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfigDataStruct? updateConfigDataStruct(
  ConfigDataStruct? configData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    configData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfigDataStructData(
  Map<String, dynamic> firestoreData,
  ConfigDataStruct? configData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (configData == null) {
    return;
  }
  if (configData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && configData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final configDataData = getConfigDataFirestoreData(configData, forFieldValue);
  final nestedData = configDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = configData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfigDataFirestoreData(
  ConfigDataStruct? configData, [
  bool forFieldValue = false,
]) {
  if (configData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(configData.toMap());

  // Add any Firestore field values
  configData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfigDataListFirestoreData(
  List<ConfigDataStruct>? configDatas,
) =>
    configDatas?.map((e) => getConfigDataFirestoreData(e, true)).toList() ?? [];
