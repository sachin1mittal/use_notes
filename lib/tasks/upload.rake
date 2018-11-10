namespace :upload do
  desc 'Upload Notes on dropbox'
  task notes: :environment do
    notes = Note.where(:created_at.gt => Time.zone.now.beginning_of_day).includes(:user)

    users_notes = Hash.new { |hash, key| hash[key] = [] }
    notes.each do |note|
      users_notes[note.user].push(note)
    end

    users_notes.each do |user, notes|
      content = ''
      notes.each do |note|
        content += "Title: #{note.title}\n"
        content += "Body: #{note.body}\n"
        content += "Title: #{note.tags}\n\n"
      end

      dropbox_client = DropboxApi::Client.new(user.auth_token)
      dropbox_client.upload("/notes-#{Date.today}.txt", content)
    end
  end
end
