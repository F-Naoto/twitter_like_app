class RoomChannel < ApplicationCable::Channel
  # ユーザーがサーバーを立ち上げ、localhost:3000にアクセスするとsubscribeアクションが発火・room_channel.jsとサーバーサイド側のroom_channel.rbでデータの送受信ができるようになる
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # room_channel.jsのspeakアクションからdata['引数']が渡る=>データベースに保存
  def speak(data)
    # ActionCable.server.broadcast 'room_channel', message: data['message']
    Message.create(content:data['message'])
  end
end
