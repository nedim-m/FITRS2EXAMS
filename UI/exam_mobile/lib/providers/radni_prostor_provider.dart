import 'package:exam_mobile/models/radni_prostor.dart';

import 'base_provider.dart';

class RadniProstorProvider extends BaseProvider<RadniProstor> {
  RadniProstorProvider() : super("RadniProstor");

  @override
  RadniProstor fromJson(data) {
    return RadniProstor.fromJson(data);
  }
}
