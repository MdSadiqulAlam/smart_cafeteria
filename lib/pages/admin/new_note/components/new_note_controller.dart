import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/note_model.dart';
import 'package:smart_cafeteria/pages/admin/notes_admin/components/notes_listview_controller.dart';
import 'package:smart_cafeteria/model/note_data.dart';

class NewNoteController extends GetxController {
  static NewNoteController get instance => Get.find();

  @override
  void onClose() {
    super.onClose();
    NewNoteController.instance.dispose();
  }

  /// variables
  final title = TextEditingController();
  final noteBody = TextEditingController();

  /// global key
  GlobalKey<FormState> newNoteFormKey = GlobalKey<FormState>();

  Future<void> createNote(BuildContext context) async {
    try {
      MyLoadingWidgets.loadingDialogue();

      /// Form Validation
      if (!newNoteFormKey.currentState!.validate()) {
        Get.back();
        return;
      }

      /// Create a NoteModel instance
      NoteModel newNote = NoteModel(
        id: '', // Firebase will generate an ID automatically
        title: title.text.trim() == '' ? 'New Note' : title.text.trim(),
        note: noteBody.text.trim(),
        createDate: DateTime.now(),
      );

      /// Save the note in Firestore
      final noteData = NoteData();
      await noteData.saveToFirestore(newNote);

      /// Close loading dialogues and return to the previous screen
      NotesListviewController.instance.fetchNotes();
      Get.back(); // stop loading
      Get.back(); // go back to the all notes screen
      MyLoadingWidgets.successSnackBar(title: 'Success!', message: 'Note created successfully.');
    } catch (e) {
      Get.back();
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
