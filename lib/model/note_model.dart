import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String id;
  String title;
  String note;
  DateTime createDate;

  NoteModel({
    required this.id,
    required this.title,
    required this.note,
    required this.createDate,
  });

  /// Static function to create an empty NoteModel
  static NoteModel empty() => NoteModel(
        id: '',
        title: '',
        note: '',
        createDate: DateTime.now(),
      );

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Note': note,
      'CreateDate': Timestamp.fromDate(createDate),
    };
  }

  /// Factory method to create a NoteModel from a Firebase document snapshot
  factory NoteModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return NoteModel(
        id: document.id,
        title: data['Title'] ?? '',
        note: data['Note'] ?? '',
        createDate: (data['CreateDate'] as Timestamp).toDate(),
      );
    }
    return NoteModel.empty();
  }
}


