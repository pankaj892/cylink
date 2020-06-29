import 'package:cylink/models/Detail_Knowledge_Toogle.dart';
import 'package:cylink/models/KnowledgeCategory.dart';
import 'package:cylink/models/Sum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToggleButtonDetailKnowledge extends StatefulWidget {

  DetailKnowledgeToggle detailKnowledgeToggle;


  ToggleButtonDetailKnowledge(this.detailKnowledgeToggle);

  @override
  _ToggleButtonDetailKnowledgeState createState() =>
      _ToggleButtonDetailKnowledgeState();
}

class _ToggleButtonDetailKnowledgeState
    extends State<ToggleButtonDetailKnowledge> {

  List isSelected;
  double lastValue = 0.0;

  @override
  void initState() {
    isSelected = widget.detailKnowledgeToggle.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Sum>(context);
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.detailKnowledgeToggle.title, style: Theme
                  .of(context)
                  .textTheme
                  .headline1,),
            ],
          ),
          ToggleButtons(
              isSelected: isSelected,
              selectedBorderColor: Colors.white,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex <
                      isSelected.length; buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = !isSelected[buttonIndex];
                      counter.undoSum(lastValue);
                      counter.setSum(widget.detailKnowledgeToggle.values[index]);
                      lastValue = widget.detailKnowledgeToggle.values[index];
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              children: widget.detailKnowledgeToggle.toggleChilderen
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
        width: MediaQuery
            .of(context)
            .size
            .width / child.length - 10,
        child: Center(child: Text(element)),
      ));
    });
    return childeren;
  }

  DetailKnowledgeToggle createDetailToggle(KnowledgeCategory category) {
    return DetailKnowledgeToggle(
        category.title, category.options.values.first,
        category.options.values.toList(),
        List<bool>.generate(category.options.length, (index) => false),
        toggleChilderen(category)
    );
  }

}

