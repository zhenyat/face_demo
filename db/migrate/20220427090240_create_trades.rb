class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.references :pair,    null: false, foreign_key: true
      t.integer    :kind,    null: false,   default: 0, limit: 1
      t.decimal    :rate,    precision: 15, scale: 5
      t.decimal    :amount,  precision: 15, scale: 8
      t.integer    :tid
      t.timestamp  :timestamp

      t.timestamps
    end
  end
end
