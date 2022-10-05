class UserProfile {
  UserProfile({required this.generalInfo, required this.addressInfo});

  final GeneralInfo generalInfo;
  final AddressInfo addressInfo;

  static UserProfile get mocked {
    return UserProfile(
        generalInfo: GeneralInfo(
            emailAddress: "fake@email.com",
            firstName: "FirstName",
            id: "someId",
            lastName: "LastName",
            phoneNumber: "+99.000.111.222",
            taxId: "taxId"),
        addressInfo: AddressInfo(
            city: "City",
            country: "Country",
            state: "state",
            street: "Street",
            zipCode: "0909090"));
  }
}

class GeneralInfo {
  GeneralInfo(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.emailAddress,
      required this.phoneNumber,
      required this.taxId});

  final String id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  final String taxId;
}

class AddressInfo {
  AddressInfo({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;
}

class SecretInfo {}
