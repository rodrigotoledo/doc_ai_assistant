require "pg"
require "pgvector"

ActiveSupport.on_load(:active_record) do
  begin
    ActiveRecord::Base.connection_pool.with_connection do |conn|
      registry = PG::BasicTypeRegistry.new.define_default_types
      Pgvector::PG.register_vector(registry)
      conn.type_map_for_results = PG::BasicTypeMapForResults.new(conn, registry: registry)
    end
  rescue => e
    puts "Could not register pgvector type: #{e.message}"
  end
end
