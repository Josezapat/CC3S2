Preparación 

En el directorio de nivel superior de la tarea, ejecuta bundle para asegurarse de tener las gemas necesarias. 

Información de contexto 

![image](https://github.com/Josezapat/CC3S2/assets/90808325/505476f0-e040-4ee0-8dbd-ac74bcc6bb6d)

Ejecuta el archivo de prueba una vez con bundle exec rspec spec/activerecord_practice_spec.rb. 
(Recuerda que bundle exec es necesario para garantizar que las versiones correctas de las gemas requeridas 
se carguen y activen correctamente antes de ejecutar el código). El resultado debe ser 13 ejemplos, 0 fallas, 13 pendientes. 

Lo Ejecutamos correctamente: 

![image](https://github.com/Josezapat/CC3S2/assets/90808325/3c95a192-5544-4a1d-adbb-811bef3d470e)

![image](https://github.com/Josezapat/CC3S2/assets/90808325/99a792ff-e53f-444d-8544-1a557d64532e)

Además configuramos la clase Customer:

```ruby
 

require 'sqlite3' 

require 'active_record' 

require 'byebug' 

 
 

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'customers.sqlite3') 

 
 

ActiveRecord::Base.logger = Logger.new(STDOUT) 

 
 

class Customer < ActiveRecord::Base 

  def to_s 

    "  [#{id}] #{first} #{last}, <#{email}>, #{birthdate.strftime('%Y-%m-%d')}" 

  end 

 
 

  def self.any_candice 

    where(first: 'Candice') 

  end 

 
 

  def self.with_valid_email 

    where("email LIKE '%@%'") 

  end 

 
 

  def self.with_dot_org_email 

    where("email LIKE '%.org'") 

  end 

 
 

  def self.with_invalid_email 

    where("email NOT LIKE '%@%' AND email != '' AND email IS NOT NULL") 

  end 

 
 

  def self.with_blank_email 

    where("email = '' OR email IS NULL") 

  end 

 
 

  def self.born_before_1980 

    where("birthdate < ?", Date.new(1980, 1, 1)) 

  end 

 
 

  def self.with_valid_email_and_born_before_1980 

    where("email LIKE '%@%' AND birthdate < ?", Date.new(1980, 1, 1)) 

  end 

 
 

  def self.last_names_starting_with_b 

    where("last LIKE 'B%'").order(:birthdate) 

  end 

 
 

  def self.twenty_youngest 

    order(birthdate: :asc).limit(20) 

  end 

 
 

  def self.update_gussie_murray_birthdate 

    gussie = find_by(first: 'Gussie', last: 'Murray') 

    gussie.update(birthdate: Time.parse('2004-02-08')) 

  end 

 
 

  def self.change_all_invalid_emails_to_blank 

    where("email != '' AND email IS NOT NULL AND email NOT LIKE '%@%'").update_all(email: '') 

  end 

 
 

  def self.delete_meggie_herman 

    where(first: 'Meggie', last: 'Herman').destroy_all 

  end 

 
 

  def self.delete_everyone_born_before_1978 

    where("birthdate < ?", Date.new(1978, 1, 1)).destroy_all 

  end 

end

```

Ejecuto el comando bundle exec rspec spec/activerecord_practica_spec.rb 

Esto se utiliza para ejecutar las pruebas automatizadas escritas utilizando el framework de pruebas RSpec 

![image](https://github.com/Josezapat/CC3S2/assets/90808325/96e2a547-dece-45f6-add2-cdff4f8724a4)
