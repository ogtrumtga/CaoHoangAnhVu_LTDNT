const testUser = require('./services/user.service');
const testToDo = require('./services/todo.service');


const test = async () => {
    try {
        let userData = await testUser.registerUser("test6@example.com", "testpassword");
        console.log("userData", userData);
        let todoData = await testToDo.createToDo(userData._id, "Test ToDo", "This is a test to do item");
        console.log("todoData", todoData);
    } catch (error) {
        console.error("Error occurred:", error);
    }
};

test();
