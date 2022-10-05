class Documents {
  final String documentName;
  final String documentUrl;
  final DateTime createdAt;

  Documents(
      {required this.documentName,
      required this.documentUrl,
      required this.createdAt});

  static List<Documents> get mocked {
    return [
      Documents(
          documentName: "documentName1",
          documentUrl:
              "https://firebasestorage.googleapis.com/v0/b/immocrowd-49e21.appspot.com/o/properties%2Fdocuments%2FSenior%20BackEnd%20Developer%20(Java).pdf?alt=media&token=7861b222-7b7e-46bf-9d44-7fe83445f719",
          createdAt: DateTime.now()),
      Documents(
          documentName: "documentName2",
          documentUrl:
              "https://firebasestorage.googleapis.com/v0/b/immocrowd-49e21.appspot.com/o/properties%2Fdocuments%2FSenior%20BackEnd%20Developer%20(Java).bla?alt=media&token=c1b8faf4-50bc-4692-9177-ba24a5f8d8a9",
          createdAt: DateTime.now()),
    ];
  }
}
