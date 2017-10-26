class AddFieldsArticles < ActiveRecord::Migration[5.1]
  def change
    change_table :articles do |t|
      t.string     :status
      t.string    :portrait
      t.string    :postime
    end
    
  end
end
