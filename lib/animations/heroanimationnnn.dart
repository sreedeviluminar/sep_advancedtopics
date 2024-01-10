import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: HeroMain(),));
}
class HeroMain extends StatelessWidget {
  const HeroMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Main Page"),
        elevation: 5,
        backgroundColor: Colors.red,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => HeroDetails()));
        },
        child: Hero(
          tag: 'imageHero',
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green),
            width: 100,
            height: 100,
            child: const Icon(
              Icons.tour,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Details Page"),
        elevation: 5,
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => HeroMain()));
            },
            child: Hero(
              tag: 'imageHero',
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.purple),
                width: 300,
                height: 300,
                child: const Icon(
                  Icons.playlist_add_circle_rounded,
                  size: 100,
                  color: Colors.black,
                ),
              ),
            ),
          ),
      ),
    );
  }
}
