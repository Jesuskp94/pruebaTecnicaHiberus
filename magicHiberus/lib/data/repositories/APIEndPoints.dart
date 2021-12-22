const _endpoint = 'https://api.magicthegathering.io';
const _version = 'v1';
const List<String> resources = ['cards', 'sets', 'types', 'subtypes', 'supertypes', 'formats'];

String getURLAllCards() {
  return '$_endpoint/$_version/${resources.elementAt(0)}';
}
String getURLCardsById(int id) {
  return '$_endpoint/$_version/${resources.elementAt(0)}/$id';
}
String getURLCardsByName(String name) {
  return '$_endpoint/$_version/${resources.elementAt(0)}?name=$name';
}