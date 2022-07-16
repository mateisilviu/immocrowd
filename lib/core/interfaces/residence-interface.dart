import '../models/residence.dart';

abstract class ResidenceDao {
  Future<List<Residence>> getResidences();
  Future<String> addResidence(Residence residence);
}
