require 'application_system_test_case'

class FilmsTest < ApplicationSystemTestCase
  setup do
    @film = films(:one)
  end

  test 'visiting the index' do
    visit films_url
    assert_selector 'h1', text: 'Films'
  end

  test 'should create film' do
    visit films_url
    click_on 'New film'

    fill_in 'Budget', with: @film.budget
    fill_in 'Description', with: @film.description
    fill_in 'External ids', with: @film.external_ids
    fill_in 'Length', with: @film.length
    fill_in 'Movie type', with: @film.movie_type
    fill_in 'Premiere bluray', with: @film.premiere_bluray
    fill_in 'Premiere digital', with: @film.premiere_digital
    fill_in 'Premiere dvd', with: @film.premiere_dvd
    fill_in 'Premiere world', with: @film.premiere_world
    fill_in 'Rating', with: @film.rating
    fill_in 'Rating age limits', with: @film.rating_age_limits
    fill_in 'Rating mpaa', with: @film.rating_mpaa
    fill_in 'Remote images', with: @film.remote_images
    fill_in 'Slogan', with: @film.slogan
    fill_in 'Slug', with: @film.slug
    fill_in 'Source', with: @film.source
    fill_in 'Source lang', with: @film.source_lang
    fill_in 'Title', with: @film.title
    fill_in 'Year', with: @film.year
    click_on 'Create Film'

    assert_text 'Film was successfully created'
    click_on 'Back'
  end

  test 'should update Film' do
    visit film_url(@film)
    click_on 'Edit this film', match: :first

    fill_in 'Budget', with: @film.budget
    fill_in 'Description', with: @film.description
    fill_in 'External ids', with: @film.external_ids
    fill_in 'Length', with: @film.length
    fill_in 'Movie type', with: @film.movie_type
    fill_in 'Premiere bluray', with: @film.premiere_bluray
    fill_in 'Premiere digital', with: @film.premiere_digital
    fill_in 'Premiere dvd', with: @film.premiere_dvd
    fill_in 'Premiere world', with: @film.premiere_world
    fill_in 'Rating', with: @film.rating
    fill_in 'Rating age limits', with: @film.rating_age_limits
    fill_in 'Rating mpaa', with: @film.rating_mpaa
    fill_in 'Remote images', with: @film.remote_images
    fill_in 'Slogan', with: @film.slogan
    fill_in 'Slug', with: @film.slug
    fill_in 'Source', with: @film.source
    fill_in 'Source lang', with: @film.source_lang
    fill_in 'Title', with: @film.title
    fill_in 'Year', with: @film.year
    click_on 'Update Film'

    assert_text 'Film was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Film' do
    visit film_url(@film)
    click_on 'Destroy this film', match: :first

    assert_text 'Film was successfully destroyed'
  end
end
