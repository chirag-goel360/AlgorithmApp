import 'package:algo_f1/DatabasesForTech/Details.dart';
import 'package:algo_f1/Routes/route.dart';
import 'package:algo_f1/models/TechModel.dart';
import 'package:algo_f1/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeFinal extends StatefulWidget {
  @override
  _HomeFinalState createState() => _HomeFinalState();
}

class _HomeFinalState extends State<HomeFinal> {
  List<Techniques> _tech = [];

  @override
  void initState() {
    super.initState();
    _loadTechniques();
  }

  _loadTechniques() async{
    String fileData = await DefaultAssetBundle.of(context).loadString("assets/tech.json");
    print(fileData);
    setState(() {
      _tech= TechApi.allTechniquesFromJson(fileData);
    });
  }

  _navigateToDetails(Techniques techniques,String title, Object avatar) {
    Navigator.of(context).push(
      FadePageRoute(
        builder: (c) {
          return Divide(
            techniques,
            title,
            avatar:avatar,
          );
        },
        settings: RouteSettings(),
      ),
    );
  }

  Widget _buildBody() {
    Orientation orientation =MediaQuery.of(context).orientation;
    return Container(
      margin: EdgeInsets.all(5.0),
      child: (orientation == Orientation.portrait) ?
      Column(
        children: <Widget>[
          Image(
            image: AssetImage(
              "assets/algopic.jpg",
            ),
          ),
          _getListViewWidget(),
        ],
      ) :
      Row(
        children: <Widget>[
          Image(
            image: AssetImage(
              "assets/algopic.jpg",
            ),
          ),
          _getListViewWidget(),
        ],
      ),
    );
  }

  Widget _getListViewWidget() {
    return Flexible(
      child: RefreshIndicator(
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: _tech.length,
          itemBuilder: _buildTechItem,
          padding: EdgeInsets.only(
            top: 5.0,
          ),
        ),
        color: Colors.pink,
        backgroundColor: Colors.white,
        onRefresh: refresh,
      ),
    );
  }

  Widget _buildTechItem(BuildContext context, int index) {
    Techniques techniques = _tech[index];
    return Container(
      margin: EdgeInsets.only(
        top: 5.0,
      ),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              onTap: () =>_navigateToDetails(techniques,techniques.name,index),
              title: Text(
                techniques.name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              leading: Hero(
                tag: index,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    techniques.image_url,
                  ),
                  radius: 30.0,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size:35.0,
              ),
              subtitle: Text(
                techniques.description,
              ),
              isThreeLine: false,
              dense: false,
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> refresh() {
    _loadTechniques();
    return Future<Null>.value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "Algorithms for learning",
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
            ),
            tooltip: "Exit!",
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
}