class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.string :portrait
      t.string :place
      t.string :role
      
      t.timestamps
    end
  end
end
