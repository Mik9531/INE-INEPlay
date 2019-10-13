class Supplier < ApplicationRecord
    has_and_belongs_to_many :games
    validates_presence_of :first_name, :message => '(Nombre) no puede dejarse en blanco'
    validates_presence_of :last_name, :message => '(Apellido) no puede dejarse en blanco'
    def name 
        "#{first_name} #{last_name}"
    end
end
