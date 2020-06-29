import 'package:cylink/models/Detail_Knowledge_Toogle.dart';
import 'package:cylink/models/Knowledge.dart';
import 'package:cylink/models/KnowledgeCategory.dart';
import 'package:cylink/models/Sum.dart';
import 'package:cylink/components/ContainerBorder.dart';
import 'package:cylink/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ToggleButtonDetailKnowledge.dart';
import 'package:progress_dialog/progress_dialog.dart';

class DetailKnowledge extends StatefulWidget {
  Knowledge knowledge;
  double sum;

  DetailKnowledge(this.knowledge);

  @override
  _DetailKnowledgeState createState() => _DetailKnowledgeState();
}

class _DetailKnowledgeState extends State<DetailKnowledge> {
  double sum = 0.0;
  double percentage = 0.0;
  var pr;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Sum>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
                counter.reset();
              })),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                        tag: "Image${widget.knowledge.imageUrl}",
                        child: Image.asset(widget.knowledge.imageUrl))
                  ],
                ),
                ...loopOverCategory(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Price: ${counter.getSum().toString()}",
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                width: 5,
              ),
              Image.asset(
                "assets/bitcoin.png",
                width: 50,
                height: 50,
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ContainerBorder(
                title: "Checkout",
                callback: () async {
                  setDialog(context);
                  await checkForUpdates();
                },
              )
            ],
          )
        ],
      ),
    );
  }

  List<Widget> toggleChilderen(KnowledgeCategory knowledgeCategory) {
    List<String> child = [];
    knowledgeCategory.options.entries.forEach((e) => child.add(e.key));
    List<Widget> childeren = [];
    child.forEach((element) {
      childeren.add(Container(
        width: MediaQuery.of(context).size.width / child.length - 10,
        child: Center(
            child: Text(
          element,
          style: Theme.of(context).textTheme.bodyText1,
        )),
      ));
    });
    return childeren;
  }

  void checkForUpdates() async {
    await pr.show();
    await pr.show();
    await Future.delayed(Duration(seconds: 2)).then((onvalue) {
      percentage = percentage + 20.0;
      print(percentage);
      pr.update(progress: percentage, message: "Connect to Bitcoin Wallet");
    });
    await Future.delayed(Duration(seconds: 2)).then((onvalue) {
      percentage = percentage + 30.0;
      print(percentage);
      pr.update(progress: percentage, message: "Checkout...");
    });
    await Future.delayed(Duration(seconds: 2)).then((onvalue) {
      percentage = percentage + 30.0;
      print(percentage);
      pr.update(progress: percentage, message: "Payment successful");
    });
    await Future.delayed(Duration(seconds: 3)).then((onvalue) {
      percentage = percentage + 10.0;
      print(percentage);
      pr.update(progress: percentage, message: "Connect to CyLink");
    });
    await Future.delayed(Duration(seconds: 1)).then((onvalue) {
      percentage = percentage + 10.0;
      print(percentage);
      pr.update(progress: percentage, message: "Finish");
    });

    percentage = 0.0;
    pr.hide();

    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoadingScreen("Transfer Knowledge")));
  }

  void setDialog(BuildContext context) {
    pr = ProgressDialog(context,
        type: ProgressDialogType.Download,
        isDismissible: false,
        showLogs: false);
    pr.style(
      message: 'Prepare Payment',
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

  DetailKnowledgeToggle createDetailToggle(KnowledgeCategory category) {
    return DetailKnowledgeToggle(
        category.title,
        category.options.values.first,
        category.options.values.toList(),
        List<bool>.generate(category.options.length, (index) => false),
        toggleChilderen(category));
  }

  loopOverCategory() {
    final List<Widget> child = [];
    widget.knowledge.knowledgeCategory.forEach((element) {
      child.add(ToggleButtonDetailKnowledge(createDetailToggle(element)));
    });
    return child;
  }
}
