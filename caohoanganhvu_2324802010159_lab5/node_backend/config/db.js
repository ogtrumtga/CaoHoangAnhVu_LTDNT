const mongoose = require('mongoose');

mongoose.connect(
    'mongodb+srv://admin:anhvu2005@todoapp.9kwcv5t.mongodb.net/?appName=TodoApp'
)
    .then(() => {
        console.log("MongoDB Connected");
    })
    .catch((err) => {
        console.log("MongoDB Connection error");
        console.log(err);
    });

module.exports = mongoose;