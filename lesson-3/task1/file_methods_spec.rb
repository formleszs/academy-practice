require "rspec"
require "./file_methods"

RSpec.describe "File methods" do
  let(:file) { 'students.txt' }
  let(:info) { "John\nRyan\nMatt\n" }

  before do
    File.write(file, info)
  end

  describe "#index" do
    it "outputs all students" do
      expect { index }.to output(info).to_stdout
    end
  end

  describe "#find" do
    it "outputs student at given index" do
      expect { find(0) }.to output("John\n").to_stdout
    end
    it "outputs nothing if index out of bounds" do
      expect { find(5) }.to output("").to_stdout
    end
  end

  describe "#where" do
    it "outputs index of student" do
      expect { where("John") }.to output("0\n").to_stdout
    end
    it "outputs nothing if student not in file" do
      expect { where("Ilya") }.to output("").to_stdout
    end
  end

  describe "#update" do
    it "updates student at given index" do
      update(1, "Bob")
      expect(File.read(file)).to eq("John\nBob\nMatt\n")
    end
    it "do nothing if index out of bounds" do
      update(10, "Ilya")
      expect(File.read(file)).to eq("John\nRyan\nMatt\n")
    end
  end

  describe "#delete" do
    it "deletes student at given index" do
      delete(0)
      expect(File.read(file)).to eq("Ryan\nMatt\n")
    end
    it "do nothing if index out of bounds" do
      delete(10)
      expect(File.read(file)).to eq("John\nRyan\nMatt\n")
    end
  end

  describe "#create" do
    it "adds new student" do
      create("Bob\n")
      expect(File.read(file)).to eq("John\nRyan\nMatt\nBob\n")
    end
  end
end
