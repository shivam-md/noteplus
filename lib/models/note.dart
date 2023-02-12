final String TABLE_NOTES = 'notes'; // table name

// class used to store table with the below given fields.
class NoteFields{
  static final String id = "id";
  static final String isImportant = "isImportant";
  static final String number = "number";
  static final String title ="title";
  static final String description ="description";
  static final String time = "time";
}

// model class used to store data in respective fields.
class Note{
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime time;

  const Note({required this.id, required this.isImportant, required this.number, required this.title, required this.description, required this.time});

  Map<String,Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.description: description,
    NoteFields.isImportant: isImportant ? 1 : 0,
    NoteFields.number: number,
    NoteFields.time: time.toIso8601String(), // converts datetime object to string in format yyyy-MM-ddTHH:mm:mmmuuu // yyyy is possibly negative  four digit representation of year from range -9999 to 9999.
  };

}