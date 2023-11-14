import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteme_project/models/note.dart';
import 'package:noteme_project/screens/new_note_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2,
        title: Text(
          'NoteMe App',
          style: GoogleFonts.raleway(fontWeight: FontWeight.w600),
        ),
      ),
      body: notes.isEmpty
          ? Center(
              child: Text(
              'No notes here!',
              style: GoogleFonts.lato(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      notes[index].title,
                      style: GoogleFonts.lato(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      notes[index].description,
                      style: GoogleFonts.lato(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(builder: (context) => const NewNoteScreen()),
          )
              .then((newNote) {
            if (newNote != null) {
              setState(() {
                notes.add(newNote);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
