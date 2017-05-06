class Produto < ApplicationRecord
	validates :nome, :quantidade,:preco, presence: true
	validates :nome, length: { minimum:5 }
end
