const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const string1 = "c_8ZQWmWQ8qKMUwcVr8AKj:APA91bGbear3SPwrLfE28afrZ1tRalqR";
const string2 = "ygeEtrMJf0s902I-OkzTgOi5VINWKR3iee3tIKTFGsMsLNgr2g1YrAp";
const string3 = "HGIXeDDjwHbMAdVbkKaA48I8eE4ZDIk_yI6uiohRaaEfcdJZQzWfK";

let tockens = string1 + string2 + string3;

exports.sendCartChangeNotification = functions.database.ref("/isNoti")
    .onUpdate(async (change, context) => {
      const beforeData = change.before.val(); // Giá trị trước khi thay đổi
      const afterData = change.after.val(); // Giá trị sau khi thay đổi
      if (beforeData !== afterData && afterData!="null") {
        // const tokensSnapshot = await admin.database().ref("/token").once("value");
        tockens = afterData;
  
        const payload = {
          notification: {
            title: "Đơn hàng",
            body: `Bạn vừa đặt thành công đơn hàng mới`,
          },
        };
        const response = await admin.messaging().sendToDevice(tockens, payload);
        const tokensToRemove = [];
        response.results.forEach((result, index) => {
          if (result.error) {
            console.error("Lỗi khi gửi thông báo:", result.error);
          }else{
        console.log("Dã gửi thông báo");

          }
        });
        return Promise.all(tokensToRemove);
      } else {
        console.log("Giá trị  không thay đổi.");
        return null;
      }
    });
