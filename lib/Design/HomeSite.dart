import 'package:algo_f1/DatabasesForTech/Details.dart';
import 'package:algo_f1/Routes/route.dart';
import 'package:algo_f1/models/TechModel.dart';
import 'package:algo_f1/services/api.dart';
import 'package:flutter/material.dart';

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
    String fileData =await DefaultAssetBundle.of(context).loadString("assets/tech.json");
    setState(() {
      _tech= TechApi.allTechniquesFromJson(fileData);
    });
  }

  _navigateToDetails(Techniques techniques,String title, Object avatar) {
    Navigator.of(context).push(
      new FadePageRoute(
        builder: (c) {
          return new Divide(techniques,title,avatar:avatar);
        },
        settings: new RouteSettings(),
      ),
    );
  }

  Widget _buildBody() {
    Orientation orientation =MediaQuery.of(context).orientation;
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: (orientation == Orientation.portrait)
        ? Column(
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/algopic.jpg"),
          ),
          _getListViewWidget(),
        ],
      )
      : Row(
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/algopic.jpg"),
          ),
          _getListViewWidget(),
        ],
    ),
    );
  }

  Widget _getListViewWidget() {
    return new Flexible(
      child: new RefreshIndicator(
        child: new ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _tech.length,
          itemBuilder: _buildTechItem,
          padding: const EdgeInsets.only(top: 5.0),
        ),
        color: Colors.pink,
        backgroundColor: Colors.white,
        onRefresh: refresh,
      ),
    );
  }

  Widget _buildTechItem(BuildContext context, int index) {
    Techniques techniques = _tech[index];
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              onTap: () =>_navigateToDetails(techniques,techniques.name,index),
              title: new Text(
                techniques.name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              leading: new Hero(
                tag: index,
                child:new CircleAvatar(
                  backgroundImage: new NetworkImage(techniques.image_url),
                  radius: 30.0,
                ),
              ),
              trailing: new Icon(Icons.arrow_forward_ios,size:35.0),
              subtitle: new Text(techniques.description),
              isThreeLine: false,
              dense: false,
            )
          ],
        ),
      ),
    );
  }

  Future<Null> refresh() {
    _loadTechniques();
    return new Future<Null>.value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: new AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Algo for learning"),
        centerTitle: true,
        leading: new Icon(Icons.book),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.exit_to_app),
            tooltip: "Exit!",
            onPressed: ()=> {},
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
}
