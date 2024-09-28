import 'package:cloud_firestore/cloud_firestore.dart';

import 'note_model.dart';

/// for firestore operations
class NoteData {
  final collection = FirebaseFirestore.instance.collection('Notes');

  /// Save a new note to Firestore
  Future<void> saveToFirestore(NoteModel note) async {
    try {
      await collection.add(note.toJson());
    } catch (e) {
      throw "Something Went Wrong. Please try again.";
    }
  }

  /// Update an existing note in Firestore
  Future<void> updateInFirestore(NoteModel note) async {
    try {
      await collection.doc(note.id).update(note.toJson());
    } catch (e) {
      throw "Something Went Wrong. Please try again.";
    }
  }

  /// Delete a note from Firestore
  Future<void> deleteFromFirestore(String noteId) async {
    try {
      await collection.doc(noteId).delete();
    } catch (e) {
      throw "Something Went Wrong. Please try again.";
    }
  }

  /// Fetch all notes from Firestore
  Future<List<NoteModel>> fetchAllNotes() async {
    try {
      final snapshot = await collection.orderBy('CreateDate', descending: true).get();
      return snapshot.docs.map((doc) => NoteModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw "Something Went Wrong. Please try again.";
    }
  }

  /// Fetch a note by ID from Firestore
  Future<NoteModel> fetchNoteById(String noteId) async {
    try {
      final document = await collection.doc(noteId).get();
      return NoteModel.fromSnapshot(document);
    } catch (e) {
      throw "Something Went Wrong. Please try again.";
    }
  }
}