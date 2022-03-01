# [Flutter Tutorial for Beginners](https://youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ)

> the notes do not consider the installation of Flutter, Dart or again Android Studio, since the instructions are time-sensitive and version-specific

> the repository includes only the scripts which are modified to complete the applications

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

You can change the value of the variable, but only mantaining the type.

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

A list keeps track of multiple values.

```dart
List numbers = [3, 12, 1];
```

Access values by index starting at 0.

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

The extended object is equipped with its properties and methods while retaining the corresponding values from the parent class.

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

The class is a widget which structures the application with a widget tree.

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

`AppBar` adds a bar at the top of the screen. The widget accepts a title property to describe a specific string. Notice that the title is included with yet another widget — `Text`.

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

Add a button with a button widget. The material API offers different styles, for instance a filled button with a shadow in `ElevatedButton`.

```dart
ElevatedButton(
    onPressed: () {},
    child: Text('Click me'),
),
```

A button without a solid background with `TextButton`.

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

For the icon append the `.icon` keyword to the widget. Refer to the specific icon in the `icon` field and an icon widget.

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

`EdgeInsets` changes the spacing on all sides, but also the top/bottom, left/right sections or again the four sides individually — left, top, right, bottom.

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

## id_card_state

> ! the script relies on a static image in the `assets` folder

Create a dummy app using [id_card](#id_card) as a starting point.

### Stateful widgets

Instead of relying on a stateless widget create a stateful widget to consider data which changes over time.

The goal is to ultimately update the application to reflect the change in state.

Similarly to the stateless widget define a class which extends the built-in `StatefulWidget`.

```dart
class Home extends StatefulWidget {
	@override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	@override
    Widget build(BuildContext context) {
		return Container();
	}
}
```

There are two classes since the idea is to link a state object —` _HomeState` — to a widget — `Home`.

Define the variable at the top of the class extending the state.

```dart
class _HomeState extends State<Home> {
  int hearts = 0;

	// @override...
}
```

Include the value with the `$` prefix.

```dart
Text(
	'$hearts'
)
```

Update the state, for instance at the press of a button, in the body of the `setState` function.

```dart
onPressed: () {
	setState(() {
		hearts += 1;
	});
}
```

Through `setState` Flutter knows to rebuild the widget tree and update the relevant section.

## dynamic_quotes

## List of data

As a setup create a stateful widget.

```dart
class QuoteList extends StatefulWidget {
    @override
    _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
    @override
    Widget build(BuildContext context) {
        return Scaffold();
    }
}
```

Use the widget in the `home` property of the `MaterialApp` instance.

```dart
void main() => runApp(
    MaterialApp(
        home: QuoteList()
    ),
);
```

In terms of widget tree use a scaffold widget with an arbitrary background color, application bar and body.

```dart
Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
        title: Text('Quote List'),
        centerTitle: true,
        backgroundColor: Colors.red[100],
    ),
    body: Column(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        children: []
    ),
);
```

In the column widget the idea is to include one widget for each quote from in a list.

Create a list of strings at the top of the widget.

```dart
List<String> quotes = [
    'I don\'t wanna stop at all',
    'You can\'t start a fire without a spark',
    'Stop when the red lights flash',
];
```

To render each and every string loop through the list with the `map` function.

```dart
children: quotes.map((quote) {

}),
```

In the body return a text widget with the value of the quote

```dart
children: quotes.map((quote) {
    return Text(quote);
}),
```

Since `children` expects a `<List>`, and not an iterable of `<Text>` nodes, chain the `toList()` method.

```dart
children: quotes.map((quote) {
    return Text(quote);
}).toList(),
```

---

The function can be made into an arrow function as a matter of preference.

```dart
quotes.map((quote) => Text(quote)).toList()
```

---

## Custom classes

Instead of adding a quote as-is, create a separate dart script to encapsulate the widget and its logic — `quote.dart`.

```dart
class Quote {
    String text;
    String author;

    Quote(this.text, this.author);
}
```

In the main script import the class.

```dart
import 'quote.dart';
```

With this starting point you'd instantiate a new quote passing the text and author in order.

```dart
Quote quote = Quote('Third time\'s the charm', 'me')
```

As a matter of preference, however, the course introduces _named parameters_.

Update the constructor.

```diff
Quote(this.text, this.author);
+Quote({ this.text, this.author });
```

---

Android studio asks to initialize the variables to a non-null value or add the `required` keyword.

```diff
Quote({ this.text, this.author });
+Quote({ this.text = '', this.author = '' });
+Quote({ required this.text, required this.author });
```

---

Pass the text and author specifying the value after the corresponding keyword. In this instance the order of the arguments doesn't matter.

```dart
Quote quote = Quote(text: 'Third time\'s the charm', author: 'me')
```

Update `quotes` to define a list of quote objects instead of stings.

```dart
List<Quote> quotes = [
    Quote(),
    Quote(),
]
```

Loop through the quotes and add the relevant data in quotes, wrapping the property after the dollar sign in curly braces.

```dart
Text('${quote.text} - ${quote.author}')
```

## Cards

Instead of adding the quotes in a text widget the idea is to create a more complex widget, a card displaying the information in a column.

Create a separate function to return the widget tree.

```dart
Widget quoteTemplate(Quote quote) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
    child: Column(
      children: <Widget>[
        Text(
          quote.text,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 6.0),
        Text(
          quote.author,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[700],
          ),
        ),
      ]
    ),
  );
}
```

Use the function instead of the text node.

```diff
-Text('${quote.text} - ${quote.author}')
+quoteTempalte(quote))
```

---

Ultimately the widget tree is updated to:

- add padding for each card

- have the content of each card stretch to cover the available width

---

## Extracting widgets

Instead of relying on a function the idea is to extract the widgets in a stateless widget. This is to ultimately provide the relevant structure creating an instance of the class.

```diff
-return Card()
+return new QuoteCard(quote: quote);
```

Initialize the class as an extension of a stateless widget which returns the previous card widget.

```dart
class QuoteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Card(
          // ...
      )
  }
}
```

In the return statement the class relies on a quote, so that it is necessary to specify its value in the constructor.

```dart
class QuoteCard extends StatelessWidget {
    Quote quote;

    QuoteCard { required this.quote };
);
```

As a stateless widget, however, you need to describe the input value with the `final` keyword. This is data which doesn't change.

```diff
Quote quote;
+final Quote quote;
```

With this setup create an instance of the class in the body of the templating function

```dart
Widget quoteTemplate(Quote quote) {
  return new QuoteCard(quote: quote);
}
```

Ultimately it is possible to directly return the instance in the mapping function.

```diff
-quoteTempalte(quote))
+new QuoteCard(quote: quote)
```

The `new` keyword is also optional.

```diff
-new QuoteCard(quote: quote)
+QuoteCard(quote: quote)
```

---

To improve the structure of the code, extract the class in its own file and import the widget at the top of the script.

```dart
import QuoteCard from 'quote_card.dart';
```

In the separate file you need to import the material library as well as the quote class.

```dart
import 'package:flutter/material.dart';
import 'quote.dart';
```

---

## Functions as parameters

Add a button widget to each instance of the quote card — in this instance an icon button.

```dart
IconButton(
    onPressed: () { },
    icon: Icon(Icons.delete_outline)
),
```

`QuoteCard` is a stateless component, so that it is not able to update the state of the application. With this in mind the idea is to update the state from `QuoteList` by way of a function and then pass the function an argument.

Define a `delete` function alongside the `quote` field. Through `setState` use the function to remove the associated quote.

```dart
QuoteCard(
    quote: quote,
    delete: () {
        setState(() {
            quotes.remove(quote);
        });
    }
)
```

Update the card class to receive the function together with the quote.

```dart
final Function delete;

QuoteCard({ required this.quote, required this.delete });
```

In the button widget call the function.

```dart
IconButton(
    onPressed: () { delete(); },
    icon: Icon(Icons.delete_outline)
),
```

## world_time

### Pages and packages

The application is set to have three pages, each encapsulated in its own `.dart` file.

```text
main.dart
pages
    loading.dart
    home.dart
    location.dart
```

Initialize the pages with stateful widgets. For instance and `home.dart` create the classes following the example of [dynamic quotes](#dynamicquotes).

```dart
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Text('Home'),
    );
  }
}
```

In the script `main.dart` import the pages.

```dart
import 'pages/home.dart';
```

Use the relative path _or_ the name of the project itself with the `package:` prefix. This is similar to how the main script imports the material library.

```dart
import 'package:world_time/pages/home.dart';
```

Use a specific page in the `home` property of the `MaterialApp` widget.

```dart
void main() {
  runApp(MaterialApp(
    home: Home()
  ));
}
```

---

With `home.dart` the course does not include an application bar, so that the text is initially pushed at the top, potentially behind the status bar. Use the `SafeArea` widget to avoid this issue.

```dart
body: SafeArea(
    child: Text('Home'),
)
```

---

### Maps and routing

In the dart language a map describes a data structure with key value pairs.

```dart
Map student = {
    'name': 'Timothy',
    'age': 28,
};
```

Extract specific values with bracket notation.

```dart
print(student['name']); // Timothy
print(student['age']); // 28
```

The data structure is relevant for the pages in the application since routing is based on a map in the `routes` field.

```dart
MaterialApp(
    routes: {}
)
```

In this map the key describes the path to the route. The value is a function which receives `context` as an argument.

```dart
routes: {
    '/': (context) {}
}
```

In the function return a specific widget

```dart
routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => Location(),
}
```


The `home` field creates a conflict with `routes`. Remove the first property to rely on the routes instead.

```diff
-home: Home(),
routes: {
```

By default flutter loads the widget described in `/`. Provide an alternative in the `initialRoute` field.

```dart
initialRoute: '/home',
routes: {}
```

To navigate between routes use the `Navigator` object. 

Add a button in the home widget.



At the press of a button, for instance, move to the location screen with the `pushNamed` method.

```dart
onPressed: () {
    Navigator.pushNamed(context, '/location');
}
```

With `pushNamed` you push the widget on top of the existing one. In the moment you add an app bar in the new page flutter adds a back button to navigate back to the previous widget.

```dart
Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
        title: Text('Change location'),
        centerTitle: true,
    ),
    body: Text('Location'),
)
```


### Widget lifecycle

Stateful widgets register events for specific moments in their lifecycle.

One of these events is already considered with the `build` function.

```dart
class _HomeState extends State<Home> {
    @override
    Widget build(BuildContext context) {
        return SafeArea();
    }
}
```

The "build" event is registered every time the widget is built — when initialized and every time the script calls the `setState` function.

The "initState" event is registered once when the widget is first initialized. You tap into this event with the `initState` function.

```dart
@override
void initState() {
    super.initState();

    print('Init');
}
```

Call the function on `super` to trigger the original function.

The "dispose" event is registered once when the widget is finally destroyed.

```dart
@override
void dispose() {
    super.dispose();

    print('Dispose');
}
```

### Asynchorous code

To implement asynchronous code — logic which takes time and resolves at a point in time without blocking the application — dart provides the `async` and `await` keywords alongside the concept of _futures_.

To simulate the feature define a function `getData`.

```dart
void getData() {

}
```

Call the function in the `build` method of the home widget, or again the `initState` method of the location screen.

```dart
@override
Widget build(BuildContext context) {
    getData();
}
```

In `getData` use `Future.delayed` to wait for a specific amount of time.

```dart
Future.delayed(Duration(seconds: 3), () {
    print('Hello delayed');
});
```

The `Duration` global specifies a duration with a specific time.

In the snippet the print statement is run after 3 seconds. In those seconds, however, the application continues.

```dart
Future.delayed(Duration(seconds: 3), () {
    print('Hello delayed');
});
print('Hello now');
```

In the moment you call the function you'd see the string "Hello now" immediately, "Hello delayed" after the specified lapse.

If you want to wait for the execution of a future make the function into an async function.

```dart
void getData() async {

}
```

Use the `await` keyword to wait for the completion of the future.

```dart
await Future.delayed(Duration(seconds: 3), () {
    print('Hello delayed')
});
print('Hello now?');
```

In the snippet the order of the print statement would be the opposite of the previous example.

Store a specific value from the future by returning something in the body of the curly braces.

```dart
String username = await Future.delayed(Duration(seconds: 3), () {
    return 'Timothy';
});
print(username);
```

### Flutter packages

[pub.dev](https://pub.dev/) is the relevant package repository for dart and flutter applications. Here you find modules and functionalities developed by other developers to achieve specific features.

For the world time app one of the useful packages is `http`. The module handles network requests to specific endpoints.

Install the package adding a version to `pubspec.yaml` and the `dependencies` field.

```dart
dependencies:
  http: ^0.13.4
```

Import the module in the benefiting files.

```dart
import 'package:http/http.dart';
```

### Get sample data

Update the application to launch the loading widget.

```diff
-initialRoute: '/home',
routes: {}
```

Move the logic of `getData` from the home widget to the loading one, removing the existing futures and print statements.

In `getData` make a network request to the [JSON placeholder API](https://jsonplaceholder.typicode.com/).

```dart
void getData() async {
    Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
}
```

The `response` type and `get` functions are available from the `http` module. `response` itself provides a string in the `body` field.

```dart
Response response = await get();
print(response.body)
/*
{
    "userId"	1
    "id"	1
    "title"	"delectus aut autem"
    "completed"	false
}
*/
```

Call the function in the `initState` method to highlight the result in the console.

```dart
void initState() {
    super.initState();

    getData();
}
```

Use a converting function from the `dart:convert` library to turn the string into a map.

```dart
import 'dart:convert';

// in getData
Map data = jsonDecode(response.body);
print(data['title']); // delectus aut autem
```

### Get world time

The [world time API](http://worldtimeapi.org) provides the time for specific time zones.

```text
http://worldtimeapi.org/api/timezone/Europe/Rome
http://worldtimeapi.org/api/timezone/Europe/Paris
```

A sample request returns a JSON object with several values.

```json
{
  "abbreviation": "CET",
  "client_ip": "80.180.189.16",
  "datetime": "2022-02-27T17:05:08.426202+01:00",
  "day_of_week": 0,
  "day_of_year": 58,
  "dst": false,
  "dst_from": null,
  "dst_offset": 0,
  "dst_until": null,
  "raw_offset": 3600,
  "timezone": "Europe/Paris",
  "unixtime": 1645977908,
  "utc_datetime": "2022-02-27T16:05:08.426202+00:00",
  "utc_offset": "+01:00",
  "week_number": 8
}
```

In the application the idea is to use `utc_datetime` alongside `utc_offset` to find the time at the specific location.

Rename the test `getData` function to `getTime`

```diff
-void getData() async {
+void getTime() async {
```

```diff
-getData()
+getTime();
```

In the body of the asynchronous function make a request with an arbitrary location.

```dart
Response response = await get();
Map data = jsonDecode(response.body);
```

From `data` retrieve the desired values for the time and offset.

```dart
String datetime = data['utc_datetime'];
String offset = data['utc_offset'];
```

The values are strings. Use the `Datetime` object and the `parse` method to turn the string for the datetime into a date object.

```dart
DateTime now = DateTime.parse(datetime);
```

The instance provides several helper methods to compute dates and extract useful data such as hour, minutes.

```dart
print(now); // 2022-02-28 16:28:01.504304Z
print(now.hour); // 16
```

To add an offset use the `add` method specifying a duration object.

```dart
now.add(Duration(hours: 1));
```

To include the value from the `offset` variable — a string — into the duration object — an integer — extract the number of hours and parse the value as an integer.

```dart
String offset = data['utc_offset']; // '+01:00'
String hours = offset.substring(1,3); // 01

now = now.add(Duration(hours: int.parse(hours)));
```

Note that `add` returns a new date object, and does not modify the original instance.

```dart
print(now)
```

## WorldTime custom class

Create a dedicated class to perform the network request and set a specific time.

```text
main.dart
pages
    loading.dart
    home.dart
    location.dart
services
    world_time.dart
```

In the script import the `http` module and the converting utility before initializing the class.

```dart
import 'package:http/http.dart';
import 'dart:convert';
```

Initialize the class with three values: `location` for the name displayed in the UI, `flag` for the png asset describing a flag in the upcoming assets folder, and `url` for the endpoint in the world time API.

```dart
class WorldTime {
    String location;
    String flag;
    String url = '';

    WorldTime({required this.location, required this.flag, required this.url });
}
```

An example instance would create an object as follows.

```dart
WorldTime instance = WorldTime(location: 'Paris', flag: 'france.png', url: 'Europe/Paris');
```

Create a `getTime` method to perform the network request and store the time in a fourth variable.

```dart
String time = '';

void getTime() async {}
```

Repeat the `getTime` function using the input `url` in the HTTP request.

```dart
void getTime() async {
    Response response  = await get ('/$url')

    // ...
}
```

Finally store the value in `time`.

```dart
time = now.toString();
```

With this setup:

- create an instance

  ```dart
  WorldTime instance = WorldTime(location: 'Paris', flag: 'france.svg', url: 'Europe/Paris')
  ```

- compute the time

  ```dart
  await instance.getTime()
  ```

  `await` pauses the execution until the async function has resolved. 
  
  Note that `await` works only in an async function itself.

In the loading screen include the instruction in a dedicated function of the stateful widget.

```dart
void setupWordTime() async {
    // WorldTime ...
}
```

Call the function in the `initState` method so that the application retrieves the time as the widget is created.

```dart
initState() {
    super.initState()

    setupWorldTime();
}
```

With this setup the console highlights an error connected to the instruction calling `getTime`.

```dart
await worldTime.getTime();
// Error: This expression has type 'void' and can't be used
```

Update the definition of the function to describe the future included in its body.

```diff
void getTime() async {}
+Future<void> getTime() async {}
```

To test the feature create a string to display in a text widget.

```dart
String time = 'loading';

// in the build function
body: Center(
    child: Text(time)
)
```

Make a call to the `setState` function once the time is available.

```dart
await instance.getTime();
setState(() {
    time = instance.time;
})
```

### Handling errors

Asynchronous code is resolved at a point in time. Or, raises an error in the moment the task fails. One wait to handle the occurrence is to show a default string when the `async` function fails.

```dart
try {
    await instance.getTime();
    setState(() {
        time = instance.time;
    })
}
catch(error) {
    print('Caught error $error');
    time = 'Could not get time data';
}
```

To test the error try to execute the request to a wrong URL.

```dart
Response response = await get(Uri.parse('http://worldtimeaprg/api/timezone/Europe/$url'));

// Failed host lookup: 'worldtimeaprg' (OS Error: No address associated with hostname, errno = 7)
```

## Pass route data

Instead of displaying the time in the loading screen the idea is to pass the data to the home screen.

Remove the time reference and the set state and push the home screen.

```dart
Navigator.pushNamed(context, '/home')
```

`pushNamed` adds the home screen _on top_ of the loading screen, but it is no longer necessary to maintain the previous widget. Use `pushReplacementNamed` instead.

```dart
Navigator.pushReplacementNamed(context, '/home')
```

Pass data through a keyword argument describing a map.

```dart
Navigator.pushReplacementNamed(context, '/home', arguments: {
    'time': instance.time
})
```

For the application pass the time alongside the location and flag.

```dart
{
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
}
```

In the home widget the information is made available in the `build` function and with a specific sequence.

```dart
Widget build(BuildContext context) {
    print(ModalRoute.of(context)?.settings.arguments);
}
```

Initialize a map to store the data and update the variable with the `arguments` field.

```dart
Map data = {};

Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments as Map;
}
```

In the widget tree add the values through several text widgets.

### Formatting and showing dates

Instead of storing the DateTime object as a string  the idea is to format the instance with the [`intl`](https://pub.dev/packages/intl) package.

Similarly to the `http` module add the dependency to `pubspec.yaml`.

```yaml
dependencies:
  intl: ^0.17.0
```

Import the value in the script creating the `WorldTime` class.

```dart
import 'package:intl/intl.dart';
```

Save the time not as a string but through a specific sequence to retrieve the hour and minutes

```dart
time = DateFormat.jm().format(now); // 1:20pm
```

### Redesign widgets

Update the home widget to present the information in a column. In this column show the button to change the location, the location itself and the time.

The style of the text, in size and or color, is a matter of preference.

### Loading spinner

For the loading widget the idea is to highlight the loading process with a spinner instead of a hard-coded string.

Install [flutter_spinkit](https://pub.dev/packages/flutter_spinkit) in `pubspec.yaml`.

```yaml
dependencies:
  flutter_spinkit: ^5.1.0
```

Require the module.

```dart
import 'package:flutter_spinkit/flutter_spinkit.dart';
```

Replace the existing tree with a `Center` widget and nest as a child one of the widgets from the module:

```dart
Center(
    child: SpinKitChasingDots(
        color: Colors.grey[100],
        size: 48.0,
    )
)
```

Customize the spinner in terms of size and color.

---

Include the spinner as a child of a `Scaffold` widget to change the default background.

```dart
Scaffold(
    backgroundColor: Colors.indigo,
    child: SpinKitChasingDots()
)
```

---

### Conditional image

In the home widget the idea is to show an image from the assets folder. One of two images depending on the time of day.

Update the yaml config file to consider the `assets` folder.

```yaml
assets
- assets/
```

Update the world time class with a boolean describing the state.

```dart
bool isDayTime;
```

Evaluate the condition on the basis of `now`.

```dart
isDayTime = (now.hour > 6) & (now.hour < 20);
```

Pass the information in the home widget with the other arguments.

```dart
{
    'isDaytime': instance.isDayTime
}
```

In the home widget use the boolean to describe the path to the image.

```dart
String bgImage = data['isDaytime'] ? 'day.png' : 'night.png'
```

In the widget tree add a `decoration` field of a `Container` widget. Use the `BoxDecoration` widget to have the asset image fitted to cover the entirety of the page.

```dart
child Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/$bgImage'),
            fit: BoxFit.cover // full background image
        )
    )
)
```

### Locations

In the third and final widget, `location.dart`, the idea is to show a list of locations to change the time displayed in the homepage.

Define a list of world time instances for a few options.

```dart
List<WorldTime> worldTimes = [
    WorldTime(location: 'Paris', flag: 'france.png', url: 'Europe/Paris'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Moscow', flag: 'russia.png', url: 'Europe/Moscow'),
];
```

Instead of looping through the list with the `map` function, like in the previous demo devoted to [dynamic quotes](#dynamicquotes), use a `ListView.builder` widget from the material library.

```dart
body: ListView.builder(
)
```

In the widget specify the number of items as well as a callback function receiving the context and the index of each item.

```dart
ListView.builder(
    itemCount: worldTime.length,
    itemBuilder: (context, index) {}
)
```

In the body of the function return a widget tree accessing the data from the individual instances of the world time class.

```dart
itemBuilder: (context, index) {
    // access locations[index]
    return Card(
        return child: ListTile()
    )
}
```

Use the `ListTile` widget to show the location after an image for the flag.

```dart
title: Text(worldTime[index].location),
leading: CircleAvatar(
    backgroundImage: AssetImage('assets/${worldTime[index].flag}')
)
```

### Update location

From the location widget the idea is to use `getTime` to update the data displayed in the home widget.

In the `ListTile` widget add an `onTap` field similar to `onPressed`.

```dart
onTap: () {
    updateTime(index);
}
```

Define `updateTime` to consider the world time instance and set its time.

```dart
void updateTime(index) async {
    WorldTime worldTime = worldTimes[index];
    await worldTime.getTime();
}
```

Finally pop the screen to move back to the home widget.

```dart
Navigator.pop(context)
```

To pass the data back to the home screen add a map as a second argument.

```dart
Navigator.pop(context, {
    location: instance['location'],
    // ...
})
```

The issue in the receiving script is that as you pop the widget the home is not rebuilt. The arguments are not included as when the application moves from the loading to the home screen.

You can receive the value considering the location widget as a large future. When you push the widget on top of the home store the result of `Navigator.pushNamed`.

```diff
Navigator.pushNamed('/location');
+dynamic result = await Navigator.pushNamed('/location');
```

As you retrieve this result update the data with `setState`.

```dart
setState(() {
    data = {
        'time': result['time'],
        // ..
    };
});
```

The `build` function is triggered and the widget tree is rebuilt. Since the build function uses the value from the arguments field. hover, the value is not kept.

```dart
data = ModalRoute.of(context).settings.arguments;
```

One way to solve this issue is to use the arguments only if `data` is not already initialized.

```dart
data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments
```
