class TweetsController < ApplicationController
    # edit, update, destroyのアクションが実行されるまえに、set_tweetメソッドを実行する
    # before_action :authenticate_user!, except: [:index]
    before_action :set_tweet, only: [:edit, :update, :destroy]

    def index 
        # @tweets = Tweet.all
        @tweets = Tweet.order(created_at: :desc)
    end

    def new
        #新しいTweetオブジェクトをメモリ上に作成。まだDB上には保存されていない。
        @tweet = Tweet.new
    end
    def create
        @tweet = Tweet.new(tweet_params)
        # @tweet.user_id = User.first.id # here is where you're using User
      
        if @tweet.save
          redirect_to tweets_path
        else
          render :new
        end
      end

    def edit
    end

    def update
        if @tweet.update(tweet_params)
         redirect_to tweets_path
        else
            render :edit
        end
    end

    def destroy
        @tweet.destroy
        redirect_to tweet_path
    end

    #アクセス制御。そのクラス内部からのみアクセス可能なメソッド。
    #これを宣言した後に定義されたメソッドはは、そのクラス自体からのみ呼び出すことができる。
    #view等から直接、tweet_paramsを呼び出すことはできない。
    private

    #ストロングパラメータ
    def tweet_params
        #tweetキーの存在を必須とする。フォームから何か送信するとき、パラメータの中にtweetというキーがなければならない。
        #permit(:title, :content)...これらのパラメータのみを許可する。これ以外のパラメータは無視される。不正なデータ操作を防げる。
        params.require(:tweet).permit(:title, :content)
    end

   #DRY(Dont Repeat yourself)同じコードを繰り返し書くの防ぐため
   def set_tweet
    #:idで指定した投稿を取得して@tweetの内に格納している。
    @tweet = Tweet.find(params[:id])
   end
end
