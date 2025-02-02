import 'package:exam_mobile/models/fitpasos.dart';



import 'base_provider.dart';

class FitpasosProvider extends BaseProvider<Fitpasos> {
  FitpasosProvider() : super("FITPasos");

  @override
  Fitpasos fromJson(data) {
    return Fitpasos.fromJson(data);
  }
}
