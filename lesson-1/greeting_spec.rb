require 'rspec'
require './greeting.rb'

RSpec.describe "greeting methods" do
    it "puts underAged greeting" do
        age = 17
        expect(greeting).to eq("Привет #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программированию никогда не рано")
    end
    it "puts aged greeting" do
        age = 18
        expect(greeting).to eq("Привет #{name} #{surname}. Самое время заняться делом!")
    end
end