class AddNewGroupColumn < ActiveRecord::Migration
  def change
  	execute '
      ALTER TABLE "users"
      ADD COLUMN "user_group"
      TYPE integer'
  end
end