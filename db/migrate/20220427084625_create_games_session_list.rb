class CreateGamesSessionList < ActiveRecord::Migration[6.0]
  def change
    create_table :games_session_list do |t|
      t.boolean :subscribe, default: false
      t.references :user, null: false, foreign_key: true
      t.references :game_session, foreign_key: true

      t.timestamps
    end
  end
end
