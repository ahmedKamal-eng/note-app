
abstract class AddNotesState{}

class AddNotesInitial extends AddNotesState{}

class AddNoteLoading extends AddNotesState{}

class AddNoteSuccess extends AddNotesState{}

class AddNoteFailure extends AddNotesState{
  final String errorMessage;
  AddNoteFailure(this.errorMessage);
}