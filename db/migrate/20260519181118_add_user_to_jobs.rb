class AddUserToJobs < ActiveRecord::Migration[8.1]
  def change
    add_reference :jobs, :user, null: true, foreign_key: true
  end
end
