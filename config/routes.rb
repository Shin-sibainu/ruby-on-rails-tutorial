Rails.application.routes.draw do
  #GET /tweets(tweets#index), GET /tweets/new(tweets#new), Post /tweets(tweets#create)
  #only..生成されるルートを制限するために使われる。（index, new, create, show, edit, update, destroy
  #:tweetsがある場合、自動でルーディングヘルパーを生成する。tweets_path, new_tweet_path, edit_tweets_path, tweet_path(tweet): 特定のツイートを表示するページ(/tweets/:id)へのパス
  resources :tweets, only: [:index, :new, :create, :edit, :update, :destroy]
end
