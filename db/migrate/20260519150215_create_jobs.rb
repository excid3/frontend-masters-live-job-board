class CreateJobs < ActiveRecord::Migration[8.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.integer :salary
      t.string :region
      t.string :apply_url
      t.string :apply_email

      t.timestamps
    end
  end
end
