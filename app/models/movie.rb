class Movie < ActiveRecord::Base
    def self.all_ratings ; %w[G PG PG-13 R NC-17] ; end # shortcut: array of strings
  
    # Validaciones
    validates :title, :presence => true
    validates :release_date, :presence => true
    validate :released_1930_or_later # utiliza un validador personalizado a continuación
    validates :rating, :inclusion => {:in => Movie.all_ratings},
                        :unless => :grandfathered?
  
    # Método de validación personalizado
    def released_1930_or_later
      errors.add(:release_date, 'must be 1930 or later') if
        release_date && release_date < Date.parse('1 Jan 1930')
    end
  
    # Método para verificar si una película está exenta de validación por antigüedad
    @@grandfathered_date = Date.parse('1 Nov 1968')
    def grandfathered?
      release_date && release_date < @@grandfathered_date
    end
  end
  
