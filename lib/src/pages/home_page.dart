import 'package:flutter/material.dart';
import 'package:movies/src/providers/movies_provider.dart';

import 'package:movies/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  final moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Movies in theaters'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            _swiperCards(),
            _footer(context)
          ],
        )));
  }

  Widget _swiperCards() {
    return FutureBuilder(
      future: moviesProvider.getOnTheaters(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData)
          return CardSwiperWidget(movies: snapshot.data);
        else
          return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator()
                )
              );
      },
    );

    //moviesProvider.getOnTheaters();
    //return CardSwiperWidget(
    //  movies: [1,2,3,4,5],
    //);
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Popular', style: Theme.of(context).textTheme.subhead),
          FutureBuilder(
            future: moviesProvider.getPopular(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Text(snapshot.data[0].title);
            },
          ),
        ],
      ),
    );
  }

}
