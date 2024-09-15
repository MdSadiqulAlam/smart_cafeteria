import 'package:flutter/material.dart';
import 'package:smart_cafeteria/pages/admin/notes_admin/components/notes_listview.dart';

class NotesAdmin extends StatelessWidget {
  const NotesAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      physics: BouncingScrollPhysics(),
      child: NotesListview(),
    );
  }
}
