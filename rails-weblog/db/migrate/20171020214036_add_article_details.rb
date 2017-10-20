class AddArticleDetails < ActiveRecord::Migration[5.1]
  def change
    
    change_table :articles do |t|
      t.references :user, foreign_key: true
      t.string     :tags
    end
  end
end
