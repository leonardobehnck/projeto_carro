#Biblioteca de terceiros são chamadas de germ
#gem install json
#gem install net/http

#bundler facilita o gerenciamento de 
#gem install bundler
#bundle install

require_relative 'lib\fabrica\carro'
require 'json'
require 'net/http'

novo_carro = Fabrica::Carro.new('Tesla', 'Model X')

novo_carro.acelera

uri = URI('http://jsonplaceholder.typicode.com/users')
response = Net::HTTP.get(uri)
usuarios = JSON.parse(response)
usuarios.each do |u|
  if u["name"].start_with?("Clementine")
    novo_carro.dono = u["name"]
    break
  end
end

puts "#{novo_carro.dono} é o dono do #{novo_carro.modelo}"

puts 'Finalizando programa...'