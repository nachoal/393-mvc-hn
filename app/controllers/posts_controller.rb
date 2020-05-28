class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts

    # Get all posts instances from DB
    posts = Post.all
    # Send instances to view and print them as list
    @view.display_all(posts)
  end

  def create
    # TODO: implement creating a new post

    # 1. Ask for post title
    title = @view.ask_for_title
    # 2. Ask for post url
    url = @view.ask_for_url
    # 3. Create the instance of post Post.new
    post = Post.new(title: title, url: url)
    # 4. Save into DB post.save
    post.save
  end

  def update
    # TODO: implement updating an existing post

    # 1. Display the list of all the posts
    index
    # 2. Ask the user the id of the post to delete
    id = @view.ask_for_post_id
    # 3. Ask the user for the new title
    title = @view.ask_for_title
    # 4. Ask the user for the new url
    url = @view.ask_for_url
    # 5. Find the post in db and return it in a variable
    post = Post.find(id)
    # 6. Update the post

    # Unless is needed to check if the string coming from the user was updated
    # If the user left the ask_for_x in blank then we dont update the value
    unless title == ''
      post.title = title
    end

    unless url == ''
      post.url = url
    end
    # 7. And save again with new values
    post.save
  end

  def destroy
    # TODO: implement destroying a post

    # 1. Display the list of posts
    index
    # 2. Ask user for the id of the post to delete
    id = @view.ask_for_post_id

    # Get the post using Post.find 
    post = Post.find(id)

    # 3. Delete the post
    post.destroy
  end

  def upvote
    # TODO: implement upvoting a post

    # Actualizar el voto de un post sumandole 1

    # 1. Listar posts
    index
    # 2. Preguntar Id de post a upvotear
    id = @view.ask_for_post_id    
    # 3. upvotear el post

    # 3.1 Get the post using Post.find 
    post = Post.find(id)

    # Create the instance method upvote whose sole responsibility is to update the instance variable @votes + 1
    post.upvote

    # Update the post in the database with the new votes count
    post.save
  end
end
