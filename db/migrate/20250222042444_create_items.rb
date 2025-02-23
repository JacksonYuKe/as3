class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_url
      t.string :details

      t.timestamps
    end
  end
end
