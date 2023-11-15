# frozen_string_literal: true

require_relative 'pikachu'

pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)
puts pika.name
pika.attack
pika.change_name('不適切')
pika.change_name('テキセツ')
puts pika.name
