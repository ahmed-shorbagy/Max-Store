import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';

class Inputfield extends StatelessWidget {
  const Inputfield({
    super.key,
    required this.sectionTitle,
  });
  final String sectionTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          sectionTitle,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class RowOfinputLine extends StatelessWidget {
  const RowOfinputLine({
    super.key,
    required this.rowtitle,
    required this.onchanged,
  });
  final String rowtitle;
  final void Function(String) onchanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rowtitle,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        SizedBox(
          width: SizeConfig.screenwidth! * 0.6,
          height: SizeConfig.screenhieght! * 0.08,
          child: TextFormField(
            onChanged: onchanged,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'this field is requiered';
              } else {
                return null;
              }
            },
            cursorColor: Colors.black,
            decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
        )
      ],
    );
  }
}
