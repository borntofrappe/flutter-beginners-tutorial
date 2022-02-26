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

## hello_world

> ! the script relies on a font file in the `fonts` folder and a static image in the `assets` folder

### Widgets

Flutter is centered on the notion of widgets.

A trivial example comes in the form of an application with a root widget nesting two widget describing an app bar and a container. The app bar might then nest a text widget, while the container might include an image widget.

Each widget has its own set of properties to customize its appearance and logic. For instance, `textAlign` modifies the alignment of text, `elevation` updates the vertical priority of a button.

Widgets are implemented with classes in the Dart programming language.

### Android Studio

> the section assumes a new project is set up with Android Studio, the Flutter plugin and a new device with Android Pie

Highlight the project structure with the 'Project' tab.

The project houses the `dart` script responsible for the application in the `lib` folder.

Past the import statement the main function returns a widget.

```dart
import 'package:flutter/material.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    /* ... */
}
```

The class is a widget which structures the application with a with a widget tree.

To get started remove all the code but the logic starting the application.

```dart
void main() {
    runApp(
        /* ... */
    );
}
```

In `runApp` add a `MaterialApp` widget, a wrapper to benefit from the material guidelines.

```dart
MaterialApp(
)
```

In the widget describe properties in a comma separated list.

```dart
 MaterialApp(
    home: Text('Hello world'),
)
```

With `home` the widget renders an additional widget — `Text` — with an arbitrary string.

### Scaffold and AppBar

With a scaffold widget describe the layout of the application.

```dart
home: Scaffold(
    appBar: AppBar(
        title: Text('HW'),
    ),
)
```

`AppBar` adsd a bar at the top of the screen. The widget accepts a title property to describe a specific string. Notice that the title is included with yet another widget — `Text`.

The tree is built in this fashion nesting properties and values.

```dart
appBar: AppBar(
    title: Text('Hello world app'),
    centerTitle: true,
),
```

Beside the bar add text in the application with the `body` property.

```dart
appBar: AppBar(),
body: Text('Hello world')
```

Use the `Center` widget to center the text vertically and horizontally.

```dart
body: Center(
    child: Text('Hello world'),
)
```

Notice the widget is included through the `child` field.

Use a `FloatingActionButton` widget to add a button — by default in the bottom right corner.

```dart
body: Center(),
floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Text('Click'),
),
```

The button requires a `onPressed` field — in this instance an empty anonymous function.

The [flutter API](https://api.flutter.dev/flutter) highlights all properties and supported values.

### Colors and fonts

Change the appearance of the widget with properties such as `backgroundColor`.

```dart
appBar: AppBar(
    backgroundColor: Colors.red,
)
```

The color is included through the material API, and it is possible to choose from a specific strength.

```diff
backgroundColor: Colors.red,
+backgroundColor: Colors.red[500],
```

The property is also available for the button widget.

```dart
FloatingActionButton(
    backgroundColor: Colors.red[500],
)
```

For the text widget update the appearance with the `style` field and a `TextStyle` widget.

```dart
child: Text(
    'Hello world',
    style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: Colors.grey[700]
    ),
)
```

To add a custom font create a new repository and add the `.ttf` file.

Open `pubspec.yaml` and update the configuration.

```yaml
flutter:
  fonts:
    - family: Karla
      fonts:
        - asset: fonts/Karla.ttf
```

---

YAML is based on indentation, with each nested field set two spaces from the parent node.

---

Refer to the font by name in the `TextStyle` widget.

```dart
style: TextStyle(
    fontFamily: 'Karla',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
    color: Colors.grey[700]
),
```

### Stateless widget and hot reload

At the bottom of the script create a custom widget.

```dart
class Home extends StatelessWidget {   @override
  Widget build(BuildContext context) {
  return Scaffold();
  }
}
```

In this instance you extend the stateless widget, meaning the state of the widget doesn't change over time.

In the build function return the widget tree described in the `home` field.

```dart
return Scaffold(
    appBar: AppBar(
        title: Text('HW'),
        // ..
    ),
    // ..
);
```

In the `main` function rely on the class instead of the widget tree.

```dart
MaterialApp(
    home: Home(),
)
```

This setup enables hot reloading. Whenever you update the widget tree the change is reflected in the device preview.

### Images and assets

Refer to images with a URL or a relative path.

Over the network use the network image widget.

```dart
body: Center(
    child: Image(
        image: NetworkImage('https://images.pexels.com/photos/1517358/pexels-photo-1517358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    ),
),
```

From a local file use the asset image widget.

```dart
body: Center(
    child: Image(
        image: AssetImage('assets/image.png'),
    ),
),
```

Similarly to font files add the folder and the file in the `.yaml` config file.

```yaml
flutter:
  assets:
    - assets/image.png
```

Point to the folder to consider all available images.

```yaml
flutter:
  assets:
    - assets/
```

The material API offers two alternatives to include images with `Image.network` and `Image.asset`.

```dart
child: Image.network('https://images.pexels.com/photos/1517358/pexels-photo-1517358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),

child: Image.asset('assets/rose.jpeg'),
```

### Buttons and icons

Add icons with an icon widget, picking from one of the icons in the material library.

```dart
child: Icon(
    Icons.add_location,
    color: Colors.blue,
    size: 50.0,
),
```

Add button with a button widget. The material API offers different styles, for instance a filled button with a shadow in `ElevatedButton`.

```dart
ElevatedButton(
    onPressed: () {},
    child: Text('Click me'),
),
```

A button without solid background with `TextButton`.

```dart
TextButton(
    onPressed: () {},
    child: Text('Click me'),
),
```

With onPressed the widget reacts to a click.

```dart
onPressed: () {
    print('Button clicked')
},
```

In this instance the message is logged in the `Run` console.

To add an icon append the `.icon` keyword to the widget. Refer to the specific icon in the `icon` field and an icon widget.

```dart
TextButton.icon(
    onPressed: () {
        print('Button clicked');
    },
    icon: Icon(Icons.email),
    label: Text('Click me'),
),
```

For a button with only an ico use the icon button widget.

```dart
IconButton(
    onPressed: () {},
    icon: Icon(Icons.email),
),
```

### Layout

#### Container

Use the container widget to wrap around other widgets and add properties like padding and margin. Nest a single widget with the `child` property.

```dart
Container(
    child: Text(
        'Hello world',
        style: TextStyle(
            fontSize: 32.0,
        ),
    ),
),
```

The `color` property affects the background of the container.

```dart
Container(
    color: Colors.grey[300],
)
```

Without a child widget the container expands to cover the available space.

With a child the container limits itself to the width and height necessary for the widget.

For spacing the padding and margin properties rely on an inset object.

```dart
padding: EdgeInsets.all(20.0),
```

`EdgeInsets` allows to change the spacing on all sides, but also the top/bottom, left/right sections or again the four sides individually — left, top, right, bottom.

```dart
padding: EdgeInsets.symmetric(vertical: 20.0),
padding: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 5.0),
```

The same inset is available for the `margin` property, adding whitespace _around_ the widget.

To add padding to a single object an alternative is to wrap the widget in a padding widget.

```dart
Padding(
    padding: EdgeInsets.all(10.0),
    child: Text('Hello'),
)
```

#### Rows

Use the rows widget to display multiple widgets in the same row. In this instance add the widget in a `children` property.

```dart
Row(
    children: <Widget>[
        Text(),
        FlatBUtton(),
        Padding(
            child: Text(),
        ),
    ],
),
```

Align the widgets horizontally and vertically with the `mainAxisAlignment` and `crossAxisAlignment` properties.

```dart
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
crossAxisAlignment: CrossAxisAlignment.end,
children: // ...,
```

### Columns

Use the column widget to display multiple widget in the same column.

```dart
Column(
    children: <Widget>[],
),
```

The main and cross axis are opposite to the row.

#### Expanded

Use the expanded widget to have a widget expand to the available space.

```dart
Expanded(
    child: ElevatedButton(
        onPressed: () {},
        child: Text('Click me')
    ),
),
```

With multiple expanded widget specify the portion of the available space with the `flex` property.

```dart
Expanded(
    flex: 1,
    child: Text('Hello world')
),
Expanded(
    flex: 2,
    child: ElevatedButton(
        onPressed: () {},
        child: Text('Click me')
    )
),
```

## id_card

> ! the script relies on a static image in the `assets` folder

Create a dummy app to display static values in an arbitrary widget tree.

Past the `AppBar` widget the `body` property includes the following widget tree.

```toml
Padding
	Column
		Center
			CircleAvatar
		Divider
		Text
		SizedBox
		Text
		SizedBox
		Text
		SizedBox
		Text
		SizedBox
		Row
			Icon
			SizedBox
			Text
```

In terms of new widgets:

- use `CircleAvatar` to add a circle and the `background` property to include an image — here with an asset widget

  ```dart
  CircleAvatar(
  	backgroundImage: AssetImage('assets/bingdwendwen.jpg'),
  	radius: 56.0,
  ),
  ```

- use `Divider` to separate the content — here with an arbitrary vertical gap

  ```dart
  Divider(
  	height: 56.0,
  	color: Colors.grey[500],
  ),
  ```

- use `SizedBox` to add whitespace between widgets — in the column size the box in its height, in the row size the box in terms of width

  ```dart
  SizedBox(height: 8.0),
  SizedBox(width: 8.0),
  ```
