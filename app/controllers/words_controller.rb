class WordsController < ApplicationController

  def index
    @words = Word.find_by spelling: params[:spelling]

    if @words
      render json: @words, status: 200, include: [:origins, :origin_ofs, :relations, :derivations, :derived_froms, :language]
    else
      render json: {message: 'no such word in my database. See contact info for how you can contribute to this project!'}, status: 404
    end
  end

  def show
    @word = Word.find(params[:id])

    render json: @word, status: 200, include: [:origins, :origin_ofs, :relations, :derivations, :derived_froms, :language]
  end

  private
  def word_params
    params.require(:word).permit(:spelling, :definition, :origins, :origin_ofs, :relations, :derivations, :derived_froms, :language)
  end
  
end
