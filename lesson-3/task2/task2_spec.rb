require "rspec"
require "./task2"

RSpec.describe "Task2 methods" do
  let(:file) { "task2_file.txt" }
  let(:res_file) { "result.txt" }
  let(:info) { "John Johnes 21\nRyan Gosling 52\n" }

  before do
    File.write(file, info)
    File.write(res_file, "")
  end

  describe "#main" do
    it "processes input and outputs final result" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("21\n", "-1\n")
      expect { main }.to output(
        <<~OUTPUT
          type age (-1 to exit):
          type age (-1 to exit):
          John Johnes 21
        OUTPUT
      ).to_stdout
      expect(File.read(file)).to eq("Ryan Gosling 52\n")
      expect(File.read(res_file)).to eq("John Johnes 21\n")
    end
    it "stops processing when all students are moved" do
      File.write(file, info)
      File.write(res_file, "")
      allow_any_instance_of(Kernel).to receive(:gets).and_return("21\n", "52\n", "-1\n")
      expect { main }.to output(
        <<~OUTPUT
          type age (-1 to exit):
          type age (-1 to exit):
          All students was written in file
          John Johnes 21
          Ryan Gosling 52
        OUTPUT
      ).to_stdout

      expect(File.read(file)).to eq("")
      expect(File.read(res_file)).to eq("John Johnes 21\nRyan Gosling 52\n")
    end
  end

  describe "#index" do
    it "outputs the result file" do
      File.write(res_file, "Ryan Gosling 52\n")
      expect { index }.to output("Ryan Gosling 52\n").to_stdout
    end
  end

  describe "#search" do
    it "moves students with the given age to the result file" do
      search(52)
      expect(File.read(file)).to eq("John Johnes 21\n")
      expect(File.read(res_file)).to eq("Ryan Gosling 52\n")
    end

    it "does nothing if no one matches the given age" do
      search(99)
      expect(File.read(file)).to eq(info)
      expect(File.read(res_file)).to eq("")
    end
  end
end
