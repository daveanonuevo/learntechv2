import 'dart:io';
import 'dart:convert';

Future<String> apiRequest(String url, String jsonMap) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(jsonMap));
  HttpClientResponse response = await request.close();
  String reply = await utf8.decoder.bind(response).join();
  httpClient.close();
  return reply;
}