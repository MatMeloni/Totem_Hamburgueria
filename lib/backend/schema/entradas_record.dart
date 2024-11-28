import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EntradasRecord extends FirestoreRecord {
  EntradasRecord._(
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
      FirebaseFirestore.instance.collection('Entradas');

  static Stream<EntradasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EntradasRecord.fromSnapshot(s));

  static Future<EntradasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EntradasRecord.fromSnapshot(s));

  static EntradasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EntradasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EntradasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EntradasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EntradasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EntradasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEntradasRecordData({
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

class EntradasRecordDocumentEquality implements Equality<EntradasRecord> {
  const EntradasRecordDocumentEquality();

  @override
  bool equals(EntradasRecord? e1, EntradasRecord? e2) {
    return e1?.valor == e2?.valor && e1?.img == e2?.img && e1?.nome == e2?.nome;
  }

  @override
  int hash(EntradasRecord? e) =>
      const ListEquality().hash([e?.valor, e?.img, e?.nome]);

  @override
  bool isValidKey(Object? o) => o is EntradasRecord;
}
