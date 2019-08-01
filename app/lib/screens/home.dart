import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }

}

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage logo = AssetImage('images/logo.png');
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('images/bg_home.jpg'),
            fit: BoxFit.cover,
          ),
      ),
      alignment:  Alignment.center,
      child: Column(
          children: <Widget>[
            Image(image: logo, width: 200.0,),
            Text(
              "Faça parte dessa mudançaa!",
              textDirection: TextDirection.ltr,
            )
          ],
        ),
    
      );
  }


}

