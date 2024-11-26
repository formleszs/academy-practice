require 'rspec'
require './greeting'

RSpec.describe 'greeting methods' do
  it 'puts underAged greeting' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Bruce', 'Wayne', 17)
    expect(greeting).to eq("Привет #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программированию никогда не рано")
  end
  it 'puts aged greeting' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('John', 'Johnes', 18)
    expect(greeting).to eq("Привет #{name} #{surname}. Самое время заняться делом!")
  end
end
