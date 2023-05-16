class RemoveNotNullFromUserIdInTweets < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tweets, :user_id, true
  end
end
