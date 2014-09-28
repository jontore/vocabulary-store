class CreateVocabs < ActiveRecord::Migration
  def change
    create_table :vocabs do |t|
      t.string :user_id
      t.string :reference_lang
      t.string :learning_lang

      t.timestamps
    end
  end
end
