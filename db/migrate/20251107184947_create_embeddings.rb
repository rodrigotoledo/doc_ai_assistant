class CreateEmbeddings < ActiveRecord::Migration[8.0]
  def change
    # habilita a extensão no banco (se ainda não estiver)
    enable_extension "vector"

    create_table :embeddings do |t|
      t.references :document, null: false, foreign_key: true
      t.column :embedding, :vector, limit: 1536
      t.timestamps
    end
  end
end
