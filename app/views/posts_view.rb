class PostsView
  def display_all(posts)
    posts.each do |post|
      puts "id: #{post.id}, Title: #{post.title}, Url: #{post.url}, votes: #{post.votes}"
    end
  end

  def ask_for_title
    # 1. puts de la pregunta
    puts "What's the post title (leave blank if you dont want to update)"
    # 2. get the user input (gets.chomp)
    gets.chomp
  end

  def ask_for_url
    # 1. puts de la pregunta
    puts "What's the post url (leave blank if you dont want to update)"
    # 2. get the user input (gets.chomp)
    gets.chomp
  end

  def ask_for_post_id
    puts 'Whats the id of the post?'
    gets.chomp.to_i
  end
end
