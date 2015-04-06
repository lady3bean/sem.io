class WordsController < ApplicationController

  def index
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
  end

  private
  def word_params
    word_params.require(:word).permit(:spelling, :definition)
  end
  
end
