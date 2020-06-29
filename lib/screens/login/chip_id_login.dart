import 'package:cylink/screens/home/dashboard.dart';
import 'package:cylink/screens/user/user_info_knowledge.dart';
import 'package:flutter/material.dart';

class ChipIdLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white
          ),
          ),
          child: Column(
            children: <Widget>[
              Text("CHIP-ID",  style: Theme.of(context).textTheme.bodyText1,),
              Divider(
                height: 1,
                color: Colors.white,
              ),
              Text("Press to Connect", style: Theme.of(context).textTheme.bodyText1,)
            ],
          ),
        ),
      ),
    );
  }
}
