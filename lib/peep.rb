require_relative 'database_connection'

class Peep

  attr_reader :id, :text, :created_at

  def initialize(id:, text:, created_at:)
    @id = id
    @text = text
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter')
    else
      connection = PG.connect(dbname: 'chitter_test')
    end
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at desc;")
    result.map do |peep|
    Peep.new(id: peep['id'], text: peep['text'], created_at: peep['created_at'])
    end
  end

    def self.create(text:)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter')
      else
        connection = PG.connect(dbname: 'chitter_test')
      end
    result = DatabaseConnection.query("INSERT INTO peeps(text) VALUES('#{text}') RETURNING id, text, created_at;")
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text'],
      created_at: result[0]['created_at']
    )
    end

    def self.delete(id:)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter')
      else
        connection = PG.connect(dbname: 'chitter_test')
      end
        connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end
end
