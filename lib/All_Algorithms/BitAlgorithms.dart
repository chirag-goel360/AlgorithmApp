import 'package:flutter/material.dart';

class BitAlgo extends StatefulWidget {
  @override
  _BitAlgoState createState() => _BitAlgoState();
}

class _BitAlgoState extends State<BitAlgo> {
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
          'Bitwise Algorithms',
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
                          text: "Russian Peasant",
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
                      "Let the two given numbers be 'a' and 'b'\n1) Initialize result 'res' as 0.\n2) Do following while 'b' is greater than 0\n   a) If 'b' is odd, add 'a' to 'res'\n   b) Double 'a' and halve 'b'\n3) Return 'res'.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: NetworkImage("https://media.geeksforgeeks.org/wp-content/uploads/schoolMultiply.jpg"),height: 300,),
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
                    SelectableText("#include <iostream>\nusing namespace std;\nunsigned int russianPeasant(unsigned int n, unsigned int m) {\n   int result = 0;\n   while (m > 0) {\n      if (m & 1)\n         result = result + n;\n         n = n << 1;\n         m = m >> 1;\n   }\n   return result;\n}\nint main() {\n   cout << russianPeasant(10, 20) << endl;\n   cout << russianPeasant(7, 6) << endl;\n   return 0;\n}",
                      style: TextStyle(
                          fontSize: 17.0,
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
                    SelectableText("Worst Case: Θ(logn)\n"
                        "Average Case: O(logn)\n"
                        "Best Case: O(logn)\n"
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
                          text: "Binary representation of a number is Palindrome",
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
                      "isPalindrome(x)\n1) Find number of bits in x using sizeof() operator.\n2) Initialize left and right positions as 1 and n respectively.\n3) Do following while left ‘l’ is smaller than right ‘r’.\n..…..a) If bit at position ‘l’ is not same as bit at position ‘r’, then return false.\n..…..b) Increment ‘l’ and decrement ‘r’, i.e., do l++ and r–-.\n4) If we reach here, it means we didn’t find a mismatching bit.\n\nTo find the bit at a given position, we can use the idea similar to this post. The expression “x & (1 << (k-1))” gives us non-zero value if bit at k’th position from right is set and gives a zero value if if k’th bit is not set.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: AssetImage("assets/palindrome.png"),height: 200.0,),
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
                    SelectableText("#include<iostream> \nusing namespace std;\nbool isKthBitSet(unsigned int x, unsigned int k) \n{ \n\treturn (x & (1 << (k - 1))) ? true : false; \n} \n\n// This function returns true if binary \n// representation of x is palindrome.\nbool isPalindrome(unsigned int x) \n{ \n\tint l = 1;\n\tint r = sizeof(unsigned int) * 8;\n\n\t// One by one compare bits \n\twhile (l < r) \n\t{ \n\t\tif (isKthBitSet(x, l) != isKthBitSet(x, r)) \n\t\t\treturn false; \n\t\tl++; r--; \n\t} \n\treturn true; \n} \n\n// Driver Code \nint main() \n{ \n\tunsigned int x = 1 << 15 + 1 << 16; \n\tcout << isPalindrome(x) << endl; \n\tx = 1 << 31 + 1; \n\tcout << isPalindrome(x) << endl; \n\treturn 0; \n} \n",
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
                    SelectableText("Best Case: O(x)\n"
                        "Worst Case: O(x)\n"
                        "Average Case: O(x)\n"
                        "where x is resultant number.",
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