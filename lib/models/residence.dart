abstract class Residence {
  const Residence({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.address,
    required this.photo,
  });

  final int id;
  final String name;
  final String shortDescription;
  final String address;
  final String photo;

  @override
  String toString() => '$name (id=$id)';
}

class Apartment extends Residence {
  const Apartment({id, name, shortDescription, address, photo})
      : super(
            id: id,
            name: name,
            shortDescription: shortDescription,
            address: address,
            photo: photo);
}
