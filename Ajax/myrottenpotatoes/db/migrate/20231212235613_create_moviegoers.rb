# db/migrate/yyyymmddhhmmss_create_moviegoers.rb

class CreateMoviegoers < ActiveRecord::Migration[7.0]
  def change
    create_table :moviegoers do |t|
      t.string :name
      t.string :email
      # Agrega otros campos 

      t.timestamps
    end
  end
end

