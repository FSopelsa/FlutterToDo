import 'package:flutter/material.dart';

class ToDoListView extends StatefulWidget {
  const ToDoListView({super.key});

  @override
  ToDoListViewState createState() => ToDoListViewState();
}

class ToDoListViewState extends State<ToDoListView> {
  final List<String> _items = [];
  final TextEditingController _controller = TextEditingController();

//- _addItem(): Add items to the to-do list. If _controller field is not empty, adds the text to the _items list and clears the text field in the _controller.
  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _items.add(_controller.text);
        _controller.clear();
      });
    }
  }

//- _removeItem(int index): Removes an item (index) from the _items list. Also sets text in the _controller to the item being removed.
  void _removeItem(int index) {
    setState(() {
      _controller.text = _items[index];
      _items.removeAt(index);
    });
  }
  

/*- build(BuildContext context): Is an override of the build method from the State class. It builds the UI of the ToDoListView widget by returning a range of widgets whith the UI's basic structure. The Expanded widget in the body's Column contains a ListView.builder widget that is responsible for dynamically building the list of to-do items based on the length of the _items list.*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_items[index]),
                  onTap: () => _removeItem(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Add a new task',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addItem,
                ),
              ),
              onSubmitted: (value) => _addItem(),
            ),
          ),
        ],
      ),
    );
  }
}