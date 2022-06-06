class Film < ApplicationRecord
  def search_data
    {
      budget: budget,
      description: description,
      external_ids: external_ids,
      length: length,
      movie_type: movie_type,
      premiere_bluray: premiere_bluray,
      premiere_digital: premiere_digital,
      premiere_dvd: premiere_dvd,
      premiere_world: premiere_world,
      rating: rating,
      rating_age_limits: rating_age_limits,
      rating_mpaa: rating_mpaa,
      remote_images: remote_images,
      slogan: slogan,
      slug: slug,
      source: source,
      source_lang: source_lang,
      title: title,
      year: year
    }
  end
end
