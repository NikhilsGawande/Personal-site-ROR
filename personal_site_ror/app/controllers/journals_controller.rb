class JournalsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]

  #index action to render all posts
  def index
    @posts = Journal.all
  end

  #new action for creating post

  def new
    @post = Journal.new
  end

  #create action saves the new post into database
  def create
    @post = Journal.new(post_params)

    if @post.save
      flash[:notice] = "Successfully created post"
      redirect_to journal_path(@post)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end

  end

  #edit action retrieves the post and renders the edit page

  def edit
  end

  #update action update the post with new info

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Succesfully updated post!"
      redirect_to journal_path(@post)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  #The show action renders the individual post after retrieving the id
  def show
  end

  def destroy
    @post = Journal.find(params[:id])
    if @post.destroy
      flash[:notice] = "succesfully deleted post!"
      redirect_to journals_path
    else
      flash[:alert] = "Error updating the post!"
    end
  end



  private
  def post_params
    params.require(:journal).permit(:title, :body)
  end

  def find_post
    @post = Journal.find(params[:id])
  end
end
