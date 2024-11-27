require "rspec"
require "./word"

RSpec.describe "word methods" do
  it "gives 2 in the word length" do
    word = "somethingCs"
    expect(message(word)).to eq(2048)
  end

  it "gives word reversed" do
    word = "something"
    expect(message(word)).to eq("gnihtemos")
  end
end
