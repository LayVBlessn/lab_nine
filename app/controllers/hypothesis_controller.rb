class HypothesisController < ApplicationController

  def input
    render layout: false
  end

  def view
    number = params[:number]
    if number.count("a-zA-Zа-яА-Я") > 0
      @result = nil
    else
      @result = proccessor(number).map(&:to_s)
    end
    respond_to do |format|
      format.html
      format.json do
          render json: {type_result: @result.class.to_s, value_result: @result}

      end
    end
  end


  private

  def proccessor(number)
    result = Hash.new
    i = 1
    result[0] = number.to_i
    while number.to_s != number.to_s.reverse
      number = number.to_i + number.to_s.reverse.to_i
      result[i] = number
      i += 1
    end
    result
  end

end
