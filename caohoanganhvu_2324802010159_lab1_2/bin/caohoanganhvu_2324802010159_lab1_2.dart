void main() {
  var name = "Srinivas";
  int age = 20;
  double height = 5.9;
  bool isAdult = age >= 18 ? true : false;
  print("Name: $name");
  print("Age: $age");
  print("Height: $height");

  if (isAdult) {
    print("$name is an adult.");
  } else {
    print("$name is not an adult.");
  }

  greet(name);

  for (int i = 1; i <= 5; i++) {
    print('Loop iteration $i');
    if (i == 3) {
      break;
    }
  }

  List<String> friends = ['Bhanu', 'Amar', 'Amulya', 'Kiran', 'Sandeep'];

  for (String friend in friends) {
    print("Hello, $friend!");
  }

  Person person = Person(name, age, height);
  person.introduce();

  try {
    int result = 10 ~/ 0;
    print('Result: $result');
  } catch (e) {
    print("An error occurred: $e");
  }
}

void greet(String name) {
  print("Welcome to SDC, $name!");
}

class Person {
  String name;
  int age;
  double height;
  bool isAdult;

  Person(this.name, this.age, this.height) : isAdult = age >= 18 ? true : false;

  void introduce() {
    print(
      'My name is $name, I am $age years old and my height is $height feet.',
    );
  }
}
