# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :short_url_id

      t.timestamps
    end
    add_index :links, :short_url_id, unique: true
  end
end
