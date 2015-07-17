class AddNewGroupColumn < ActiveRecord::Migration
  def change
  	execute '
      ALTER TABLE "users"
      ADD COLUMN "group"
      TYPE int'
  end
end
