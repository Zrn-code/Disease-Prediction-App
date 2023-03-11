import 'package:http/http.dart' as http;

Future<String> fetchData(String url) async {
  try {
    var response = await http.get(Uri.parse(url));
    return response.body;
  } catch (e) {
    print(e);

    return 'Error';
  }
}
