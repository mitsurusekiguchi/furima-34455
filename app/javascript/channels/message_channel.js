import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.text}</p>`;
    const messages = document.getElementById('message_text');
    const newMessage = document.getElementById('messages');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
