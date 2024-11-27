import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BebidasRecord extends FirestoreRecord {
  BebidasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  void _initializeFields() {
    _valor = castToType<double>(snapshotData['valor']);
    _img = snapshotData['img'] as String?;
    _nome = snapshotData['nome'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bebidas');

  static Stream<BebidasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BebidasRecord.fromSnapshot(s));

  static Future<BebidasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BebidasRecord.fromSnapshot(s));

  static BebidasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BebidasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BebidasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BebidasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BebidasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BebidasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBebidasRecordData({
  double? valor,
  String? img,
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'valor': valor,
      'img': img,
      'nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class BebidasRecordDocumentEquality implements Equality<BebidasRecord> {
  const BebidasRecordDocumentEquality();

  @override
  bool equals(BebidasRecord? e1, BebidasRecord? e2) {
    return e1?.valor == e2?.valor && e1?.img == e2?.img && e1?.nome == e2?.nome;
  }

  @override
  int hash(BebidasRecord? e) =>
      const ListEquality().hash([e?.valor, e?.img, e?.nome]);

  @override
  bool isValidKey(Object? o) => o is BebidasRecord;
}
