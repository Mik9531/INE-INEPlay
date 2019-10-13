class Game < ApplicationRecord

  has_and_belongs_to_many :suppliers
  belongs_to :developer

  has_many :cart_items
  has_many :carts, :through => :cart_items

  has_attached_file :cover_image
  validates_attachment :cover_image,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  validates_length_of :name, :in => 1..255, :message => '(Nombre) es muy corto, debe contener al menos una letra'
  validates_presence_of :developer
  validates_presence_of :suppliers, :message => '(Proveedor) no seleccionado'
  validates_presence_of :developed_at
  validates_length_of :pegi, :in => 1..2, :message => ' debe contener al menos dos cifras'
  validates_numericality_of :price, :message => '(Precio) inexistente'
  
  def supplier_names
    self.suppliers.map{|supplier| supplier.name}.join(", ")
  end

  def self.latest(num)
    all.order("games.id desc").includes(:suppliers, :developer).limit(num)
  end
end
