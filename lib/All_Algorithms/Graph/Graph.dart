import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
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
          'Graph Algorithms',
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
                          text: "Floyd Warshall",
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
                      "1. The algorithm find the shortest route between all"
                          "nodes/vertices of the non-negative directed weighted graph G."
                          "\n2. Suppose V is set of n nodes/vertices in graph G i.e."
                          "{1, 2, . . . , n} ∈ V"
                          "\n3. E is the set of edges of the graph G .i.e (i, j) ∈ E if there is a"
                          "edge from i to j in the graph"
                          "\n4. So we can say G = (V, E)"
                          "\n5. wij is the weight of the edge from vertex i to j."
                          "\n6. if p is a path from vertex vi to vj through vertices"
                          "v1, v2, . . . , vl then the nodes other than source and destination"
                          "is known as intermediate nodes."
                          "\n7. Sum of weight of the edges of the path p is the distance dij"
                          "between vertex vi to vj"
                          "\n8. if this distance is the shortest among all possible paths from vi"
                          "to vj then it is called the shortest path δ(i, j)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    Image(
                      image: AssetImage(
                        "assets/floyd.JPG",
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
                      "void floydWarshall (int graph[][V])\n{"
                          "\n\tint dist[V][V], i, j, k; \n"
                          "\t\tfor (i = 0; i < V; i++)"
                          "\n\t\t\t\t for (j = 0; j < V; j++)\n"
                          "\t\t\t\t\t\t dist[i][j] = graph[i][j];\n"
                          "\t\tfor (k = 0; k < V; k++){"
                          "\n\t\t\t\t for (j = 0; j < V; j++)\n"
                          "\t\t\t\t\t\t if(dist[i][k] +dist[k][j]<dist[i][j])\n"
                          "\t\t\t\t\t\t\t dist[i][j] =dist[i][k]<dist[k][j]\n\t\t\t\t}\n \t\t}\n"
                          "\tprintSolution(dist);\n}\n"
                          "\nvoid printSolution(int dist[][V]){"
                          "\n\t\tcout<<'The following matrix shows the shortest distances'"
                          " between every pair of vertices; "
                          "\n\t\tfor (int i = 0; i < V; i++){"
                          "\n\t\t\t\tfor (int j = 0; j < V; j++){"
                          "\n\t\t\t\t\t\tif (dist[i][j] == INF)"
                          "\n\t\t\t\t\t\t\t\t cout<<'INF'<<'     ';"
                          "\n\t\t\t\t\t\t else"
                          "\n\t\t\t\t\t\t\t\tcout<<dist[i][j]<<'     ';"
                          "\n\t\t\t\t}"
                          "\n\t\t\t\t\cout<<endl;"
                          "\n\t\t}\n}",
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
                      "Worst Case: O(V^3)\n"
                          "Average Case: O(V^3)\n"
                          "Best Case: O(V^3)\n",
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
                          text: "Kruskal's Algorithm",
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
                      "\n1) Kruskal’s algorithm uses the least weight edge to connect the"
                          "two tree to make one."
                          "\n2) Kruskal’s algorithm qualifies as a greedy algorithm because at"
                          "each step it adds to the forest an edge of least possible weight"
                          "\n3) It uses a disjoint-set data structure to maintain several"
                          "disjoint sets of elements"
                          "\n4) The operation FIND − SET(u) returns address of the"
                          "representative element from the set that contains u"
                          "\n5) We check FIND − SET(u) and FIND − SET(v) for any edge"
                          "(u, v). If they return the same address then it means the are"
                          "already connected."
                          "\n6) If FIND − SET(u) and FIND − SET(v) returns different value"
                          "that it means they are the members of two different tree and"
                          "using UNION(u, v) we make one tree connected by edge"
                          "(u, v)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    Image(
                      image: AssetImage(
                        "assets/kruskal.png",
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
                      "MST-KRUSKAL(G,w)"
                          "\n1. A = ∅"
                          "\n2. for each vertex v ∈ V"
                          "\n3. MAKE − SET(v)"
                          "\n4. sort the edges of E into nondecreasing order by weight w"
                          "\n5. for each edge (u, v) ∈ E taken in nondecreasing order by weight"
                          "\n6. if FIND − SET(u) 6= FIND − SET(v)"
                          "\n7. A ∪ {(u, v)}"
                          "\n8. UNION(u, v)"
                          "\n9. return A",
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
                      "Best Case: O(Elog(V))\n"
                          "Worst Case: O(Elog(V))\n"
                          "Average Case: O(Elog(V))\n",
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
                          text: "Prim's Algorithm",
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
                      "1. Prim’s algorithm has the property that the edges in the set A"
                          "always form a single tree unlike Kruskal."
                          "\n2.I We starts taking any node r as root and grows till the tree"
                          "spans all the vertices in V"
                          "\n3. In each step a new minimum edge vertex is added into A"
                          "\n4. The algorithm uses greediness, as each step it adds to the tree"
                          "an edge that contributes the minimum weight to the tree."
                          "\n5. We use min-priority queue Q based on key to store all vertices"
                          "that are not the part of the MST till now."
                          "\n6. For each vertex v, the value key[v] will be the minimum"
                          "weight of the edge connected v with all other nodes of the"
                          "graph."
                          "\n7. I if any node is not connected with node v then key[v] = ∞"
                          "\n 8. key[r] = 0 as r is the root of the tree"
                          "\n9. As we are expending tree by taking the node with minimum"
                          "weight edge at every step so the tree will be MST at every step."
                          "\n10. π[v] is the predecessor of v. For example if (u, v) is the edge"
                          "of the tree then π[v] = u"
                          "\n11. adj[u] = v if there is an edge from u to v that is (u, v)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    Image(
                      image: AssetImage(
                        "assets/prim.png",
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
                      "MST-PRIM(G,w,r)"
                          "\n1. A = ∅"
                          "\n2. Q = ∅"
                          "\n3. for each u ∈ V"
                          "\n4. key[u] = ∞"
                          "\n5. π[u] = NIL"
                          "\n6. Insert(Q, u)"
                          "\n7. key[r] = 0"
                          "\n8. while Q != ∅"
                          "\n9. u = Extract(Q)"
                          "\n10. for each v ∈ adj[u]"
                          "\n11. if v ∈ Q and w(u, v) < key[v]"
                          "\n12. π[v] = u"
                          "\n13. key[v] = w(u, v)"
                          "\n14. A ∪ {(u, v)}"
                          "\n15. return",
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
                      "Worst Case: O(Elog(V))\n"
                          "Average Case: O(Elog(V))\n"
                          "Best Case: O(Elog(V))\n",
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
                          text: "Djikstra's Algorithm",
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
                      "1. It is used to find single-source shortest-paths problem on a"
                          " non-negative weighted,directed graph"
                          "\n2. S is the set of vertices whose final shortest-path weights from"
                          " the source s have already been determined"
                          "\n3. The algorithm repeatedly selects the vertex u ∈ V − S with"
                          " the minimum shortest-path estimate"
                          "\n4. Adds u to S, and relaxes all edges leaving u."
                          "\n5. We use a min-priority queue Q of vertices based on their d"
                          " values",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    Image(
                      image: AssetImage(
                        "assets/dijkstra.jpg",
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
                    SelectableText(
                      "Algorithm: DIJKSTRA(G,w,s)"
                          "\n1. INITIALIZE-SINGLE-SOURCE(G,s)"
                          "\n2. S = ∅"
                          "\n3. Q = V"
                          "\n4. while Q != ∅"
                          "\n5. u =EXTRACT-MIN(Q)"
                          "\n6. S = S ∪ {u}"
                          "\n7. for each vertex v ∈ adj[u]"
                          "\n8. RELAX(u, v,w)",
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
                      "Worst Case: O(Elog(V))\n"
                          "Average Case: O(Elog(V))\n"
                          "Best Case: O(Elog(V))\n",
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
                          text: "Bellman Ford Algorithm",
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
                      "1. A graph with |V| vertices can have maximum |V| − 1 edges"
                          " and |V| vertices in any simple path."
                          "\n2. If number of edges in the path is greater than |V| − 1 or"
                          " vertices on the path is greater than |V| including source and"
                          " destination then there is cycle in path."
                          "\n3. Bellman works upon this fundamental and relaxes all edges"
                          " |V| − 1 times to find the shortest path from single source."
                          "\n4. After |V| − 1 passes, there will be shortest path among nodes"
                          " form source s, if exists."
                          "\n5. One more cycle of relax, if decrease the shortest path from"
                          " source then it means there will be |V| edges and |V| + 1"
                          " vertices and hence a negative weight cycle."
                          "\n6. The algorithm returns either TRUE if there is no negative"
                          " weight cycle or FALSE if negative weight cycle",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    Image(
                      image: AssetImage(
                        "assets/bellman.jpg",
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
                    SelectableText(
                      "BELLMAN-FORD(G,w,s)"
                          "\n1. INITIALIZE-SINGLE-SOURCE(G,s)"
                          "\n2. for i = 1 to |V| − 1"
                          "\n3. for each edge (u, v) ∈ E"
                          "\n4. RELAX(u, v,w)"
                          "\n5. for each edge (u, v) ∈ E"
                          "\n6. if d[v] > d[u] + w(u, v)"
                          "\n7. return FALSE"
                          "\n8. return TRUE",
                      style: TextStyle(
                        fontSize: 18.0,
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
                      "Worst Case: O(VE)\n"
                          "Average Case: O(VE)\n"
                          "Best Case: O(VE)\n",
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