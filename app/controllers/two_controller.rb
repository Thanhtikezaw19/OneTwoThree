class TwoController < ApplicationController
  def index
    @two_numbers = TwoNumber.all
  end
end
