class AddPhotoToCocktail < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :photo, :string, default: "https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80"
  end
end
