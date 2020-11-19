import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const groupId = data.group.id
    const currentGroupId = Number(document.getElementById("current_group_id").textContent);
    const userId = data.user.id
    const currentId = Number(document.getElementById("current_user_id").textContent);
    if (groupId === currentGroupId) {
      if (userId === currentId) {
        const htmlRight = `
          <div class="bms_message bms_right">
            <div class="bms_message_box">
              <div class="bms_message_content">
                <div class="bms_message_text">${data.chat.text}</div>
              </div>
            </div>
            <div class="bms_message_name_right">${data.user.name}</div>
            <div class="bms_message_name_right">${data.time}</div>
          </div>
          <div class="bms_clear"></div>`;
        const chats = document.getElementById('bms_messages');
        const newChat = document.getElementById('chat_text');
        chats.insertAdjacentHTML('beforeend', htmlRight);
        newChat.value='';
      } else {
        const htmlLeft = `
          <div class="bms_message bms_left">
            <div class="bms_message_box">
              <div class="bms_message_content">
                <div class="bms_message_text">${data.chat.text}</div>
              </div>
            </div>
            <div class="bms_message_name_left">${data.user.name}</div>
            <div class="bms_message_name_right">${data.time}</div>
          </div>
          <div class="bms_clear"></div>`;
        const chats = document.getElementById('bms_messages');
        const newChat = document.getElementById('chat_text');
        chats.insertAdjacentHTML('beforeend', htmlLeft);
        newChat.value='';
      }
    }
  }
});
