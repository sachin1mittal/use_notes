class NotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @notes = current_user.notes
  end

  def create
    current_user.notes.create(notes_params)
    redirect_to notes_path
  end

  def update
    note.update_attributes(notes_params)
    redirect_to notes_path
  end

  def destroy
    note.destroy
    redirect_to notes_path
  end

  private

  def notes_params
    if params[:note][:tags].present?
      params[:note][:tags] = params[:note][:tags].split(',')
    end

    params.require(:note).permit(:title, :body, tags: [])
  end

  def note
    @note ||= current_user.notes.find(params[:id])
  rescue
    nil
  end

end
