void main() {
  print('Hello');

  String name = 'Eliza';
  int age = 27;
  bool isLoggedIn = false;

  // name = 42; // A value of type 'int' can't be assigned to a variable of type 'String'.

  print(getName());

  List numbers = [3, 12, 1, 3];
  print(numbers);
  numbers.add(7);
  print(numbers);
  numbers.remove(3);
  print(numbers);
  
  User user = User('Timothy', 28, false);
  print(user.username);
  print(user.age); 
  
  PoliteUser politeUser = PoliteUser('Grace', 28, false);
  politeUser.greet();
}

String getName() {
  return 'Eliza';
}

class User {
    String username = '';
    int age = 0;
    bool isLoggedIn = false;

    User(this.username, this.age, this.isLoggedIn);
  
    void login() {
        isLoggedIn = true;
        print('User is logged in');
    }
}

class PoliteUser extends User {
  PoliteUser(String username, int age, bool isLoggedIn): super(username, age, isLoggedIn);

  void greet() {
    print('Jolly greetings to you');
  }
}