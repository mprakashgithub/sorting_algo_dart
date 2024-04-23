import 'package:flutter/material.dart';

class SelectionSortAlgo extends StatefulWidget {
  const SelectionSortAlgo({super.key});

  @override
  State<SelectionSortAlgo> createState() => _SelectionSortAlgoState();
}

class _SelectionSortAlgoState extends State<SelectionSortAlgo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  List<int> listItems = [];
  List<int> originalListItems = [];
  List<int> sortedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection sort demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              textFieldWidget(),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text("Elements: $listItems"),
              ),
              Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    selectionSort(listItems);
                  },
                  child: const Text("Sort"),
                ),
              ),
              sortedItems.isNotEmpty
                  ? Text("Sorted element: $sortedItems")
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldWidget() {
    return TextFormField(
      controller: _textEditingController,
      decoration: InputDecoration(
        labelText: 'Enter your text',
        hintText: 'Type something here',
        icon: const Icon(Icons.text_fields),
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.lightBlue[50],
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        prefixIcon: const Icon(Icons.input),
        suffixIcon: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.blue),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              setState(() {
                listItems.add(int.parse(_textEditingController.text));
                _textEditingController.clear();
              });
            },
          ),
        ),
        counterText: 'Character count: ${_textEditingController.text.length}',
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      maxLines: 1,
      maxLength: 100,
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return 'Please enter some text';
        }
        return null;
      },
      onSaved: (value) {
        // You can handle the saved value here
      },
      onChanged: (val) {
        debugPrint("val: $val");
      },
    );
  }

  List<int> selectionSort(List<int> list) {
    for (int i = 0; i < list.length; i++) {
      int minIndex = i;

      // Find the minimum element in unsorted array
      for (int j = i + 1; j < list.length; j++) {
        if (list[j] < list[minIndex]) {
          minIndex = j;
        }
      }

      // Swap the found minimum element with the first element
      swap(list, i, minIndex);
    }
    debugPrint("Sorted List: $list");
    setState(() {
      sortedItems = list;
    });
    return sortedItems;
  }

  void swap(List<int> list, int left, int right) {
    int temp = list[left];
    list[left] = list[right];
    list[right] = temp;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
