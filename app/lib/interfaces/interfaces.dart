class LocalResponse {
  LocalResponse({required this.success, this.message = ""});
  bool success;
  String message;
}

class StorageItem {
  StorageItem({required this.key, required this.value});
  String key;
  String value;
}
