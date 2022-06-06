require 'test_helper'

class FilmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @film = films(:one)
  end

  test 'should get index' do
    get films_url
    assert_response :success
  end

  test 'should get new' do
    get new_film_url
    assert_response :success
  end

  test 'should create film' do
    assert_difference('Film.count') do
      post films_url,
           params: { film: { budget: @film.budget, created_at: @film.created_at, description: @film.description,
                             external_ids: @film.external_ids, id: @film.id, length: @film.length, movie_type: @film.movie_type, premiere_bluray: @film.premiere_bluray, premiere_digital: @film.premiere_digital, premiere_dvd: @film.premiere_dvd, premiere_world: @film.premiere_world, rating: @film.rating, rating_age_limits: @film.rating_age_limits, rating_mpaa: @film.rating_mpaa, remote_images: @film.remote_images, slogan: @film.slogan, slug: @film.slug, source: @film.source, source_lang: @film.source_lang, title: @film.title, updated_at: @film.updated_at, year: @film.year } }
    end

    assert_redirected_to film_url(Film.last)
  end

  test 'should show film' do
    get film_url(@film)
    assert_response :success
  end

  test 'should get edit' do
    get edit_film_url(@film)
    assert_response :success
  end

  test 'should update film' do
    patch film_url(@film),
          params: { film: { budget: @film.budget, created_at: @film.created_at, description: @film.description,
                            external_ids: @film.external_ids, id: @film.id, length: @film.length, movie_type: @film.movie_type, premiere_bluray: @film.premiere_bluray, premiere_digital: @film.premiere_digital, premiere_dvd: @film.premiere_dvd, premiere_world: @film.premiere_world, rating: @film.rating, rating_age_limits: @film.rating_age_limits, rating_mpaa: @film.rating_mpaa, remote_images: @film.remote_images, slogan: @film.slogan, slug: @film.slug, source: @film.source, source_lang: @film.source_lang, title: @film.title, updated_at: @film.updated_at, year: @film.year } }
    assert_redirected_to film_url(@film)
  end

  test 'should destroy film' do
    assert_difference('Film.count', -1) do
      delete film_url(@film)
    end

    assert_redirected_to films_url
  end
end
