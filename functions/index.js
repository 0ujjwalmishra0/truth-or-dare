const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.startGame = functions.firestore
.document("/rooms/{roomId}")
.onUpdate(async (change, context)=> {
    const roomUpdated= chnage.after.data();
    const roomId= context.params.roomId;

    var random = Random();
    index = random.nextInt(150);

    admin.firestore().collection("rooms")
    .doc(roomId)
    .update({
        'index': index,
    });

});

// Saves a message to the Firebase Realtime Database but sanitizes the text by removing swearwords.
exports.addIndex = functions.https.onCall((data, context) => {
 
    var random = Random();
    index = random.nextInt(150);
    // Message text passed from the client.
const ukdata = data.text;
// returning result.
return {index: index};
    
  });