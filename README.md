# [Flutter Tutorial for Beginners](https://youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ)

> the notes do not consider the installation of Flutter, Dart or again Android Studio, since the instructions are time-sensitive and version-specific

## primer.dart

> [dart.dev](https://dartpad.dev) provides a playground for Dart code

A `.dart` script includes one essential function in `main`.

```dart
void main() {
  print('Hello');
}
```

Once you execute the program the script follows the instructions in the body of the function.

### Variables

Dart supports static and dynamic typing.

Static: define the type of the variable before its name.

```dart
String name = 'Eliza';
int age = 27;
bool isLoggedIn = false;
```

You can change the value of the variable, but only maintaing the type.

```dart
name = 42;
// A value of type 'int' can't be assigned to a variable of type 'String'.
```

Dynamic: add the `dynamic` keyword before the name of the variable

```dart
dynamic name = 'Eliza';
name = 42;
```

You can change the value and also the type of the variable.

### Functions

`main` provides a first example of a function.

```dart
void main() {

}
```

Behind the scenes Flutter executes the logic of the function calling its name.

```dart
main();
```

`void` describes the value returned by the function — in this instance nothing.

Create functions specifying the return type and the function's name.

```dart
String getName() {
  return 'Eliza';
}
```

Call the function by name.

```dart
void main() {
  print(getName());
}
```

### Lists

A variable stores a single piece of data.

A list allows to keep track of multiple values.

```dart
List numbers = [3, 12, 1];
```

Access values by index — starting at 0.

```dart
print(numbers[1]);
// 12
```

Add values with the `add` method`.

```dart
numbers.add(7);
```

Remove element with the `remove` method, pointing to the desired value.

```dart
numbers.remove(3);
```

The function only deletes the first instance.

```dart
List numbers = [3, 12, 1, 3, 2];
numbers.remove(3);
print(numbers);
// [12, 1, 3, 2]
```

If there is no value the list is not modified — and no warning is raised.

```dart
List numbers = [3, 12, 1];
numbers.remove(0);
print(numbers);
// [3, 12, 1]
```

When you initialize the collection with `List` the collection is able to store different types at the same time.

```dart
numbers.add('Eliza');
```

Add a type in between closing — `<` — and opening — `>` — tags to guarantee a specific type.

```dart
List<int> numbers = [3, 12, 1];
numbers.add('Eliza');
// The argument type 'String' can't be assigned to the parameter type 'int'.
```

### Classes

Classes work as blueprints for objects, entities with properties and methods.

Define a class.

```dart
class User {
    String username = 'Eliza';
    int age = 27;
    bool isLoggedIn = false;

    void login() {
        isLoggedIn = true;
        print('User is logged in');
    }
}
```

Create an instance using the name of the class as its type.

```dart
User eliza = User();
print(eliza.age); // 27
```

Define a _constructor_ to create objects with a set of input values.

```dart
class User {
    String username;
    int age;
    bool isLoggedIn = false;

    User(this.username, this.age, this.isLoggedIn);
}
```

Pass the values in the instance of the class.

```dart
User user = User('Timothy', 28);
print(user.username); // Timothy
print(user.age); // 28
```

---

dart.dev suggests using _initializing formals_ over the instruction described in the course.

```dart
/*
User(String username, int age, bool isLoggedIn) {
    this.username = username;
    this.age = age;
    this.isLoggedIn = isLoggedIn;
}

*/

User(this.username, this.age, this.isLoggedIn);
```

---

### Inheritance

A class is able to extend another entity.

```dart
class PoliteUser extends User {
  PoliteUser(String username, int age, bool isLoggedIn): super(username, age, isLoggedIn);

  void greet() {
    print('Jolly greetings to you');
  }
}
```

`super` works to have the class initialize the arguments required by the parent class.

```dart
PoliteUser politeUser = PoliteUser('Grace', 28, false);
politeUser.greet();
```

The extended object is equipped with its properties and methods while retaining the corresponding values rfom the parent class.
