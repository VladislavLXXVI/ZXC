class CreateDevises < ActiveRecord::Migration[7.1]
  def change
    create_table :devises do |t|

      t.timestamps
    end
  end
end
