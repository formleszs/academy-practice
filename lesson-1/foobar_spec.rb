require 'rspec'
require './foobar.rb'

RSpec.describe "foobar methods" do
    it "puts second munber" do
        num1 =20
        num2 = 5
        expect(foobar(num1,num2)).to eq(5)
        num1 = 7
        num2 = 20
        expect(foobar(num1,num2)).to eq(7)
    end
    it "puts sum of 2 numbers" do
        num1=7
        num2=-2
        expect(foobar(num1,num2)).to eq(5)
    end
end