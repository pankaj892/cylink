import 'package:cylink/models/KnowledgeCategory.dart';

class Knowledge {
  String title;
  List<KnowledgeCategory> knowledgeCategory;
  String imageUrl;

  Knowledge(this.title, this.knowledgeCategory, this.imageUrl);
}
