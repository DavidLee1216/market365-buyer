import 'dart:io';

import 'package:flutter/material.dart';

class GridImageItem extends StatefulWidget {
  final String image;
  final Function removeImage;
  GridImageItem({this.image, this.removeImage});

  @override
  _GridImageItemState createState() => _GridImageItemState();
}

class _GridImageItemState extends State<GridImageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200,
      ),
      margin: EdgeInsets.only(right: 10, top: 10),
      child: InkWell(
        onTap: widget.removeImage,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: !widget.image.startsWith('http')
                  ? Image.file(
                      File(widget.image),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      widget.image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            Align(alignment: Alignment.topRight, child: CircleAvatar(backgroundColor: Colors.white, radius: 10, child: Icon(Icons.cancel, color: Colors.red, size: 20))),
          ],
        ),
      ),
    );
  }
}
