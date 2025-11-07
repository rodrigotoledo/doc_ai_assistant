require "pg"
require "pgvector"

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.connection_pool.with_connection do |conn|
    registry = PG::BasicTypeRegistry.new.define_default_types
    Pgvector::PG.register_vector(registry)
    conn.type_map_for_results = PG::BasicTypeMapForResults.new(conn, registry: registry)
  end
end
