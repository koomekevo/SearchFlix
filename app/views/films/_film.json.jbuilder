json.extract! film, :id, :budget, :description, :external_ids, :length, :movie_type, :premiere_bluray, :premiere_digital, :premiere_dvd, :premiere_world, :rating, :rating_age_limits, :rating_mpaa, :remote_images, :slogan, :slug, :source, :source_lang, :title, :year, :created_at, :updated_at
json.url film_url(film, format: :json)
