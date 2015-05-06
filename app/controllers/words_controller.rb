class WordsController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Category.all
    if %w(learned_words not_learned_words).include? params[:filter]
      @words = Word.filter_category(params[:category_id])
        .send(params[:filter], current_user)
        .paginate page: params[:page], per_page: 10
    else
      @words = Word.filter_category(params[:category_id])
        .paginate page: params[:page], per_page: 10
    end
  end
end
