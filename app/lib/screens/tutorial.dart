import 'package:flutter/material.dart';
import '../theme_data.dart';
import 'login.dart';

class Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttonSkip = Image(
        image: new ExactAssetImage('images/nextbutton.png'),
        width: 15.0,
        );
    AssetImage logo = AssetImage('images/logo.png');
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        
        itemBuilder: (context, position) {
          return PageView(
            children: <Widget>[
              Container(
                color: Colors.grey[200],
              ),
              Container(
                color: Colors.orange[50],
                alignment:  Alignment.bottomLeft,
                child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(26.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Text.rich(
                              TextSpan(
                                text: "Mapa com as áreas\n",
                                children: <TextSpan>[
                                  TextSpan(text: 'Mais perigosas \n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: "Através de um mapa com pontos de ALERTAs, você escolhe os melhores lugares para passar.", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w300)),
                                ],
                                style: TextStyle(color: Colors.orange[900], fontSize: 25.0, fontWeight: FontWeight.w100)
                              )
                            
                            ),
                            Image(image: new ExactAssetImage('images/step2.png'), fit: BoxFit.fitHeight, ),
                        ],) 
                        
                      )
                      
                    ],
                  ),
              ),
              Container(
                //color: Colors.teal[200],
                decoration: new BoxDecoration(
                    //color: Colors.teal[200],
                    image: new DecorationImage(
                      image: new ExactAssetImage('images/step3.png'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.teal[200],
                ),
                alignment:  Alignment.bottomLeft,
                child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(26.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Image(image: logo, width: 200.0),
                            Text.rich(
                              TextSpan(
                                text: "Caminhe",
                                children: <TextSpan>[
                                  TextSpan(text: ' juntas, \n', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: 'faça'),
                                  TextSpan(text: 'novas amigas \n', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: "Acesse os grupos e encontre amigas que façam os mesmos trajetos que você! ", style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w300)),
                                ],
                                style: TextStyle(color: Colors.orange[900], fontSize: 25.0, fontWeight: FontWeight.w100)
                              )
                            
                            )
                        ],) 
                        
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            child: Image(
                              image: new ExactAssetImage('images/nextbutton.png'),
                              
                            ),
                            onPressed: () { 
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            }
                            
                            
                          )

                        ], 
                      )
                      
                    ],
                  ),
                  
              ),
            ],
          );
        },
        //scrollDirection: Axis.vertical,
        itemCount: 3,
      ),
    );
  }
}
