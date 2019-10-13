class Cart < ApplicationRecord
  has_many :cart_items
  has_many :games, :through => :cart_items

  def add(game_id)
    items = cart_items.where(game_id: game_id)
    game = Game.find game_id
    if items.size < 1
      ci = cart_items.create :game_id => game_id, :amount => 1, :price => game.price
    else
      ci = items.first
      ci.update_attribute :amount, ci.amount + 1
    end
    ci
  end

  def remove(game_id)
    ci = cart_items.where(game_id: game_id).first
    if ci.amount > 1
      ci.update_attribute :amount, ci.amount - 1
    else
      CartItem.destroy ci.id
    end
    ci
  end

  def total
    sum = 0
    cart_items.each do |item| sum += item.price * item.amount end
    sum
  end
end
