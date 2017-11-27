class CommentsController < ApplicationController
  # GET /posts/:post_id/comments
  def index
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you get all the comments of this post
    @comments = post.comments

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /posts/:post_id/comments/:id
  def show
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /posts/:post_id/comments/new
  def new
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you build a new one
    @comment = post.comments.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /posts/:post_id/comments/:id/edit
  def edit
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])
  end

  # POST /posts/:post_id/comments
  def create
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you create the comment with arguments in params[:comment]
    @comment = post.comments.create(params[comment_params])

    respond_to do |format|
      if @comment.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /posts/:post_id/comments/:id
  def update
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /posts/:post_id/comments/1
  def destroy
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      #1st argument reference the path /posts/:post_id/comments/
      format.html { redirect_to(post_comments_url) }
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end 


end