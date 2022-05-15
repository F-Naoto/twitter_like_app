class Message < ApplicationRecord
   #「データ保存した後にコミットする {MessageBroadcastJobのperformを遅延実行する 引数はself}」となる
   # =>rails g job MessageBroadcastでMessageBroadcastJobを作成
  after_create_commit { MessageBroadcastJob.perform_later self }
end
