import 'package:flutter/material.dart';
class StringMatch extends StatefulWidget {
  @override
  _StringMatchState createState() => _StringMatchState();
}

class _StringMatchState extends State<StringMatch> {
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
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          'String Matching Algorithms',
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
                          alignment: Alignment.topCenter,
                          child: RichText(
                            text: TextSpan(
                              text: "Naive String Algorithm",
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
                        new SelectableText("In computer science, string-searching algorithms, sometimes called string-matching algorithms, are an important class of string algorithms that try to find a place where one or several strings (also called patterns) are found within a larger string or text.A simple and inefficient way to see where one string occurs inside another is to check each place it could be, one by one, to see if it's there. So first we see if there's a copy of the needle in the first character of the haystack; if not, we look to see if there's a copy of the needle starting at the second character of the haystack; if not, we look starting at the third character, and so forth. In the normal case, we only have to look at one or two characters for each wrong position to see that it is a wrong position, so in the average case, this takes O(n + m) steps, where n is the length of the haystack and m is the length of the needle; but in the worst case, searching for a string like ''aaaab'' in a string like ''aaaaaaaaab'', it takes O(nm)",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),),
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
                        new SelectableText("// C++ program for Naive Pattern Searching algorithm\n#include <bits/stdc++.h>\nusing namespace std;\nvoid search(char* pat, char* txt){\nint M = strlen(pat);\nint N = strlen(txt);\nfor (int i = 0; i <= N - M; i++) {\nint j;\nfor (j = 0; j < M; j++)\nif (txt[i + j] != pat[j])\nbreak;\nif (j == M) \ncout << ''Pattern found at index ''<< i << endl;\n}\n}\nint main(){\nchar txt[] = ''AABAACAADAABAAABAA'';\nchar pat[] = ''AABA'';\nsearch(pat, txt);\nreturn 0;\n}", style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.indigo,
                        ),
                        ),
                      ]
                  )
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
                            text: "Rabin-Karp Algorithm",
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
                      new SelectableText("In computer science, the Rabin–Karp algorithm or Karp–Rabin algorithm is a string-searching algorithm created by Richard M. Karp and Michael O. Rabin (1987) that uses hashing to find an exact match of a pattern string in a text. It uses a rolling hash to quickly filter out positions of the text that cannot match the pattern, and then checks for a match at the remaining positions. Generalizations of the same idea can be used to find more than one match of a single pattern, or to find matches for more than one pattern.",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),),
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
                      new SelectableText("#include <bits/stdc++.h>\nusing namespace std;\n// d is the number of characters in the input alphabet\n#define d 256\nvoid search(char pat[], char txt[], int q){\nint M = strlen(pat);\nint N = strlen(txt);\nint i, j;\nint p = 0;\nint t = 0;\nint h = 1;\nfor (i = 0; i < M - 1; i++)\nh = (h * d) % q;\nfor (i = 0; i < M; i++){\np = (d * p + pat[i]) % q;\nt = (d * t + txt[i]) % q;\n}\nfor (i = 0; i <= N - M; i++){\nif ( p == t ){\nfor (j = 0; j < M; j++){\nif (txt[i+j] != pat[j])\nbreak;\n}\n// if p == t and pat[0...M-1] = txt[i, i+1, ...i+M-1]\nif (j == M)\ncout<<''Pattern found at index ''<< i<<endl;\n}\nif ( i < N-M ){\nt = (d*(t - txt[i]*h) + txt[i+M])%q;\nif (t < 0)\nt = (t + q);\n}\n}\n}\nint main(){\nchar txt[] = ''GEEKS FOR GEEK'';\nchar pat[] = ''GEEK'';\nint q = 101;\nsearch(pat, txt, q);\nreturn 0;\n}",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                )
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
                            text: "Knuth-Morris-Pratt Algorithm",
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
                      new SelectableText("In computer science, the Knuth–Morris–Pratt string-searching algorithm (or KMP algorithm) searches for occurrences of a ''word'' W within a main ''text string'' S by employing the observation that when a mismatch occurs, the word itself embodies sufficient information to determine where the next match could begin, thus bypassing re-examination of previously matched characters.",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),),
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
                      new SelectableText("// C++ program for implementation of KMP pattern searching\n#include <bits/stdc++.h>\nvoid computeLPSArray(char* pat, int M, int* lps);\nvoid KMPSearch(char* pat, char* txt){\nint M = strlen(pat);\nint N = strlen(txt);\nint lps[M];\ncomputeLPSArray(pat, M, lps);\nint i = 0; // index for txt[]\nint j = 0; // index for pat[]\nwhile (i < N) {\nif (pat[j] == txt[i]) {\nj++;\ni++;\n}\nif (j == M) {\nprintf(''Found pattern at index %d '', i - j);\nj = lps[j - 1];\n}\nelse if (i < N && pat[j] != txt[i]) {\nif (j != 0)\nj = lps[j - 1];\nelse\ni = i + 1;\n}\n}\n}\nvoid computeLPSArray(char* pat, int M, int* lps){\n// length of the previous longest prefix suffix\nint len = 0;\nlps[0] = 0;\nint i = 1;\nwhile (i < M) {\nif (pat[i] == pat[len]) {\nlen++;\nlps[i] = len;\ni++;\n}\nelse{\nif (len != 0) {\nlen = lps[len - 1];\n}\nelse{\nlps[i] = 0;\ni++;\n}\n}\n}\n}\nint main(){\nchar txt[] = ''ABABDABACDABABCABAB'';\nchar pat[] = ''ABABCABAB'';\nKMPSearch(pat, txt);\nreturn 0;\n}",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}