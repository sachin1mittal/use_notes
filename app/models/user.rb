class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :auth_token, type: String

  has_many :notes

  def self.find_or_create_by_oauth(token)
    account = dropbox_client(token).get_current_account
    user = find_by(email: account.email) rescue nil
    if !user.present?
      user = create(
        name: account.name.display_name,
        email: account.email,
        auth_token: token
      )
    end
    user
  end

  def self.dropbox_client(token)
    @dropbox_client ||= DropboxApi::Client.new(token)
  end
end
