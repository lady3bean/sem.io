class WordsController < ApplicationController

  def show
    @word = Word.find(params[:id])

    render json: @word, status: 200, include: [:origins, :origin_ofs, :relations, :derivations, :derived_froms, :language]
  end

  private
  def word_params
    word_params.require(:word).permit(:spelling, :definition)
  end
  
end
