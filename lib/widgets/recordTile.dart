import 'package:flutter/material.dart';

class RecordTile extends StatefulWidget {
  final String userName;
  final List<String> titles;
  final List<String> infos;
  const RecordTile(
      {Key? key,
      required this.titles,
      required this.infos,
      required this.userName})
      : super(key: key);

  @override
  State<RecordTile> createState() => _RecordTileState();
}

class _RecordTileState extends State<RecordTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
          "${widget.titles[0]}: ${widget.infos[0]}",
          style: const TextStyle(fontWeight: FontWeight.bold)),
          ElevatedButton(onPressed: () {}, child: const Text("Check"))
        ]
      ),
    );
  }
}
