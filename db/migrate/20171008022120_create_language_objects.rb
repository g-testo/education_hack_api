class CreateLanguageObjects < ActiveRecord::Migration[5.1]
  def change
    create_table :language_objects do |t|
      t.string :submitted_by
      t.string :image_url
      t.string :category
      t.string :community_group
      t.string :object_local_language
      t.string :object_local_name
      t.string :trust_rating

      t.timestamps
    end
  end
end
