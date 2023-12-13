class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.text :description
      t.datetime :release_date
      # Cambiado para especificar `null: true` para las marcas de tiempo
      t.timestamps null: true
    end
  end

  def down
    drop_table :movies
  end
end
