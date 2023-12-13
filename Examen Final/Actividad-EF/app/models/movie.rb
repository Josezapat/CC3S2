class Movie < ActiveRecord::Base
  def self.all_ratings
    ['G', 'PG', 'PG-13', 'R']
  end

  def self.with_ratings(ratings, sort_by)
    if ratings.nil?
      all.order(sort_by)
    else
      where(rating: ratings.map(&:upcase)).order(sort_by)
    end
  end

  def self.search_tmdb(title, release_year, language)
    results = Tmdb::Movie.find(title)
    results.map do |result|
      {
        title: result.title,
        release_date: result.release_date,
        rating: 'PG' # Asume un valor predeterminado
      }
    end
  end

  # Método agregado para la prueba en el controlador
  def self.find_in_tmdb(search_terms)
    # Implementación real aquí
    # Por ahora, simplemente devolvemos un array vacío
    []
  end
end
