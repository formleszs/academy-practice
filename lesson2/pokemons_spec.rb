require 'rspec'
require './pokemons.rb'

RSpec.describe 'pokemons methods' do
  it 'initialize pokemons' do
    number = 2
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Pikachu','yellow','Charizard','red')
    expect(pokemons_init(number)).to eq([{'Pikachu'=> 'yellow'},{'Charizard'=>'red'}])
  end
end