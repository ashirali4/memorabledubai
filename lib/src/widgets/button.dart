import 'package:flutter/material.dart';
class GradientButton extends StatelessWidget {
  final double width;
  final String buttonTEXT;
  final Color color;
  final Color textColor;
  final Function function;
  final double radius;
  const GradientButton({Key? key,this.width=200,required this.buttonTEXT,this.color=Colors.black,this.textColor=Colors.white,required this.function,this.radius=80}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        this.function();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(this.radius)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                this.color,
                Colors.grey
              ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(2.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp
            ),
          borderRadius: BorderRadius.all(Radius.circular(this.radius)),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child:  Text(
            this.buttonTEXT,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: this.textColor
            ),
          ),
        ),
      ),
    );
  }
}
