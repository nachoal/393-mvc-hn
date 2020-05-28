require 'pry-byebug'

class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def self.find(id)
    DB.results_as_hash = true

    results = DB.execute('SELECT * FROM posts WHERE id = ?', id)

    if results.empty?
      nil
    else
      post = results.first.transform_keys(&:to_sym)

      Post.new(post)
    end
  end

  # self in method name refers to the CLASS (Post)
  def self.all
    DB.results_as_hash = true

    DB.execute('SELECT * FROM posts').map do |post|
      
      Post.new(post.transform_keys(&:to_sym))
    end
  end

  def save
    if id
      DB.execute('UPDATE posts SET url = ?, votes = ?, title = ? WHERE id = ?', url, votes, title, id)
    else 
      DB.execute('INSERT INTO posts (url, votes, title) VALUES (?, ?, ?)', url, votes, title)

      id = DB.last_insert_row_id
    end
  end

  def destroy
    DB.execute('DELETE FROM posts WHERE id = ?', id)
  end

  def upvote
    binding.pry
    
    # self inside the instance method refers to the INSTANCE
    self.votes += 1
  end
end
