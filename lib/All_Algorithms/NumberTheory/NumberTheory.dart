import 'package:flutter/material.dart';

class NumberTheory extends StatefulWidget {
  @override
  _NumberTheoryState createState() => _NumberTheoryState();
}

class _NumberTheoryState extends State<NumberTheory> {
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
          'Number Theory Algorithms',
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
                          text: "LCM of two numbers",
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
                      "1.Understand the GCD.\n2.If we subtract smaller number from larger (we reduce larger number), GCD doesn’t change. So if we keep subtracting repeatedly the larger of two, we end up with GCD.\n3.Now instead of subtraction, if we divide smaller number, the algorithm stops when we find remainder 0.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: NetworkImage("https://secureservercdn.net/160.153.138.219/b79.d22.myftpupload.com/wp-content/uploads/2015/06/LCM.png"),height: 300,),
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
                    SelectableText("#include <iostream> \nusing namespace std; \n// Recursive function to return gcd of a and b \nclass gfg \n{ \npublic : int gcd(int a, int b){ \n\tif (a == 0) \n\t\treturn b; \n\treturn gcd(b % a, a); \n} \n\n// Function to return LCM of two numbers \nint lcm(int a, int b) \n{ \n\treturn (a*b)/gcd(a, b); \n} \n} ; \n// Driver program to test above function \nint main() \n{ \n\tgfg g; \n\tint a = 15, b = 20; \n\tcout<<\"LCM of \"<<a<<\" and \"<<b<<\" is \"<<g.lcm(a, b); \n\treturn 0; \n} \n",
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
                    SelectableText("Worst Case: O(Log min(a, b))\n"
                        "Average Case: O(Log min(a, b))\n"
                        "Best Case: O(Log min(a, b))\n"
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
                          text: "nth Catalan Number",
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
                      "1) Count the number of expressions containing n pairs of parentheses which are correctly matched. For n = 3, possible expressions are ((())), ()(()), ()()(), (())(), (()()).\n\n2) Count the number of possible Binary Search Trees with n key\n\n3) Count the number of full binary trees (A rooted binary tree is full if every vertex has either two children or no children) with n+1 leaves.\n\n4) Given a number n, return the number of ways you can draw n chords in a circle with 2 x n points such that no 2 chords intersect.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: NetworkImage("https://raw.githubusercontent.com/sumitc91/data/master/askgif-blog/2ed2105f-3361-4721-9bdc-473619371a14_catalan-numbers.jpg"),height: 200.0,),
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
                    SelectableText("#include<iostream> \nusing namespace std; \n\n/* A dynamic programming based function to find nth*/\n// Catalan number \nunsigned long int catalanDP(unsigned int n) \n{ \n\t\tunsigned long int catalan[n+1]; \n\n\t/* Initialize first two values in table */\n\tcatalan[0] = catalan[1] = 1; \n\n\t/*Fill entries in catalan[] using recursive formula*/\n\tfor (int i=2; i<=n; i++) \n\t{ \n\t\tcatalan[i] = 0; \n\t\tfor (int j=0; j<i; j++) \n\t\t\tcatalan[i] += catalan[j] * catalan[i-j-1]; \n\t} \n\n\t// Return last entry \n\treturn catalan[n]; \n} \n\nint main() \n{ \n\tfor (int i = 0; i < 10; i++) \n\t\tcout << catalanDP(i) << \" \"; \n\treturn 0; \n} \n",
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
                    SelectableText("Best Case: O(n^2)\n"
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
                          text: "Sieve of Eratosthenes",
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
                      "1.Create a list of consecutive integers from 2 to n: (2, 3, 4, …, n).\n2.Initially, let p equal 2, the first prime number.\n3.Starting from p2, count up in increments of p and mark each of these numbers greater than or equal to p2 itself in the list. These numbers will be p(p+1), p(p+2), p(p+3), etc..\n4.Find the first number greater than p in the list that is not marked. If there was no such number, stop. Otherwise, let p now equal this number (which is the next prime), and repeat from step 3.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: NetworkImage("https://media.geeksforgeeks.org/wp-content/uploads/SieveofEratosthenes5.jpg"),height: 200.0,),
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
                    SelectableText("#include <bits/stdc++.h> \nusing namespace std; \n\nvoid SieveOfEratosthenes(int n) \n{ \n\t/* Create a boolean array \"prime[0..n]\" and initialize*/\n\t/* all entries it as true. A value in prime[i] will*/\n\t/*finally be false if i is Not a prime, else true*/ \n\tbool prime[n+1]; \n\tmemset(prime, true, sizeof(prime)); \n\n\tfor (int p=2; p*p<=n; p++) \n\t{ \n\t\t/*If prime[p] is not changed, then it is a prime*/\n\t\tif (prime[p] == true) \n\t\t{ \n\t\t\t/*Update all multiples of p greater than or equal to the square of it*/\n\t\t\tfor (int i=p*p; i<=n; i += p) \n\t\t\t\tprime[i] = false; \n\t\t} \n\t} \n\n\t// Print all prime numbers \n\tfor (int p=2; p<=n; p++) \n\tif (prime[p]) \n\t\tcout << p << \" \"; \n} \n\nint main() \n{ \n\tint n = 30; \n\tcout << \"Following are the prime numbers smaller \"\n\t\t<< \" than or equal to \" << n << endl; \n\tSieveOfEratosthenes(n); \n\treturn 0; \n} \n",
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
                    SelectableText("Worst Case: O(n*log(log(n)))\n"
                        "Average Case: O(n*log(log(n)))\n"
                        "Best Case: O(n*log(log(n)))\n",
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