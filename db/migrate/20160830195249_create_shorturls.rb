class CreateShorturls < ActiveRecord::Migration[5.0]
  def change
    create_table :shorturls do |t|
      t.integer :url_full_id
      t.string :url_string
      t.integer :url_num_accesses
      t.string :url_ip_access

      t.timestamps
    end
  end
end
