import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "qtd" field.
  int? _qtd;
  int get qtd => _qtd ?? 0;
  bool hasQtd() => _qtd != null;

  // "cartTotal" field.
  int? _cartTotal;
  int get cartTotal => _cartTotal ?? 0;
  bool hasCartTotal() => _cartTotal != null;

  void _initializeFields() {
    _img = snapshotData['img'] as String?;
    _valor = castToType<double>(snapshotData['valor']);
    _nome = snapshotData['nome'] as String?;
    _qtd = castToType<int>(snapshotData['qtd']);
    _cartTotal = castToType<int>(snapshotData['cartTotal']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  String? img,
  double? valor,
  String? nome,
  int? qtd,
  int? cartTotal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'img': img,
      'valor': valor,
      'nome': nome,
      'qtd': qtd,
      'cartTotal': cartTotal,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    return e1?.img == e2?.img &&
        e1?.valor == e2?.valor &&
        e1?.nome == e2?.nome &&
        e1?.qtd == e2?.qtd &&
        e1?.cartTotal == e2?.cartTotal;
  }

  @override
  int hash(CartRecord? e) => const ListEquality()
      .hash([e?.img, e?.valor, e?.nome, e?.qtd, e?.cartTotal]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}
