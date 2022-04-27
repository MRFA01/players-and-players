class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.string :name, :string
      t.references :game_session, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
