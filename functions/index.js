const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const string1 = "d-5j3Zl3TYOmgiYoRv_jI-:APA91bGc5cDAWQNbmIl5LO-iuIxbQhoC";
const string2 = "Xvmins1rHaK08BU9WCeoARTnFiEG3xh3e-8tLepMGinprPyJ4V_9ZWJ";
const string3 = "69NbEmxlxZZ8kRVtiYq0XcUz9ncyJxr0ON8TWYdoC5Xo56uR-NB1_";

const tockens = string1 + string2 + string3;

exports.sendCartChangeNotification = functions.database.ref("/isNoti")
    .onUpdate(async (change, context) => {
      const beforeData = change.before.val(); // Giá trị trước khi thay đổi
      const afterData = change.after.val(); // Giá trị sau khi thay đổi
      if (beforeData !== afterData && afterData==true) {
        const tokensSnapshot = await admin.database().ref("/token").once("value");
        tokens = tokensSnapshot.val();
        console.log(tokens)
  
        const payload = {
          notification: {
            title: "Đơn hàng",
            body: `Bạn vừa đặt thành công đơn hàng mới`,
          },
        };
        const tokens = tockens;
        const response = await admin.messaging().sendToDevice(tokens, payload);
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
