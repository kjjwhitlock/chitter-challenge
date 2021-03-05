require_relative './database_connection'

class Comment

  attr_reader :id, :comment, :peep_id

  def initialize(id:, comment:, peep_id:)
    @id = id
    @comment = comment
    @peep_id = peep_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM comments;")
    result.map do |comment|
    Comment.new(id: comment['id'], comment: comment['comment'], peep_id: comment['peep_id'])
    end
  end

    def self.create(comment:, peep_id:)
      result = DatabaseConnection.query("INSERT INTO comments(comment, peep_id) VALUES('#{comment}', '#{peep_id}') RETURNING id, comment, peep_id;")
      Comment.new(
        id: result[0]['id'],
        comment: result[0]['comment'],
        peep_id: result[0]['peep_id']
      )
    end

    def self.find(id)
      result = DatabaseConnection.query("SELECT * FROM comments WHERE peep_id=#{id}")
      result.map do |comment|
      Comment.new(id: comment['id'], comment: comment['comment'], peep_id: comment['peep_id'])
    end
  end
  end
