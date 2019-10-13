class Developer < ApplicationRecord
    has_many :games
    validates_presence_of :name, :message => '(Nombre) no puede dejarse en blanco'
    validates_uniqueness_of :name, :message => '(Nombre) no aceptado'
    validates_length_of :name, :in => 2..255, :message => '(Nombre) es muy corto, debe contener al menos dos letras'
end
