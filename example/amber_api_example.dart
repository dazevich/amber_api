import 'package:amber_api/amber_api.dart';

void main() {
  final api = AmberApi();
  api.registerDataHandler<String>((data) => data.toString());
}
