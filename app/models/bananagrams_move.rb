class BananagramsMove < ActiveRecord::Base
  belongs_to :bananagrams_game, class_name: 'BananagramsGame'
  belongs_to :bananagrams_player, class_name: 'BananagramsPlayer'

  def notify_other_player
    gcm = GCM.new(ENV['GCM_API_KEY'])
    players = self.bananagrams_game.players
    players = players.select do |player|
      if player.id != self.bananagrams_player.id
        player
      end
    end
    reg_ids = players.map(&:registration_id)
    options = {data: {type: 'GameMove',
                      bananagrams_game_id: self.bananagrams_game.id,
                      poc: self.bananagrams_game.poc}}
    response = gcm.send(reg_ids, options)
    puts response
  end
end
