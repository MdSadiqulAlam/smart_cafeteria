import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/admin/edit_note/edit_note.dart';
import 'notes_listview_controller.dart';

class NotesListview extends StatelessWidget {
  const NotesListview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesListviewController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.notesList.isEmpty) {
        return const Center(child: Text("No notes available."));
      }

      ListTileTitleAlignment? titleAlignment;
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: 17),
        itemCount: controller.notesList.length,
        itemBuilder: (context, index) {
          final note = controller.notesList[index];
          return Stack(
            children: [
              /// note
              Container(
                decoration: BoxDecoration(
                  color: getColorScheme(context).secondaryContainer,
                  border: Border.all(color: getColorScheme(context).onSurface),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: ListTile(
                  titleAlignment: titleAlignment,
                  title: Text(note.title),
                  titleTextStyle: getTextTheme(context).bodyLarge?.copyWith(fontSize: 19, fontWeight: FontWeight.w600),
                  subtitle: Text(note.note),
                  subtitleTextStyle: getTextTheme(context).bodyMedium?.copyWith(fontSize: 15),
                  onTap: () => Get.to(EditNote(note: note)),
                ),
              ),

              /// delete button
              Positioned(
                right: 3,
                top: 0,
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: IconButton(
                    icon: const Icon(Icons.delete, size: 22),
                    onPressed: () => _showDeleteConfirmationDialog(context, controller, note.id),
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }

  void _showDeleteConfirmationDialog(BuildContext context, NotesListviewController controller, String noteId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Note'),
          content: const Text('Are you sure you want to delete this note?'),
          actions: <Widget>[
            TextButton(child: const Text('Cancel'), onPressed: () => Get.back()),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                Get.back();
                await controller.deleteNote(noteId);
              },
            ),
          ],
        );
      },
    );
  }
}
