class IdeasController < ApplicationController

  def home
    @ideas = Idea.where(thought:nil)
  end

  def new
  end

  def create
    idea = Idea.new(book:params[:book], content:params[:content], user_id:session[:user_id], thought:nil)
    puts idea.errors.full_messages unless idea.save
    redirect_to '/ideas'
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def like
    like = Like.find_by user_id:session[:user_id], idea_id:params[:id]
    Like.create(user_id:session[:user_id], idea_id:params[:id]) unless like
    redirect_to '/ideas'
  end

  def add
    idea = Idea.new(book:params[:book], content:params[:content], user_id:session[:user_id], thought:Idea.find(params[:id]))
    puts idea.errors.full_messages unless idea.save
    redirect_to '/ideas'
  end

end
