$(function() {
  $('.delete-button').on('click', function() {
    var noteId = $(this).data('note-id');
    $('#delete form').attr('action', `/notes/${noteId}`);
  });

  $('.edit-button').on('click', function() {
    var noteId = $(this).data('note-id'),
        noteTitle = $(this).data('note-title'),
        noteBody = $(this).data('note-body'),
        noteTags = $(this).data('note-tags');
    $('#edit form').attr('action', `/notes/${noteId}`);
    $('#edit form #note-title').val(noteTitle);
    $('#edit form #note-body').val(noteBody);
    $('#edit form #note-tags').tagsinput('add', noteTags);
    $('#edit form #note-tags').tagsinput();
  });
});
