import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/cover_image.jpg'),
                      fit: BoxFit.fill)),
            ),
            clipper: GetClipper(),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: [
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 10.0, color: Colors.black26)
                    ],
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 5.0),
                    color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('assets/images/profile_picture.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'BELMOKHTAR MOUNIR',
                  style: TextStyle(fontFamily: 'Fette', fontSize: 26.0),
                ),
                SizedBox(height: 5.0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(75.0)),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Available for freelance',
                        style: TextStyle(color: Colors.green, fontSize: 13.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildSkillChip('3D ILLUSTRATIONS'),
                    _buildSkillChip('ANIMATION'),
                    _buildSkillChip('LOW POLY'),
                    _buildSkillChip('CROWBAR'),
                    _buildSkillChip('ICONS'),
                  ],
                ),
                SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatsColumn('FOLLOWERS', '1 253'),
                    _buildStatsColumn('FOLLOWING', '658'),
                    _buildStatsColumn('WORKS', '253')
                  ],
                ),
                SizedBox(height: 25.0),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(75.0)
                  ),
                  child: Text(
                    'HIRE',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16.0
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSkillChip(String title) {
    return Container(
      margin: EdgeInsets.all(3.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(75.0),
      ),
      child: Text(title, style: TextStyle(color: Colors.black38)),
    );
  }

  Widget _buildStatsColumn(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        Text(
          title,
          style: TextStyle(fontFamily: 'Quicksand', fontSize: 15.0),
        ),
      ],
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 2.3);
    path.lineTo(size.width, size.height / 4.2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
