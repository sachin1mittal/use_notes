class SessionsController < ApplicationController

  def new
  end

  def auth
    url = authenticator.authorize_url redirect_uri: dropbox_auth_callback_url

    redirect_to url
  end

  def create
    auth_bearer = authenticator.get_token(params[:code], redirect_uri: dropbox_auth_callback_url)
    token = auth_bearer.token
    user = User.find_or_create_by_oauth(token)
    session[:user_id] = user.id

    redirect_to notes_path
  end

  private

  def authenticator
    @authenticator ||= DropboxApi::Authenticator.new(CONFIG[:dropbox_client_id], CONFIG[:dropbox_client_secret])
  end
end
