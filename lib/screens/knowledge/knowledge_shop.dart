import 'package:cylink/models/Knowledge.dart';
import 'package:cylink/models/KnowledgeCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'knowledge_card.dart';

class KnowledgeCenter extends StatefulWidget {
  @override
  _KnowledgeCenterState createState() => _KnowledgeCenterState();
}

class _KnowledgeCenterState extends State<KnowledgeCenter> {
  List<Knowledge> knowledges = [
    Knowledge("Flutter", [
      KnowledgeCategory("Algorithm",
          {"Beginner": 5.0, "Intermediate": 10.0, "Professional": 15.0}),
      KnowledgeCategory("Backend",
          {"Starter": 12.0, "Junior": 20.0, "Senior": 30.0}),
      KnowledgeCategory("Animation",
          {"Beginner": 5.0, "Student": 10.0, "Visual Artist": 15.0}),
      KnowledgeCategory("Design Patterns",
          {"Beginner": 5.0, "Intermediate": 20.0, "Architect": 35.0}),
      KnowledgeCategory("Frontend",
          {"Beginner": 5.0, "Well-Known": 20.0, "Designer": 35.0})
    ], "assets/flutter.png"),
    Knowledge("Math", [
      KnowledgeCategory("Algebra",
          {"Beginner": 12.0, "Intermediate": 24.0, "Genius": 33.0}),
      KnowledgeCategory("Geometry",
          {"Basics": 15.0, "Intermediate": 29.0, "Professional": 35.0}),
      KnowledgeCategory("Logic",
          {"Starter": 10.0, "Thinker": 15.0, "Logician": 20.0}),
      KnowledgeCategory("Analysis",
          {"Basics": 5.0, "Student": 10.0, "Professor": 15.0})
    ], "assets/math.png"),
    Knowledge("Basketball", [
      KnowledgeCategory("Passing",
          {"Beginner": 12.0, "Intermediate": 24.0, "Pro": 33.0}),
      KnowledgeCategory("Blocking",
          {"Basics": 15.0, "Intermediate": 29.0, "Blocker": 35.0}),
      KnowledgeCategory("Stealing",
          {"Hobbyist": 10.0, "Intermediate": 15.0, "Professional": 20.0}),
      KnowledgeCategory("Dribbling",
          {"Hobby": 5.0, "College Student": 10.0, "Dribbler": 15.0})
    ], "assets/basketball.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
          body: ListView.builder(
              itemCount: knowledges.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: KnowledgeCard(knowledges[index])
                );
              }),
        );
  }
}
