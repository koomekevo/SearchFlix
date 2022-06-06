class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.jsonb :budget
      t.jsonb :description
      t.jsonb :external_ids
      t.string :length
      t.string :movie_type
      t.date :premiere_bluray
      t.date :premiere_digital
      t.date :premiere_dvd
      t.date :premiere_world
      t.jsonb :rating
      t.integer :rating_age_limits
      t.string :rating_mpaa
      t.jsonb :remote_images
      t.jsonb :slogan
      t.string :slug
      t.string :source
      t.string :source_lang
      t.jsonb :title
      t.integer :year

      t.timestamps
    end
  end
end
