class MessageBroadcastJob < ApplicationJob
  queue_as :default

  #データを保存できたらperformアクションが実行される
  # 以下の部分テンプレートにmessageが渡された状態でmessage: ここに入る
  # <div class="message">
  # <p><%= message.content %></p>
  # </div>
  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private
  #「app/views/messages/_message.html.erb」を呼び出し
  #messages/messageの部分テンプレートを呼び出し、messageを最初に入力したテキストが渡されたmessageとして使用する。
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
