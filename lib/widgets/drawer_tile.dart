import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatefulWidget {
  const DrawerTile({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 32,
                color: Colors.black,
              ),
              const SizedBox(width: 32),
              Text(
                widget.text,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              )
            ],
          )
        ),
      ),
    );
  }
}
