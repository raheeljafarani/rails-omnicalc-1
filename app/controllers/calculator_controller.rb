class CalculatorController < ApplicationController

  def home
    render({ :template => "calculator_templates/square_results"})
  end

  def square
    render({ :template => "calculator_templates/square"})
  end
  
  def square_result
    @the_num = params.fetch("users_number").to_f
    @the_result = @the_num ** 2
  
    render({ :template => "calculator_templates/square_result"})
  end

  def square_root
    render({ :template => "calculator_templates/square_root"})
  end
  
  def square_root_result
    @the_num = params.fetch("users_number").to_f
    @the_result = Math.sqrt(@the_num)
  
    render({ :template => "calculator_templates/square_root_result"})
  end

  def payment
    render({ :template => "calculator_templates/payment"})
  end
  
  def payment_result
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f
  @principal_display = @principal.to_fs(:currency)
  @apr_display = @apr.to_fs(:percentage, {:precision => 4})

  monthly = @apr / 100.0 / 12
  loan_term = @years * 12

  @the_result = @principal * (monthly * (1 + monthly)** loan_term) / ((1 + monthly)**loan_term - 1)

  @the_result_display = @the_result.to_fs(:currency)
  
    render({ :template => "calculator_templates/payment_result"})
  end

  def random
    render({ :template => "calculator_templates/random"})
  end
  
  def random_result
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f

    @rand = rand(@min..@max )
  
    render({ :template => "calculator_templates/random_result"})
  end
  end 
  