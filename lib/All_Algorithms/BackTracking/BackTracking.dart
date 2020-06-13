import 'package:flutter/material.dart';

class BackTracking extends StatefulWidget {
  @override
  _BackTrackingState createState() => _BackTrackingState();
}

class _BackTrackingState extends State<BackTracking> {
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
          'BackTracking Algorithms',
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
                          text: "The Knight’s tour",
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
                      "1. Create a solution matrix of the same structure as chessboard.\n"
                          "2. Start from 0,0 and index = 0. (index will represent the no of cells has been covered by the knight)\n"
                          "3. Check current cell is not already used if not then mark that cell (start with 0 and keep incrementing it, it will show us the path for the knight)\n"
                          "4. Check if index = N*N-1, means Knight has covered all the cells. return true and print the solution matrix.\n"
                          "5. Now try to solve rest of the problem recursively by making index +1. Check all 8 directions. (Knight can move to 8 cells from its current position.) Check the boundary conditions as well.\n"
                          "6. If none of the 8 recursive calls return true, BACKTRACK and undo the changes ( put 0 to corresponding cell in solution matrix) and return false.\n"
                      ,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: AssetImage("assets/8moveKnight.png"),height: 300,),
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
                    SelectableText("#include <iostream>\n#include <iomanip>\n#define N 8\n\nusing namespace std;\nint sol[N][N];\n\nbool isValid(int x, int y, int sol[N][N]) {     \n/*check place is in range and not assigned yet*/\n   return ( x >= 0 && x < N && y >= 0 && y < N && sol[x][y] == -1);\n}\n\nvoid displaySolution() {\n   for (int x = 0; x < N; x++) {\n      for (int y = 0; y < N; y++)\n         cout << setw(3) << sol[x][y] << \" \";\n      cout << endl;\n   }\n}\n\nint knightTour(int x, int y, int move, int sol[N][N], int xMove[N], int yMove[N]) {\n   int xNext, yNext;\n   if (move == N*N)\n      return true;\n   for (int k = 0; k < 8; k++) {\n      xNext = x + xMove[k];\n      yNext = y + yMove[k];\n      if (isValid(xNext, yNext, sol)) {     \n         /*check room is preoccupied or not*/\n         sol[xNext][yNext] = move;\n         if (knightTour(xNext, yNext, move+1, sol, xMove, yMove) == true)\n            return true;\n         else\n            sol[xNext][yNext] = -1;\n      }\n   }\n   return false;\n}\n\nbool findKnightTourSol() {\n   for (int x = 0; x < N; x++)    \n /*initially set all values to -1 of solution matrix*/\n      for (int y = 0; y < N; y++)\n         sol[x][y] = -1;\n   //all possible moves for knight\n   int xMove[8] = {  2, 1, -1, -2, -2, -1,  1,  2 };\n   int yMove[8] = {  1, 2,  2,  1, -1, -2, -2, -1 };\n   sol[0][0]  = 0;   \n\n   if (knightTour(0, 0, 1, sol, xMove, yMove) == false) {\n      cout << \"Solution does not exist\";\n      return false;\n   } else\n      displaySolution();\n   return true;\n}\n\nint main() {\n   findKnightTourSol();\n}",
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
                    SelectableText("Worst Case: O(n!)\n"
                        "Average Case: O(n!)\n"
                        "Best Case: O(n!)\n"
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
                          text: "Rat in a Maze",
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
                      "1.Create a solution matrix, initially filled with 0’s.\n2.Create a recursive funtion, which takes initial matrix, output matrix and position of rat (i, j).\n3.if the position is out of the matrix or the position is not valid then return.\n4.Mark the position output[i][j] as 1 and check if the current position is destination or not. If destination is reached print the output matrix and return.\n5.Recursively call for position (i+1, j) and (i, j+1).\n6.Unmark position (i, j), i.e output[i][j] = 0.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: NetworkImage("https://www.geeksforgeeks.org/wp-content/uploads/ratinmaze_filled_path1.png"),height: 200.0,),
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
                    SelectableText("#include <stdio.h>\n#define SIZE 5\n\n//the maze problem\nint maze[SIZE][SIZE] = {\n    {0,1,0,1,1},\n    {0,0,0,0,0},\n    {1,0,1,0,1},\n    {0,0,1,0,0},\n    {1,0,0,1,0}\n};\n\n//matrix to store the solution\nint solution[SIZE][SIZE];\n\n//function to print the solution matrix\nvoid printsolution()\n{\n    int i,j;\n    for(i=0;i<SIZE;i++)\n    {\n        for(j=0;j<SIZE;j++)\n        {\n            printf(\"%d\\t\",solution[i][j]);\n        }\n        printf(\"\\n\\n\");\n    }\n}\n\n//function to solve the maze\n//using backtracking\nint solvemaze(int r, int c)\n{\n    /*if destination is reached, maze is solved*/\n    if((r==SIZE-1) && (c==SIZE-1))\n    {\n        solution[r][c] = 1;\n        return 1;\n    }\n    /*checking if we can visit in this cell or not*/\n    /*and solution[r][c] == 0 is making sure that the cell is not already visited*/\n    /*maze[r][c] == 0 is making sure that the cell is not blocked*/\n    if(r>=0 && c>=0 && r<SIZE && c<SIZE && solution[r][c] == 0 && maze[r][c] == 0)\n    {\n        //if safe to visit then visit the cell\n        solution[r][c] = 1;\n        //going down\n        if(solvemaze(r+1, c))\n            return 1;\n        //going right\n        if(solvemaze(r, c+1))\n            return 1;\n        //going up\n        if(solvemaze(r-1, c))\n            return 1;\n        //going left\n        if(solvemaze(r, c-1))\n            return 1;\n        //backtracking\n        solution[r][c] = 0;\n        return 0;\n    }\n    return 0;\n}\n\nint main()\n{\n    int i,j;\n    for(i=0; i<SIZE; i++)\n    {\n        for(j=0; j<SIZE; j++)\n        {\n            solution[i][j] = 0;\n        }\n    }\n    if (solvemaze(0,0))\n        printsolution();\n    else\n        printf(\"No solution\\n\");\n    return 0;\n}",
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
                    SelectableText("Best Case: O(2^(n^2))\n"
                        "Worst Case: O(2^(n^2))\n"
                        "Average Case: O(2^(n^2))\n",
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
                          text: "N Queen Problem",
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
                      "1) Start in the leftmost column\n2) If all queens are placed\n    return true\n3) Try all rows in the current column. \n   Do following for every tried row.\n    a) If the queen can be placed safely in this row \n       then mark this [row, column] as part of the \n       solution and recursively check if placing\n       queen here leads to a solution.\n    b) If placing the queen in [row, column] leads to\n       a solution then return true.\n    c) If placing queen doesn't lead to a solution then\n       unmark this [row, column] (Backtrack) and go to \n       step (a) to try other rows.\n3) If all rows have been tried and nothing worked,\n   return false to trigger backtracking.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: NetworkImage("https://www.dl.dropboxusercontent.com/s/ba1ld9w66wr0qap/final.png"),height: 200.0,),
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
                    SelectableText("#include <stdio.h>\n\n//Number of queens\nint N;\n\n//chessboard\nint board[100][100];\n\n/*function to check if the cell is attacked or not*/\nint is_attack(int i,int j)\n{\n    int k,l;\n    /*checking if there is a queen in row or column*/\n    for(k=0;k<N;k++)\n    {\n        if((board[i][k] == 1) || (board[k][j] == 1))\n            return 1;\n    }\n    //checking for diagonals\n    for(k=0;k<N;k++)\n    {\n        for(l=0;l<N;l++)\n        {\n            if(((k+l) == (i+j)) || ((k-l) == (i-j)))\n            {\n                if(board[k][l] == 1)\n                    return 1;\n            }\n        }\n    }\n    return 0;\n}\n\nint N_queen(int n)\n{\n    int i,j;\n    //if n is 0, solution found\n    if(n==0)\n        return 1;\n    for(i=0;i<N;i++)\n    {\n        for(j=0;j<N;j++)\n        {\n            /*checking if we can place a queen here or not*/\n            /*queen will not be placed if the place is being attacked*/\n            //or already occupied\n            if((!is_attack(i,j)) && (board[i][j]!=1))\n            {\n                board[i][j] = 1;\n                //recursion\n                /*wether we can put the next queen with this arrangment or not*/\n                if(N_queen(n-1)==1)\n                {\n                    return 1;\n                }\n                board[i][j] = 0;\n            }\n        }\n    }\n    return 0;\n}\n\nint main()\n{\n    //taking the value of N\n    printf(\"Enter the value of N for NxN chessboard\\n\");\n    scanf(\"%d\",&N);\n\n    int i,j;\n    //setting all elements to 0\n    for(i=0;i<N;i++)\n    {\n        for(j=0;j<N;j++)\n        {\n            board[i][j]=0;\n        }\n    }\n    //calling the function\n    N_queen(N);\n    //printing the matix\n    for(i=0;i<N;i++)\n    {\n        for(j=0;j<N;j++)\n            printf(\"%d\\t\",board[i][j]);\n        printf(\"\\n\");\n    }\n}",
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
                    SelectableText("Worst Case: O(N!)\n"
                        "Average Case: O(N!)\n"
                        "Best Case: O(N!)\n",
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
                          text: "Sudoku Solver",
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
                      "1.Create a function that checks after assigning the current index the grid becomes unsafe or not. Keep Hashmap for a row, column and boxes. If any number has a frequency greater than 1 in the hashMap return false else return true; hashMap can be avoided by using loops.\n2.Create a recursive function which takes a grid.\n3.Check for any unassigned location. If present then assign a number from 1 to 9, check if assigning the number to current index makes the grid unsafe or not, if safe then recursively call the function for all safe cases from 0 to 9. if any recursive call returns true, end the loop and return true. If no recursive call returns true then return false.\n4.If there is no unassigned location then return true.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Image(image: NetworkImage("https://media.geeksforgeeks.org/wp-content/uploads/sudoku.jpg"),),
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
                    SelectableText("#include <iostream>\n#include <cstdio>\n#include <cstring>\n#include <cstdlib>\nusing namespace std;\n#define UNASSIGNED 0\n#define N 9\n \nbool FindUnassignedLocation(int grid[N][N], int &row, int &col);\nbool isSafe(int grid[N][N], int row, int col, int num);\n \n/* assign values to all unassigned locations for Sudoku solution  \n */\nbool SolveSudoku(int grid[N][N])\n{\n    int row, col;\n    if (!FindUnassignedLocation(grid, row, col))\n       return true;\n    for (int num = 1; num <= 9; num++)\n    {\n        if (isSafe(grid, row, col, num))\n        {\n            grid[row][col] = num;\n            if (SolveSudoku(grid))\n                return true;\n            grid[row][col] = UNASSIGNED;\n        }\n    }\n    return false;\n}\n \n/* Searches the grid to find an entry that is still unassigned. */\nbool FindUnassignedLocation(int grid[N][N], int &row, int &col)\n{\n    for (row = 0; row < N; row++)\n        for (col = 0; col < N; col++)\n            if (grid[row][col] == UNASSIGNED)\n                return true;\n    return false;\n}\n \n/* Returns whether any assigned entry n the specified row matches \n   the given number. */\nbool UsedInRow(int grid[N][N], int row, int num)\n{\n    for (int col = 0; col < N; col++)\n        if (grid[row][col] == num)\n            return true;\n    return false;\n}\n \n/* Returns whether any assigned entry in the specified column matches \n   the given number. */\nbool UsedInCol(int grid[N][N], int col, int num)\n{\n    for (int row = 0; row < N; row++)\n        if (grid[row][col] == num)\n            return true;\n    return false;\n}\n \n/* Returns whether any assigned entry within the specified 3x3 box matches \n   the given number. */\nbool UsedInBox(int grid[N][N], int boxStartRow, int boxStartCol, int num)\n{\n    for (int row = 0; row < 3; row++)\n        for (int col = 0; col < 3; col++)\n            if (grid[row+boxStartRow][col+boxStartCol] == num)\n                return true;\n    return false;\n}\n \n/* Returns whether it will be legal to assign num to the given row,col location. \n */\nbool isSafe(int grid[N][N], int row, int col, int num)\n{\n    return !UsedInRow(grid, row, num) && !UsedInCol(grid, col, num) &&\n           !UsedInBox(grid, row - row % 3 , col - col % 3, num);\n}\n \n/* print grid  */\nvoid printGrid(int grid[N][N])\n{\n    for (int row = 0; row < N; row++)\n    {\n        for (int col = 0; col < N; col++)\n            cout<<grid[row][col]<<\"  \";\n        cout<<endl;\n    }\n}\n \n/* Main */\nint main()\n{\n    int grid[N][N] = {{3, 0, 6, 5, 0, 8, 4, 0, 0},\n                      {5, 2, 0, 0, 0, 0, 0, 0, 0},\n                      {0, 8, 7, 0, 0, 0, 0, 3, 1},\n                      {0, 0, 3, 0, 1, 0, 0, 8, 0},\n                      {9, 0, 0, 8, 6, 3, 0, 0, 5},\n                      {0, 5, 0, 0, 9, 0, 6, 0, 0},\n                      {1, 3, 0, 0, 0, 0, 2, 5, 0},\n                      {0, 0, 0, 0, 0, 0, 0, 7, 4},\n                      {0, 0, 5, 2, 0, 6, 3, 0, 0}};\n    if (SolveSudoku(grid) == true)\n          printGrid(grid);\n    else\n        cout<<\"No solution exists\"<<endl;\n    return 0;\n}",
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
                    SelectableText("Worst Case: O(9^(n*n))\n"
                        "Average Case: O(9^(n*n))\n"
                        "Best Case: O(9^(n*n))\n",
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