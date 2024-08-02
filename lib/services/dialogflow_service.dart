import 'package:dialog_flowtter/dialog_flowtter.dart';

class DialogflowService {
  late DialogFlowtter dialogFlowtter;

  Future<void> initialize() async {
    dialogFlowtter = await DialogFlowtter.fromFile(
        path: 'assets/duygudas-431314-d385b1072592.json');
  }

  Future<String> getResponse(String query) async {
    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: query)),
    );
    return response.text ?? "I don't understand.";
    }
}