import 'package:flutter/material.dart';

class Sorting extends StatefulWidget {
  @override
  _SortingState createState() => _SortingState();
}

class _SortingState extends State<Sorting> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();
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
          'Sorting Algorithms',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arial'),//Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(actionIcon),
              onPressed: () {
                setState(() {
                  scrollDirection == Axis.horizontal
                      ? scrollDirection = Axis.vertical
                      : scrollDirection = Axis.horizontal;
                  actionIcon == Icons.swap_vert
                      ? actionIcon = Icons.swap_horiz
                      : actionIcon = Icons.swap_vert;
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: scrollDirection==Axis.horizontal
                          ? Text("Scroll Direction changed to Horizontal")
                          :Text("Scroll Direction changed to Vertical"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                });
                controller.position.applyViewportDimension(
                    scrollDirection == Axis.vertical
                        ? _screenSize.height
                        : _screenSize.width);
              }),
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
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Bubble Sort",
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
                      "Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in wrong order."
                      "Example:\n"
                          "First Pass:\n"
                          "( 5 1 4 2 8 ) –> ( 1 5 4 2 8 ), Here, algorithm compares the first two elements, and swaps since 5 > 1.\n"
                          "( 1 5 4 2 8 ) –>  ( 1 4 5 2 8 ), Swap since 5 > 4\n"
                          "( 1 4 5 2 8 ) –>  ( 1 4 2 5 8 ), Swap since 5 > 2\n"
                          "( 1 4 2 5 8 ) –> ( 1 4 2 5 8 ), Now, since these elements are already in order (8 > 5), algorithm does not swap them\n"
                          "Second Pass:\n"
                          "( 1 4 2 5 8 ) –> ( 1 4 2 5 8 )\n"
                          "( 1 4 2 5 8 ) –> ( 1 2 4 5 8 ), Swap since 4 > 2\n"
                          "( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )\n"
                          "( 1 2 4 5 8 ) –>  ( 1 2 4 5 8 )\n"
                          "Now, the array is already sorted, but our algorithm does not know if it is completed. The algorithm needs one whole pass without any swap to know it is sorted.\n"
                          "Third Pass:\n"
                          "( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )\n"
                          "( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )\n"
                          "( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )\n"
                          "( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )\n",
                      style: TextStyle(
                          color: Colors.black,
                        fontSize: 15.0
                      ),
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
                    SelectableText("\nvoid swap(int *xp, int *yp){ \n\t int temp = *xp;\n\t*xp = *yp; \n\t*yp = temp; \n}\nvoid bubbleSort(int arr[], int n) {"
                        "\n\tint i, j; \n\tfor(i = 0; i < n-1; i++){ \n\t\t for(j = 0; j < n-i-1; j++){ \n\t\t\t\tif(arr[j] > arr[j+1]){\n\t\t\t\t\t swap(&arr[j], &arr[j+1]);"
                        "\n\t\t\t}\n\t\t}\n}"
                        ,style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.indigo
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
                    SelectableText("Worst Case: O(n^2)\n"
                        "Average Case: O(n^2)\n"
                        "Best Case: O(n^2)\n"
                      ,style: TextStyle(fontSize: 25.0),)
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
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Insertion Sort",
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
                      "Insertion sort is a simple sorting algorithm that works the way we sort playing cards in our hands.\n",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: AssetImage("assets/insertionsort.png"),),
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
                    SelectableText("void insertionSort(int arr[], int n){\n"
                        "\t int i, key, j;\n"
                        "\t for (i = 1; i < n; i++){\n "
                        "\t\t key = arr[i];\n"
                        "\t\t j = i - 1; \n while (j >= 0 && arr[j] > key){\n\t\t arr[j + 1] = arr[j];\n\t\t j = j - 1;\n\t\t} "
                        "\n arr[j + 1] = key;  \n\t }\n}",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.indigo
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
                    SelectableText("Best Case: O(n)\n"
                      "Worst Case: O(n^2)\n"
                        "Average Case: O(n^2)\n",
                      style: TextStyle(fontSize: 25.0),)
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
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Selection Sort",
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
                      "The selection sort algorithm sorts an array by repeatedly finding the minimum element (considering ascending order) from unsorted part and putting it at the beginning. The algorithm maintains two subarrays in a given array."
                        "\n1) The subarray which is already sorted."
                        "\n2) Remaining subarray which is unsorted."
                        "\nIn every iteration of selection sort, the minimum element (considering ascending order) from the unsorted subarray is picked and moved to the sorted subarray.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
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
                    SelectableText("\nvoid swap(int *xp, int *yp){ \n\t int temp = *xp;\n\t*xp = *yp; \n\t*yp = temp; \n}\n"
                        "void selectionSort(int arr[], int n){\n  "
                        "\t int i, j, min_idx;\n"
                        "\t for (i = 0; i < n-1; i++){\n"
                  "\t\t min_idx = i;\n"
                  "\t\t for (j = i+1; j < n; j++)\n"
                "\t\t\t if (arr[j] < arr[min_idx])\n"
              "\t\t\t min_idx = j;"
          "\t\t\tswap(&arr[min_idx], &arr[i]);\n\t}\n}",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.indigo
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
                    SelectableText("Worst Case: O(n^2)\n"
                        "Average Case: O(n^2)\n"
                        "Best Case: O(n^2)\n",
                      style: TextStyle(fontSize: 25.0),)
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
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "QuickSort",
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
                      "Like Merge Sort, QuickSort is a Divide and Conquer algorithm. It picks an element as pivot and partitions the given array around the picked pivot. There are many different versions of quickSort that pick pivot in different ways."
                        "\n1.Always pick first element as pivot."
                    "\n2.Always pick last element as pivot (implemented below)"
                  "\n3.Pick a random element as pivot."
              "\n4.Pick median as pivot.\n"
                  "The key process in quickSort is partition(). Target of partitions is, given an array and an element x of array as pivot, put x at its correct position in sorted array and put all smaller elements (smaller than x) before x, and put all greater elements (greater than x) after x. All this should be done in linear time.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: AssetImage("assets/QuickSort.png"),),
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
                    SelectableText("\nvoid swap(int *xp, int *yp){ \n\t int temp = *xp;\n\t*xp = *yp; \n\t*yp = temp; \n}\n"
                        "int partition (int arr[], int low, int high){\n"
                        "\tint pivot = arr[high];\n"
                        "int i = (low - 1); // Index of smaller element\n"
                         "\tfor (int j = low; j <= high - 1; j++){\n"
                        "\t\tif (arr[j] < pivot){\n"
                        "\t\t\t i++;\n"
                        "\t\t\t\tswap(&arr[i], &arr[j]);\n\t\t}\n\t}"
              "\tswap(&arr[i + 1], &arr[high]);\n "
              "\t return (i + 1);}\n",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.indigo
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
                    SelectableText("Worst Case: O(n^2)\n"
                        "Average Case: O(nlog(n))\n"
                        "Best Case: O(nlog(n))\n",
                      style: TextStyle(fontSize: 25.0),)
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
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Merge Sort",
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
                      "Like QuickSort, Merge Sort is a Divide and Conquer algorithm. It divides input array in two halves, calls itself for the two halves and then merges the two sorted halves. The merge() function is used for merging two halves. The merge(arr, l, m, r) is key process that assumes that arr[l..m] and arr[m+1..r] are sorted and merges the two sorted sub-arrays into one. \n",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: AssetImage("assets/mergesort.JPG"),),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Algorithm",
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
                    Image(image: AssetImage("assets/mergeAlgo.JPG"),),
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
                    SelectableText("MERGE-SORT(A, p, r)\n"
                        "1 if p < r\n"
                        "2 q = (p + r)/2\n"
                        "3 MERGE-SORT(A, p, q)\n"
                        "4 MERGE-SORT(A, q+1, r)\n"
                        "5 MERGE(A,p,q,r)\n"
                        "\nMERGE(A, p, q, r)\n"
                        "6 n1 = q − p + 1"
                        "7 n2 = r − q\n"
                        "8 Let L[1..n1] and R[1..n2] be new arrays\n"
                        "9 for i = 1 to n1\n"
                        "10 L[i] = A[p + i − 1]\n"
                        "11 for j = 1 to n2\n"
                        "12 R[j] = A[q + j]\n"
                        "13 i = 1\n"
                        "14 j = 1\n"
                        "15 for k = p to r\n"
                        "16 if L[i] ≤ R[j]\n"
                        "17 A[k] = L[i]\n"
                        "18 i = i + 1\n"
                        "19 else\n"
                        "20 A[k] = R[j]\n"
                        "21 j = j + 1\n",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.indigo
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
                    SelectableText("Worst Case: O(nlog(n))\n"
                        "Average Case: O(nlog(n))\n"
                        "Best Case: O(nlog(n))\n",
                      style: TextStyle(fontSize: 25.0),)
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