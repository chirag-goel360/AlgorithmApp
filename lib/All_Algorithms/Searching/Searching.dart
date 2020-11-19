import 'package:flutter/material.dart';

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
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
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          'Searching Algorithms',
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
                          text: "Linear Search",
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
                      "In computer science, a linear search or sequential search is a method for finding an element within a list. It sequentially checks each element of the list until a match is found or the whole list has been searched. A linear search runs in at worst linear time and makes at most n comparisons, where n is the length of the list. If each element is equally likely to be searched, then linear search has an average case of n/2 comparisons, but the average case can be affected if the search probabilities for each element vary. Linear search is rarely practical because other search algorithms and schemes, such as the binary search algorithm and hash tables, allow significantly faster searching for all but short lists\n",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    Image(
                      image: AssetImage(
                        "assets/LinearSearch.png",
                      ),
                      height: 150.0,
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
                      "#include<iostream.h>\n#include<conio.h>\nvoid main(){\nclrscr();\nint arr[10], i, num, n, c=0, pos;\ncout<<''Enter the array size : '';\ncin>>n;\ncout<<''Enter Array Elements : '';\nfor(i=0; i<n; i++){\ncin>>arr[i];\n}\ncout<<''Enter the number to be search : '';\ncin>>num;\nfor(i=0; i<n; i++){\nif(arr[i]==num){\nc=1;\npos=i+1;\nbreak;\n}\n}\nif(c==0){\ncout<<''Number not found..!!'';\n}\nelse{\ncout<<num<<'' found at position ''<<pos;\n}\ngetch();\n}",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.indigo,
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
                          text: "Binary Search",
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
                    Text(
                      "Search a sorted array by repeatedly dividing the search interval in half. Begin with an interval covering the whole array. If the value of the search key is less than the item in the middle of the interval, narrow the interval to the lower half. Otherwise narrow it to the upper half. Repeatedly check until the value is found or the interval is empty.\n",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    Image(
                      image: AssetImage(
                        "assets/BinarySearch.png",
                      ),
                      height: 220.0,
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
                    Text(
                      "#include <cstdlib>\n#include <iostream>\nusing namespace std;\nint binary_search(int array[],int first,int last, int value);\nint main() {\nint list[10];\nfor (int k=0; k<11; k++)\nlist[k]=2*k+1;\ncout<<''binary search results:''<< binary_search(list,1,21,11)<<endl;\nreturn 0;\n}\nint binary_search(int array[],int first,int last, int search_key){\nint index;\nif (first > last)\nindex = -1;\nelse{\nint mid = (first + last)/2;\nif (search_key == array[mid])\nindex = mid;\nelse if (search_key < array[mid])\nindex = binary_search(array,first, mid-1, search_key);\nelse\nindex = binary_search(array, mid+1, last, search_key);\n}\nreturn index;\n}",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.indigo,
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