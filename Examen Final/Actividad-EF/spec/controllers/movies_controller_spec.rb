# movies_controller_spec.rb
require 'rails_helper'

unless defined?(SomeConstantDefinedInSpec)
  SomeConstantDefinedInSpec = true

  describe MoviesController do
    describe 'searching TMDb' do
      it 'calls the model method that performs TMDb search' do
        expect(Movie).to receive(:search_tmdb).with('Inception', '2010', 'en')
        post :search_tmdb, title: 'Inception', release_year: '2010', language: 'en'
      end

      it 'selects the Search Results template for rendering' do
        post :search_tmdb
        expect(response).to render_template('search_tmdb')
      end

      it 'makes the TMDb search results available to that template' do
        results = [{ title: 'Inception', release_date: '2010-07-16', rating: 'PG-13' }]
        allow(Movie).to receive(:search_tmdb).and_return(results)
        post :search_tmdb
        expect(assigns(:tmdb_results)).to eq(results)
      end
    end
  end
end
