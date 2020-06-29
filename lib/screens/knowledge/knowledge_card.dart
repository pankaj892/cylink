import 'package:cylink/models/Knowledge.dart';
import 'package:flutter/material.dart';
import 'knowledge_detail.dart';

class KnowledgeCard extends StatelessWidget {
  Knowledge knowledge;

  KnowledgeCard(this.knowledge);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Material(
            elevation: 8,
            shadowColor: Colors.white,
            color: Colors.indigoAccent[100],
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailKnowledge(knowledge)));
              },
              child: Container(
                height: 200,
                child: Center(
                    child: Text(
                  knowledge.title,
                  style: Theme.of(context).textTheme.bodyText2,
                )),
              ),
            ),
          ),
        ),
        Positioned(
            right: 10,
            top: 0,
            child: Hero(
              tag: "Image${knowledge.imageUrl}",
              child: Image.asset(
                knowledge.imageUrl,
              ),
            )),
      ],
    );
  }
}
