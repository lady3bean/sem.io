class WordsController < ApplicationController

  def index
    @words = Word.all

    render json: @words, status: 200, include: ['word_roots']
  end

  def show
    @word = Word.find(params[:id])

    render json: @word, status: 200, include: ['word_roots']
  end

  private
  def word_params
    word_params.require(:word).permit(:spelling, :definition, :word_roots)
  end
  
end
