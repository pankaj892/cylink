import 'package:cylink/components/ContainerBorder.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rich_alert/rich_alert.dart';

class ChipInformation extends StatefulWidget {
  
  @override
  _ChipInformationState createState() => _ChipInformationState();
}

class _ChipInformationState extends State<ChipInformation> {
  var pr;

  double percentage = 0.0;

  String version = "Version 1.0.3";

  @override
  Widget build(BuildContext context) {
    setDialog(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Cylink VeX",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Image.asset("assets/ram.png"),
                Text(
                  version,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                ContainerBorder(
                  title: "System Check",
                  callback: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RichAlertDialog( //uses the custom alert dialog
                            alertTitle: richTitle("System check"),
                            alertSubtitle: richSubtitle("Everything is ok."),
                            alertType: RichAlertType.SUCCESS,
                          );
                        }
                    );
                  },
                ),
                ContainerBorder(
                    title: "System Update",
                    callback: () async {
                      checkForUpdates();
                    })
              ],
            )
          ],
        ));
  }

  void setDialog(BuildContext context) {
    pr = ProgressDialog(context,
        type: ProgressDialogType.Download,
        isDismissible: false,
        showLogs: false);
    pr.style(
      message: 'Check for Updates.',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      progressWidgetAlignment: Alignment.center,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
  }

  void checkForUpdates() async {
    await pr.show();
    await Future.delayed(Duration(seconds: 2)).then((onvalue) {
      percentage = percentage + 30.0;
      print(percentage);
      pr.update(
          progress: percentage,
          message: "Found new Update");
    });
    await Future.delayed(Duration(seconds: 2)).then((onvalue) {
      percentage = percentage + 30.0;
      print(percentage);
      pr.update(
          progress: percentage,
          message: "Updating...");
    });
    await Future.delayed(Duration(seconds: 2)).then((onvalue) {
      percentage = percentage + 30.0;
      print(percentage);
      pr.update(
          progress: percentage,
          message: "Update successful");
    });

    await Future.delayed(Duration(seconds: 1)).then((onvalue) {
      percentage = percentage + 10.0;
      print(percentage);
      pr.update(
          progress: percentage,
          message: "Update successful");
    });

    pr.hide();
    percentage = 0.0;

    setState(() {
      version = "Version 1.0.4";
    });

  }
}
