Rails.application.routes.draw do
  resources :bananagrams_players
  resources :bananagrams_scores
  resources :bananagrams_games
  resources :bananagrams_moves
end
