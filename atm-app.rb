# ** ATM **
# dispense money - View/Controller
# respond to user choice - Controller
# display balance - View
# retrieve balance - Model
# prompt for user input - View
# respond to invalid pin - Controller

class Atm
end

class AtmModel
  def initialize
    @balance = 0
  end

  def get
    @balance
  end

  def dispense
    if @balance > 0
      @balance -= 1
      return Atm
    else
      return nil
    end
  end

  def deposit(count)
    @balance += count
  end
end


class AtmView
  def greeting
    puts "Welcome to the bank, what would you like to do today?"
  end
  def menu
    choice = 0
    while choice < 1 || choice > 4
      puts "----------------------------"
      puts "1. Display Balance"
      puts "2. Dispense Money"
      puts "3. Add Money"
      puts "4. Quit"
      puts "----------------------------"
      choice = gets.chomp.to_i
    end
    choice
  end

  def display(balance)
    puts "Your current balance is $#{balance}"
  end

  def accountEmpty
    puts "Sorry but you are trying to withdraw too much or there is no money in your account"
  end

  def getsMoney
    puts "Enjoy your money and have a great day"
  end

  def deposit(count)
    # output an appropriate message to the console.
    puts "Money deposited"
    # Make sure you tell the user how many gumballs there are now!
    puts "There is now $#{count} in your account"
  end

end


class AtmController
  def initialize
    @AtmModel = AtmModel.new
    @AtmView = AtmView.new
  end

  def run
    @AtmView.greeting
    choice = @AtmView.menu

    until choice == 4

      case choice
        when 1 #Display Balance
          balance = @AtmModel.get
          @AtmView.display(balance)

        when 2 # Dispense Money
          balance = @AtmModel.dispense
            if balance.nil?
              @AtmView.accountEmpty
            else
              @AtmView.getMoney
          end

        when 3 # Deposit Money
          addBalance = @AtmModel.deposit(50)
          @AtmView.deposit(addBalance)

      end
    choice = @AtmView.menu
    end
  end
end


atm = AtmController.new
atm.run
