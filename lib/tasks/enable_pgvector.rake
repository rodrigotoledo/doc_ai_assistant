namespace :db do
  desc "Enable pgvector extension"
  task enable_vector: :environment do
    ActiveRecord::Base.connection.execute("CREATE EXTENSION IF NOT EXISTS vector;")
    puts "pgvector extension enabled successfully!"
  end
end