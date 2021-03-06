# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.binary :data
      t.timestamps
    end
  end
end
