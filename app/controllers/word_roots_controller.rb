class WordRootsController < ApplicationController
  def index
    @word_roots = WordRoot.all

    render json: @word_roots, status: 200
  end

  def show
    @word_root = WordRoot.find(params[:id])

    render json: @word_root, status: 200
  end

  private
  def word_root_params
    word_root_params.require(:word_root).permit(:word_id)
  end
end
