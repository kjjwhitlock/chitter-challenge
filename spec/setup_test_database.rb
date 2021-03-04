require 'pg'
require'./spec/spec_helper.rb'


def setup_test_database
p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')
connection.exec("TRUNCATE peeps;")
end
