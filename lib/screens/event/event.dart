import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Event'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child:FittedBox(// Not sure what to put here!
                child: new CachedImage(rounded: false,url: 'https://cdn.pixabay.com/photo/2015/01/21/13/20/big-606681_960_720.png',),
                fit: BoxFit.cover, // I thought this would fill up my Container but it doesn't
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:FittedBox(// Not sure what to put here!
                  child: new CachedImage(rounded: false,url: 'https://cdn.pixabay.com/photo/2015/01/21/13/20/big-606681_960_720.png',),
                  fit: BoxFit.cover, // I thought this would fill up my Container but it doesn't
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:FittedBox(// Not sure what to put here!
                  child: new CachedImage(rounded: false,url: 'https://cdn.pixabay.com/photo/2015/01/21/13/20/big-606681_960_720.png',),
                  fit: BoxFit.cover, // I thought this would fill up my Container but it doesn't
                ),
              ),
            )
           ]
        ),
      ),
    );
  }
}
