import 'package:flutter/material.dart';

class DynamicProg extends StatefulWidget {
  @override
  _DynamicProgState createState() => _DynamicProgState();
}

class _DynamicProgState extends State<DynamicProg> {
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
          'Dynamic Programming Algorithms',
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
                          text: "Coin Change",
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
                      "1) Optimal Substructure\nTo count the total number of solutions, we can divide all set solutions into two sets.\n1) Solutions that do not contain mth coin (or Sm).\n2) Solutions that contain at least one Sm.\nLet count(S[], m, n) be the function to count the number of solutions, then it can be written as sum of count(S[], m-1, n) and count(S[], m, n-Sm).\nTherefore, the problem has optimal substructure property as the problem can be solved using solutions to subproblems.\n\n2) Overlapping Subproblems\nFollowing is a simple recursive implementation of the Coin Change problem. The implementation simply follows the recursive structure mentioned above.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: NetworkImage("https://www.codesdope.com/staticroot/images/algorithm/coin1.png"),height: 300,),
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
                    SelectableText("#include <stdio.h>\n#define MIN(x, y) (((x) < (y)) ? (x) : (y))\n\nconst int INF = 100000;\n\n/*k is number of denominations of the coin or length of d*/\nint coin_change(int d[], int n, int k) {\n  int M[n+1];\n  M[0] = 0;\n\n  int i, j;\n  for(j=1; j<=n; j++) {\n    int minimum = INF;\n\n    for(i=1; i<=k; i++) {\n      if(j >= d[i]) {\n        minimum = MIN(minimum, 1+M[j-d[i]]);\n      }\n    }\n    M[j] = minimum;\n  }\n  return M[n];\n}\n\nint main() {\n  /*array starting from 1, element at index 0 is fake*/\n  int d[] = {0, 1, 2, 3};\n  printf(\"%d\\n\", coin_change(d, 5, 3)); //to make 5. Number of denominations = 3\n  return 0;\n}",
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
                    SelectableText("Worst Case: O(n)\n"
                        "Average Case: O(n)\n"
                        "Best Case: O(n)\n"
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
                          text: "Longest Common Subsequence",
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
                      "1) Optimal Substructure:\nLet the input sequences be X[0..m-1] and Y[0..n-1] of lengths m and n respectively. And let L(X[0..m-1], Y[0..n-1]) be the length of LCS of the two sequences X and Y. Following is the recursive definition of L(X[0..m-1], Y[0..n-1]).\n\nIf last characters of both sequences match (or X[m-1] == Y[n-1]) then\nL(X[0..m-1], Y[0..n-1]) = 1 + L(X[0..m-2], Y[0..n-2])\n\nIf last characters of both sequences do not match (or X[m-1] != Y[n-1]) then\nL(X[0..m-1], Y[0..n-1]) = MAX ( L(X[0..m-2], Y[0..n-1]), L(X[0..m-1], Y[0..n-2]) )\n\nExamples:\n1) Consider the input strings “AGGTAB” and “GXTXAYB”. Last characters match for the strings. So length of LCS can be written as:\nL(“AGGTAB”, “GXTXAYB”) = 1 + L(“AGGTA”, “GXTXAY”)\n2) Consider the input strings “ABCDGH” and “AEDFHR. Last characters do not match for the strings. So length of LCS can be written as:\nL(“ABCDGH”, “AEDFHR”) = MAX ( L(“ABCDG”, “AEDFHR”), L(“ABCDGH”, “AEDFH”) )\n\nSo the LCS problem has optimal substructure property as the main problem can be solved using solutions to subproblems.\n\n2) Overlapping Subproblems:\nFollowing is simple recursive implementation of the LCS problem. The implementation simply follows the recursive structure mentioned above.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: NetworkImage("https://www.geeksforgeeks.org/wp-content/uploads/Longest-Common-Subsequence.png"),height: 200.0,),
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
                    SelectableText("public class LongestCommonSubsequence {\n\n\tpublic static int find(char[] A, char[] B) {\n\t\tint[][] LCS = new int[A.length + 1][B.length + 1];\n\t\tString[][] solution = new String[A.length + 1][B.length + 1];\n\t\t// if A is null then LCS of A, B =0\n\t\tfor (int i = 0; i <= B.length; i++) {\n\t\t\tLCS[0][i] = 0;\n\t\t\tsolution[0][i] = \"0\";\n\t\t}\n\n\t\t// if B is null then LCS of A, B =0\n\t\tfor (int i = 0; i <= A.length; i++) {\n\t\t\tLCS[i][0] = 0;\n\t\t\tsolution[i][0] = \"0\";\n\t\t}\n\n\t\tfor (int i = 1; i <= A.length; i++) {\n\t\t\tfor (int j = 1; j <= B.length; j++) {\n\t\t\t\tif (A[i - 1] == B[j - 1]) {\n\t\t\t\t\tLCS[i][j] = LCS[i - 1][j - 1] + 1;\n\t\t\t\t\tsolution[i][j] = \"diagonal\";\n\t\t\t\t} else {\n\t\t\t\t\tLCS[i][j] = Math.max(LCS[i - 1][j], LCS[i][j - 1]);\n\t\t\t\t\tif (LCS[i][j] == LCS[i - 1][j]) {\n\t\t\t\t\t\tsolution[i][j] = \"top\";\n\t\t\t\t\t} else {\n\t\t\t\t\t\tsolution[i][j] = \"left\";\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t}\n\t\t}\n\t\t// below code is to just print the result\n\t\tString x = solution[A.length][B.length];\n\t\tString answer = \"\";\n\t\tint a = A.length;\n\t\tint b = B.length;\n\t\twhile (x != \"0\") {\n\t\t\tif (solution[a][b] == \"diagonal\") {\n\t\t\t\tanswer = A[a - 1] + answer;\n\t\t\t\ta--;\n\t\t\t\tb--;\n\t\t\t} else if (solution[a][b] == \"left\") {\n\t\t\t\tb--;\n\t\t\t} else if (solution[a][b] == \"top\") {\n\t\t\t\ta--;\n\t\t\t}\n\t\t\tx = solution[a][b];\n\t\t}\n\t\tSystem.out.println(answer);\n\t\t\n\t\tfor (int i = 0; i <= A.length; i++) {\n\t\t\tfor (int j = 0; j <= B.length; j++) {\n\t\t\t\tSystem.out.print(\" \" + LCS[i][j]);\n\t\t\t}\n\t\t\tSystem.out.println();\n\t\t}\n\t\treturn LCS[A.length][B.length];\n\t}\n\n\tpublic static void main(String[] args) {\n\t\tString A = \"ACBDEA\";\n\t\tString B = \"ABCDA\";\n\t\tSystem.out.println(\"LCS :\" + find(A.toCharArray(), B.toCharArray()));\n\t}\n}",
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
                    SelectableText("Best Case: O(2n) \n"
                        "Worst Case: O(2n) \n"
                        "Average Case: O(2n) \n",
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
                          text: "Maximum sum Bitonic Sub-sequence",
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
                      "Begin\n   define incSubSeq of size same as the array size\n   initially fill all entries to 1 for incSubSeq\n\n   for i := 1 to size -1, do\n      for j := 0 to i-1, do\n         if array[i] > array[j] and incSubSeq[i] < incSubSum[j] + 1, then incSubSum[i] := incSubSum[j] + 1\n      done\n   done\n\n   define decSubSeq of size same as the array size.\n   initially fill all entries to 1 for incSubSeq\n\n   for i := size - 2 down to 0, do\n      for j := size - 1 down to i+1, do\n         if array[i] > array[j] and decSubSeq[i] < decSubSum[j] + 1, then decSubSeq [i] := decSubSeq [j] + 1\n      done\n   done\n\n   max := incSubSeq[0] + decSubSeq[0] – 1\n   for i := 1 to size, do\n      if incSubSeq[i] + decSubSeq[i] – 1 > max, then max := incSubSeq[i] + decSubSeq[i] – 1\n   done\n\n   return max\nEnd",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: NetworkImage("https://www.prodevelopertutorial.com/wp-content/uploads/2020/03/90_Longest_bitonic_sub_Sequence-min.png"),height: 200.0,),
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
                    SelectableText("#include <bits/stdc++.h> \nusing namespace std; \n  \n    /*Function return maximum sum of Bi-tonic sub-sequence*/\n    int MaxSum(int arr[], int n) \n    { \n    int max = INT_MIN; \n  \n    /* MSB[i]-: Maximum sum Increasing Bi-tonic*/\n    /*subsequence ending with arr[i]*/\n    /*MSD[i]-: Maximum sum Decreasing Bi-tonic*/\n    /*subsequence starting with arr[i] */\n    int MSB[n], MSD[n]; \n    for (int i = 0; i < n; i++)\n    { \n        MSB[i] = arr[i]; \n        MSD[i] = arr[i]; \n    } \n    /*Compute MSB values from left to right*/ \n    for (int i = 1; i < n; i++)\n    {\n        for (int j = 0; j < i; j++) \n        {       \n                if (arr[i] > arr[j] && MSB[i] < MSB[j] + arr[i]) \n           \n                MSB[i] = MSB[j] + arr[i];\n         }\n      }     \n  \n    /* Compute MSD values from right to left*/\n    for (int i = n - 2; i >= 0; i--) \n    {\n        for (int j = n - 1; j > i; j--)\n        {\n            if (arr[i] > arr[j] && MSD[i] < MSD[j] + arr[i]) \n            MSD[i] = MSD[j] + arr[i];\n        }\n     }\n  \n    /* Find the maximum value of MSB[i] + MSD[i] - arr[i]*/\n    for (int i = 0; i < n; i++)\n    {\n        max = max(max, (MSD[i] + MSB[i] - arr[i]));\n    }   \n       return max; \n    } \n    int main() \n    { \n    int A[] = {5, 10, 16, 45, 32, 100, 10, 16, 9 }; \n    int n = sizeof(A) / sizeof(A[0]); \n    cout << \"Maximum Sum Bitonic Subsequence : \" << MaxSum(A, n); \n    return 0; \n    }",
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
        ],
      ),
    );
  }
}