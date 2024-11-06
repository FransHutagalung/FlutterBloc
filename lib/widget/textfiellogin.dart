import 'package:flutter/material.dart';

class Textfieldlogin extends StatefulWidget {
  final TextEditingController textController;
  final bool isPass;
  final IconData icon;
  final TextInputType type;
  final String hintText;

  const Textfieldlogin({
    Key? key,
    required this.textController,
    required this.isPass,
    required this.icon,
    required this.type,
    required this.hintText,
  }) : super(key: key);

  @override
  _TextfieldloginState createState() => _TextfieldloginState();
}

class _TextfieldloginState extends State<Textfieldlogin> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: widget.textController,
      keyboardType: widget.type,
      obscureText: widget.isPass && isHide, // sembunyikan password jika isPass true
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isPass
            ? IconButton(
                icon: Icon(
                  isHide ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    isHide = !isHide;
                  });
                },
                color: Colors.grey,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
        filled: true,
      ),
    );
  }
}
