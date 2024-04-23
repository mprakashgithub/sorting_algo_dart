import 'package:flutter/material.dart';
import 'package:sorting_algo/heap_sort.dart';
import 'package:sorting_algo/selection_sort.dart';

class SortingAlgos extends StatefulWidget {
  const SortingAlgos({super.key});

  @override
  State<SortingAlgos> createState() => _SortingAlgosState();
}

class _SortingAlgosState extends State<SortingAlgos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 234, 232),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectionSortAlgo()));
              },
              child: const Text("Selection sort"),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HeapSortAlgo()));
              },
              child: const Text("Heap sort"),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text("Merge sort"),
            )
          ],
        ),
      ),
    );
  }
}
