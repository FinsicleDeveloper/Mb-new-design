
const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();
exports.sendNotificationBeacons=
functions.firestore.document("beacons/{documentId}").
    onCreate((snapshot, context)=>{
      return admin.messaging().sendToTopic("beacons", {
        notification: {
          title: snapshot.data()["title"],
          body: snapshot.data()["description"],
          image: snapshot.data()["image"],
          clickAction: "FLUTTER_NOTIFICATION_CLICK",
        }, data: {
          image: snapshot.data()["image"],
        },
      });
    });
