import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WhatIsThisConfigRecord extends FirestoreRecord {
  WhatIsThisConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "api_key" field.
  String? _apiKey;
  String get apiKey => _apiKey ?? '';
  bool hasApiKey() => _apiKey != null;

  // "prompt_text" field.
  String? _promptText;
  String get promptText => _promptText ?? '';
  bool hasPromptText() => _promptText != null;

  void _initializeFields() {
    _apiKey = snapshotData['api_key'] as String?;
    _promptText = snapshotData['prompt_text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('what_is_this_config');

  static Stream<WhatIsThisConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WhatIsThisConfigRecord.fromSnapshot(s));

  static Future<WhatIsThisConfigRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WhatIsThisConfigRecord.fromSnapshot(s));

  static WhatIsThisConfigRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WhatIsThisConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WhatIsThisConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WhatIsThisConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WhatIsThisConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WhatIsThisConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWhatIsThisConfigRecordData({
  String? apiKey,
  String? promptText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'api_key': apiKey,
      'prompt_text': promptText,
    }.withoutNulls,
  );

  return firestoreData;
}

class WhatIsThisConfigRecordDocumentEquality
    implements Equality<WhatIsThisConfigRecord> {
  const WhatIsThisConfigRecordDocumentEquality();

  @override
  bool equals(WhatIsThisConfigRecord? e1, WhatIsThisConfigRecord? e2) {
    return e1?.apiKey == e2?.apiKey && e1?.promptText == e2?.promptText;
  }

  @override
  int hash(WhatIsThisConfigRecord? e) =>
      const ListEquality().hash([e?.apiKey, e?.promptText]);

  @override
  bool isValidKey(Object? o) => o is WhatIsThisConfigRecord;
}
