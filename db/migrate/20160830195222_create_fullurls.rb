class CreateFullurls < ActiveRecord::Migration[5.0]
  def change
    create_table :fullurls do |t|
      t.string :url_string

      t.timestamps
    end
  end
end
