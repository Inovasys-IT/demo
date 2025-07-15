/// Data models for the WMS application.
class ReceptionLine {
  final String itemNo;
  final String description;
  final double expectedQty;
  final String unitOfMeasure;

  const ReceptionLine({
    required this.itemNo,
    required this.description,
    required this.expectedQty,
    required this.unitOfMeasure,
  });
}

class Support {
  // TODO: define id, type, location, etc.
}

class OrderLine {
  // TODO: define order line fields
}

class InventoryLine {
  // TODO: define inventory line fields
}
