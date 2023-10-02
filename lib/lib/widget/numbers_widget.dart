import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '7.2 Saat', 'Ort. Çalışma Süresi'),
          buildDivider(),
          buildButton(context, 'Dinleniyor', 'Mesai Durumu'),
          buildDivider(),
          buildButton(context, '50', 'Kalan İzin Sayısı'),
        ],
      );
  Widget buildDivider() => Container(
        height: 24,
        width: 20,
        child: VerticalDivider(
          thickness: 1,
        ),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      );
}
