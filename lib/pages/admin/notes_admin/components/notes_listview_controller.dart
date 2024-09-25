import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/model/note_model.dart';

import '../../../../components/loading_widgets.dart';

class NotesListviewController extends GetxController {
  static NotesListviewController get instance => Get.find();

  /// List of notes
  var notesList = <NoteModel>[].obs;

  /// Loading state
  var isLoading = false.obs;

  /// Fetch notes from Firestore
  Future<void> fetchNotes() async {
    try {
      isLoading.value = true;
      final notesData = NoteData();
      List<NoteModel> notes = await notesData.fetchAllNotes();
      notesList.assignAll(notes);
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: 'Failed to fetch notes: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete a note from Firestore and update the notes list
  Future<void> deleteNote(String noteId) async {
    try {
      final notesData = NoteData();
      await notesData.deleteFromFirestore(noteId);
      notesList.removeWhere((note) => note.id == noteId);
      MyLoadingWidgets.successSnackBar(title: 'Success!', message: 'Note Deleted successfully.');
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: 'Failed to delete note: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchNotes(); // Fetch notes when the controller is initialized
  }
}
