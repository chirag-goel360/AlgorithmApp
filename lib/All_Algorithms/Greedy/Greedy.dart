import 'package:flutter/material.dart';

class Greedy extends StatefulWidget {
  @override
  _GreedyState createState() => _GreedyState();
}

class _GreedyState extends State<Greedy> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = PageController(
    initialPage: 0,
  );
  var scrollDirection = Axis.horizontal;
  var actionIcon = Icons.swap_vert;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text(
          'Greedy Algorithms',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              actionIcon,
            ),
            onPressed: () {
              setState(() {
                scrollDirection == Axis.horizontal ?
                scrollDirection = Axis.vertical :
                scrollDirection = Axis.horizontal;
                actionIcon == Icons.swap_vert ?
                actionIcon = Icons.swap_horiz :
                actionIcon = Icons.swap_vert;
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: scrollDirection==Axis.horizontal ?
                    Text(
                      "Scroll Direction changed to Horizontal",
                    ) :
                    Text(
                      "Scroll Direction changed to Vertical",
                    ),
                    duration: Duration(
                      milliseconds: 1000,
                    ),
                  ),
                );
              });
              controller.position.applyViewportDimension(
                  scrollDirection == Axis.vertical ?
                  _screenSize.height :
                  _screenSize.width
              );
            },
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        scrollDirection: scrollDirection,
        physics: BouncingScrollPhysics(),
        pageSnapping: true,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Card(
              color: Colors.greenAccent,
              elevation: 4,
              margin: EdgeInsets.all(24),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Activity Selection",
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decorationColor: Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                    SelectableText(
                      "The greedy choice is to always pick the next activity whose finish time is least among the remaining activities and the start time is more than or equal to the finish time of previously selected activity. We can sort the activities according to their finishing time so that we always consider the next activity as minimum finishing time activity.\n\n1) Sort the activities according to their finishing time\n2) Select the first activity from the sorted array and print it.\n3) Do following for remaining activities in the sorted array.\n…….a) If the start time of this activity is greater than or equal to the finish time of previously selected activity then select this activity and print it.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    Image(
                      image: NetworkImage(
                        "https://www.studytonight.com/data-structures/images/activity-timeline.PNG",
                      ),
                      height: 300,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Program",
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decorationColor: Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                    SelectableText(
                      "#include <bits/stdc++.h>\nusing namespace std; \n#define N 6\t\t\n/* Structure represents an activity having start time and finish time.*/\nstruct Activity \n{ \n    int start, finish; \n}; \n\n/* This function is used for sorting activities according to finish time*/\nbool Sort_activity(Activity s1, Activity s2) \n{ \n    return (s1.finish< s2.finish); \n} \n\n/* \tPrints maximum number of activities that can\n\tbe done by a single person or single machine at a time. \n*/\nvoid print_Max_Activities(Activity arr[], int n) \n{ \n    // Sort activities according to finish time \n\tsort(arr, arr+n, Sort_activity);\n\tcout<< \"Following activities are selected \\n\"; \n    // Select the first activity\n    int i = 0; \n\tcout<< \"(\" <<arr[i].start<< \", \" <<arr[i].finish << \")\"; \n   /*Consider the remaining activities from 1 to n-1*/\n    for (int j = 1; j < n; j++) \n    { \n    \t/* Select this activity if it has start time greater than or equal*/\n    \t/* to the finish time of previously selected activity*/\n      \tif (arr[j].start>= arr[i].finish) \n      \t{\t \n\t\t\tcout<< \"(\" <<arr[j].start<< \", \"<<arr[j].finish << \") \\n\"; \n\t\t\ti = j; \n      \t} \n    } \n} \n \nint main() \n{ \n    Activity arr[N];\n\tfor(int i=0; i<=N-1; i++)\n\t{\n\t\tcout<<\"Enter the start and end time of \"<<i+1<<\" activity \\n\";\n\t\tcin>>arr[i].start>>arr[i].finish;\n    }\n\tprint_Max_Activities(arr, N); \n    return 0; \n}",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.indigo,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Complexity",
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decorationColor: Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                    SelectableText(
                      "Worst Case: O(nlogn)\n"
                          "Average Case: O(nlogn)\n"
                          "Best Case: O(nlogn)\n",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Card(
              color: Colors.greenAccent,
              elevation: 4,
              margin: EdgeInsets.all(24),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Huffman Coding",
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decorationColor: Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                    SelectableText(
                      "Steps to build Huffman Tree\nInput is an array of unique characters along with their frequency of occurrences and output is Huffman Tree.\n\n1. Create a leaf node for each unique character and build a min heap of all leaf nodes (Min Heap is used as a priority queue. The value of frequency field is used to compare two nodes in min heap. Initially, the least frequent character is at root)\n\n2. Extract two nodes with the minimum frequency from the min heap.\n\n3. Create a new internal node with a frequency equal to the sum of the two nodes frequencies. Make the first extracted node as its left child and the other extracted node as its right child. Add this node to the min heap.\n\n4. Repeat steps#2 and #3 until the heap contains only one node. The remaining node is the root node and the tree is complete.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    Image(
                      image: NetworkImage(
                        "https://www.geeksforgeeks.org/wp-content/uploads/fig-6.jpg",
                      ),
                      height: 200.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Program",
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decorationColor: Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                    SelectableText(
                      "#include <stdio.h> \n#include <stdlib.h> \n\n// This constant can be avoided by explicitly \n// calculating height of Huffman Tree \n#define MAX_TREE_HT 100 \n\n// A Huffman tree node \nstruct MinHeapNode { \n\n\t// One of the input characters \n\tchar data; \n\n\t// Frequency of the character \n\tunsigned freq; \n\n\t// Left and right child of this node \n\tstruct MinHeapNode *left, *right; \n}; \n\n// A Min Heap: Collection of \n// min-heap (or Huffman tree) nodes \nstruct MinHeap { \n\n\t// Current size of min heap \n\tunsigned size; \n\n\t// capacity of min heap \n\tunsigned capacity; \n\n\t// Array of minheap node pointers \n\tstruct MinHeapNode** array; \n}; \n\n// A utility function allocate a new \n// min heap node with given character \n// and frequency of the character \nstruct MinHeapNode* newNode(char data, unsigned freq) \n{ \n\tstruct MinHeapNode* temp \n\t\t= (struct MinHeapNode*)malloc\n(sizeof(struct MinHeapNode)); \n\n\ttemp->left = temp->right = NULL; \n\ttemp->data = data; \n\ttemp->freq = freq; \n\n\treturn temp; \n} \n\n// A utility function to create \n// a min heap of given capacity \nstruct MinHeap* createMinHeap(unsigned capacity) \n\n{ \n\n\tstruct MinHeap* minHeap \n\t\t= (struct MinHeap*)malloc(sizeof(struct MinHeap)); \n\n\t// current size is 0 \n\tminHeap->size = 0; \n\n\tminHeap->capacity = capacity; \n\n\tminHeap->array \n\t\t= (struct MinHeapNode**)malloc(minHeap-> \ncapacity * sizeof(struct MinHeapNode*)); \n\treturn minHeap; \n} \n\n// A utility function to \n// swap two min heap nodes \nvoid swapMinHeapNode(struct MinHeapNode** a, \n\t\t\t\t\tstruct MinHeapNode** b) \n\n{ \n\n\tstruct MinHeapNode* t = *a; \n\t*a = *b; \n\t*b = t; \n} \n\n// The standard minHeapify function. \nvoid minHeapify(struct MinHeap* minHeap, int idx) \n\n{ \n\n\tint smallest = idx; \n\tint left = 2 * idx + 1; \n\tint right = 2 * idx + 2; \n\n\tif (left < minHeap->size && minHeap->array[left]-> \nfreq < minHeap->array[smallest]->freq) \n\t\tsmallest = left; \n\n\tif (right < minHeap->size && minHeap->array[right]-> \nfreq < minHeap->array[smallest]->freq) \n\t\tsmallest = right; \n\n\tif (smallest != idx) { \n\t\tswapMinHeapNode(&minHeap->array[smallest], \n\t\t\t\t\t\t&minHeap->array[idx]); \n\t\tminHeapify(minHeap, smallest); \n\t} \n} \n\n// A utility function to check \n// if size of heap is 1 or not \nint isSizeOne(struct MinHeap* minHeap) \n{ \n\n\treturn (minHeap->size == 1); \n} \n\n// A standard function to extract \n// minimum value node from heap \nstruct MinHeapNode* extractMin(struct MinHeap* minHeap) \n\n{ \n\n\tstruct MinHeapNode* temp = minHeap->array[0]; \n\tminHeap->array[0] \n\t\t= minHeap->array[minHeap->size - 1]; \n\n\t--minHeap->size; \n\tminHeapify(minHeap, 0); \n\n\treturn temp; \n} \n\n// A utility function to insert \n// a new node to Min Heap \nvoid insertMinHeap(struct MinHeap* minHeap, \n\t\t\t\tstruct MinHeapNode* minHeapNode) \n\n{ \n\n\t++minHeap->size; \n\tint i = minHeap->size - 1; \n\n\twhile (i && minHeapNode->freq < minHeap->array[(i - 1) / 2]->freq) { \n\n\t\tminHeap->array[i] = minHeap->array[(i - 1) / 2]; \n\t\ti = (i - 1) / 2; \n\t} \n\n\tminHeap->array[i] = minHeapNode; \n} \n\n// A standard function to build min heap \nvoid buildMinHeap(struct MinHeap* minHeap) \n\n{ \n\n\tint n = minHeap->size - 1; \n\tint i; \n\n\tfor (i = (n - 1) / 2; i >= 0; --i) \n\t\tminHeapify(minHeap, i); \n} \n\n// A utility function to print an array of size n \nvoid printArr(int arr[], int n) \n{ \n\tint i; \n\tfor (i = 0; i < n; ++i) \n\t\tprintf(\"%d\", arr[i]); \n\n\tprintf(\"\\n\"); \n} \n\n// Utility function to check if this node is leaf \nint isLeaf(struct MinHeapNode* root) \n\n{ \n\n\treturn !(root->left) && !(root->right); \n} \n\n// Creates a min heap of capacity \n// equal to size and inserts all character of \n// data[] in min heap. Initially size of \n// min heap is equal to capacity \nstruct MinHeap* createAndBuildMinHeap(char data[], int freq[], int size) \n\n{ \n\n\tstruct MinHeap* minHeap = createMinHeap(size); \n\n\tfor (int i = 0; i < size; ++i) \n\t\tminHeap->array[i] = newNode(data[i], freq[i]); \n\n\tminHeap->size = size; \n\tbuildMinHeap(minHeap); \n\n\treturn minHeap; \n} \n\n// The main function that builds Huffman tree \nstruct MinHeapNode* buildHuffmanTree(char data[], int freq[], int size) \n\n{ \n\tstruct MinHeapNode *left, *right, *top; \n\n\t// Step 1: Create a min heap of capacity \n\t// equal to size. Initially, there are \n\t// modes equal to size. \n\tstruct MinHeap* minHeap = createAndBuildMinHeap(data, freq, size); \n\n\t// Iterate while size of heap doesn't become 1 \n\twhile (!isSizeOne(minHeap)) { \n\n\t\t// Step 2: Extract the two minimum \n\t\t// freq items from min heap \n\t\tleft = extractMin(minHeap); \n\t\tright = extractMin(minHeap); \n\n\t\t// Step 3: Create a new internal \n\t\t// node with frequency equal to the \n\t\t// sum of the two nodes frequencies. \n\t\t// Make the two extracted node as \n\t\t// left and right children of this new node. \n\t\t// Add this node to the min heap \n\t\t// 'X' is a special value for internal nodes, not used \n\t\ttop = newNode('X', left->freq + right->freq); \n\n\t\ttop->left = left; \n\t\ttop->right = right; \n\n\t\tinsertMinHeap(minHeap, top); \n\t} \n\n\t// Step 4: The remaining node is the \n\t// root node and the tree is complete. \n\treturn extractMin(minHeap); \n} \n\n// Prints huffman codes from the root of Huffman Tree. \n// It uses arr[] to store codes \nvoid printCodes(struct MinHeapNode* root, int arr[], int top) \n\n{ \n\n\t// Assign 0 to left edge and recur \n\tif (root->left) { \n\n\t\tarr[top] = 0; \n\t\tprintCodes(root->left, arr, top + 1); \n\t} \n\n\t// Assign 1 to right edge and recur \n\tif (root->right) { \n\n\t\tarr[top] = 1; \n\t\tprintCodes(root->right, arr, top + 1); \n\t} \n\n\t// If this is a leaf node, then \n\t// it contains one of the input \n\t// characters, print the character \n\t// and its code from arr[] \n\tif (isLeaf(root)) { \n\n\t\tprintf(\"%c: \", root->data); \n\t\tprintArr(arr, top); \n\t} \n} \n\n// The main function that builds a \n// Huffman Tree and print codes by traversing \n// the built Huffman Tree \nvoid HuffmanCodes(char data[], int freq[], int size) \n\n{ \n\t// Construct Huffman Tree \n\tstruct MinHeapNode* root \n\t\t= buildHuffmanTree(data, freq, size); \n\n\t// Print Huffman codes using \n\t// the Huffman tree built above \n\tint arr[MAX_TREE_HT], top = 0; \n\n\tprintCodes(root, arr, top); \n} \n\n// Driver program to test above functions \nint main() \n{ \n\n\tchar arr[] = { 'a', 'b', 'c', 'd', 'e', 'f' }; \n\tint freq[] = { 5, 9, 12, 13, 16, 45 }; \n\n\tint size = sizeof(arr) / sizeof(arr[0]); \n\n\tHuffmanCodes(arr, freq, size); \n\n\treturn 0; \n} \n",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.indigo,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Complexity",
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decorationColor: Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                    SelectableText(
                      "Best Case: O(nlogn)\n"
                          "Worst Case: O(nlogn)\n"
                          "Average Case: O(nlogn)\n",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}