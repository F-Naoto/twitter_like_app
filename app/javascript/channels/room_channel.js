import consumer from "./consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
  },
// エンターを押し下げたら、speakアクションが発火=>appRoom.speak(e.target.value)により、入力したテキストが引数messageに渡る
// room_channel.rbのspeakメソッドを呼び出す
  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

// 文字入力後、エンターキーを押し下げるとイベントが発火
window.addEventListener("keypress", function(e) {
  if (e.keyCode === 13) {
    appRoom.speak(e.target.value);
    e.target.value = '';
    e.preventDefault();
  }
})