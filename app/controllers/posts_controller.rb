class PostsController < ApplicationController

  # Templates definition: index new show
  def new
    @post = Post.new
  end

  def index

    @anyPost = Post
    @post = Post.all
    @firstpost = Post.first
    @descriptionPost = Post.order(:description).first
    @createat = Post.where(id: 1).take
    # @pluck = Post.where(id: '5').pluck(:description)
    @Descfromsqlconnection = Post.connection.select_all("SELECT DISTINCT description FROM posts WHERE posts.id = '6'")
    @color = if current_user
               'green'
             else
               'orange'
             end
         
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(permit_post)
      flash[:success] = 'Success, you have updated your post !'
      redirect_to edit_post_path
    else
      flash[:error] = @post.errors.full_messages
      redirect_to root_path
    end
  end

  def create
    @post = Post.new(permit_post)
    if @post.save
      flash[:success] = 'Success, you created a new post entry !'
      redirect_to edit_post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Success, you destroyed post !'
      redirect_to root_path
    else
      flash[:error] = @post.errors.full_messages
      redirect_to root_path
    end
  end

  private

  def permit_post
    params.require(:post).permit(:image, :description)
  end

end
