import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for Clipboard

class bubble extends StatelessWidget {
  final String data;
  final double size;
  final Color bgColor;
  bubble(
      {super.key,
      required this.size,
      required this.data,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: 3 * width / 4,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(size / 100),
      ),
      padding:
          EdgeInsets.symmetric(vertical: size / 100, horizontal: size / 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              data,
              style: TextStyle(
                color: Colors.black,
                fontSize: this.size / 50,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.copy, color: Color.fromARGB(255, 1, 234, 255)),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: data));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Copied to clipboard'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
