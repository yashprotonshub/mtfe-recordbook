function customConfirm(message, callback) {
    var confirmation = confirm("ChatGPT asking you: " + message);
    callback && callback(confirmation);
  }