require "rspec"
require "./cash_machine"

RSpec.describe "cash_machine methods" do
  let(:file) { "./balance.txt" }
  let(:cash) { 1500.0 }

  before do
    File.write(file, cash)
  end

  describe "#deposit" do
    it "Adds cash to balance" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("100\n")
      expect { deposit(cash) }.to output(
        <<~OUTPUT
          Enter your deposit (must be greater than 0)
          Success
          current balance: 1600.0$
        OUTPUT
      ).to_stdout
      expect(deposit(cash)).to eq(1600.0)
    end
    it "Doesn't add cash to balance" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("-1\n", "100\n")
      expect { deposit(cash) }.to output(
        <<~OUTPUT
          Enter your deposit (must be greater than 0)
          Deposit must be greater than 0. Try again
          Enter your deposit (must be greater than 0)
          Success
          current balance: 1600.0$
        OUTPUT
      ).to_stdout
    end
  end

  describe "#withdraw" do
    it "withdraws cash from balance" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("100\n")
      expect { withdraw(cash) }.to output(
        <<~OUTPUT
          Enter withdrawal amount (must be greater than 0 and less than or equal to 1500.0$)
          Success. Your current balance: 1400.0$
        OUTPUT
      ).to_stdout
      expect(withdraw(cash)).to eq(1400.0)
    end
    it "do not withdraw cash from balance(amount < 0)" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("-5\n", "100\n")
      expect { withdraw(cash) }.to output(
        <<~OUTPUT
          Enter withdrawal amount (must be greater than 0 and less than or equal to 1500.0$)
          Withdrawal amount must be greater than 0
          Enter withdrawal amount (must be greater than 0 and less than or equal to 1500.0$)
          Success. Your current balance: 1400.0$
        OUTPUT
      ).to_stdout
    end
    it "do not withdraw cash from balance(amount > balance)" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("10000\n", "100\n")
      expect { withdraw(cash) }.to output(
        <<~OUTPUT
          Enter withdrawal amount (must be greater than 0 and less than or equal to 1500.0$)
          Withdrawal amount cannot be greater than 1500.0$
          Enter withdrawal amount (must be greater than 0 and less than or equal to 1500.0$)
          Success. Your current balance: 1400.0$
        OUTPUT
      ).to_stdout
    end
  end

  describe "#display_balance" do
    it "outputs current balance" do
      expect { display_balance(cash) }.to output("current balance: 1500.0$\n").to_stdout
    end
  end

  describe "#quit" do
    it "finish program" do
      expect { quit(cash) }.to output("Program finished\n").to_stdout
      expect(File.read(file)).to eq("1500.0")
    end
  end

  describe "#main" do
    it "processes user input correctly" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("d\n", "200\n", "b\n", "q\n")
      expect { main }.to output(
        <<~OUTPUT
          What do you want to do?
          D - deposit
          W - withdraw
          B - balance
          Q - quit
          Enter your deposit (must be greater than 0)
          Success
          current balance: 1700.0$
          What do you want to do?
          D - deposit
          W - withdraw
          B - balance
          Q - quit
          current balance: 1700.0$
          What do you want to do?
          D - deposit
          W - withdraw
          B - balance
          Q - quit
          Program finished
        OUTPUT
      ).to_stdout
    end
    it "doesn't processes if input isn't correct" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("x\n", "q\n")
      expect { main }.to output(
        <<~OUTPUT
          What do you want to do?
          D - deposit
          W - withdraw
          B - balance
          Q - quit
          Invalid choice. Select D, W, B or Q
          What do you want to do?
          D - deposit
          W - withdraw
          B - balance
          Q - quit
          Program finished
        OUTPUT
      ).to_stdout
    end
  end
end
