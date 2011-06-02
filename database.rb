
set :database, ENV['DATABASE_URL'] || 'sqlite://payplug-notifications.db'

migration "create notifications" do
  database.create_table :notifications do
    primary_key :id
    text        :params
    String      :gateway
    DateTime    :created_at
  end
end

class Notification < Sequel::Model
end
