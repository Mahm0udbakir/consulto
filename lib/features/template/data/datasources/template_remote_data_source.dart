import 'package:consulto/core/database/api/api_consumer.dart';

import '../models/template_model.dart';

class TemplateRemoteDataSource {
  final ApiConsumer api;

  TemplateRemoteDataSource({required this.api});
  // Future<TemplateModel> getTemplate(TemplateParams params) async {
  //   final response = await api.get("${EndPoints.template}/${params.id}");
  //   return TemplateModel.fromJson(response);
  // }
}
