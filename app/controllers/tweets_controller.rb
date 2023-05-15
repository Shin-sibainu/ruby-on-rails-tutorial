class TweetsController < ApplicationController
    def index 
        @tweets = Tweet.all
    end

    def new
        #新しいTweetオブジェクトをメモリ上に作成。まだDB上には保存されていない。
        @tweet = Tweet.new
    end

    def create
        @tweet = Tweet.new(tweet_params)

        if @tweet.save #保存に成功したらtrueを返す。
            redirect_to tweets_path #indexページへリダイレクト
        else
            render :new #newフォームが再度表示されます。この時、フォームに入力されていたデータは保持され、エラーメッセージと共にユーザーに表示できます。
        end
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
end
