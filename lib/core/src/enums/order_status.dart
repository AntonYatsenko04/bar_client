enum OrderStatus {
  taken(apiCode: 'taken'),
  inCooking(apiCode: 'inCooking'),
  pendingPayment(apiCode: 'pendingPayment'),
  complete(apiCode: 'complete');

  final String apiCode;

  const OrderStatus({required this.apiCode});

  static OrderStatus statusByApiCode(String apiCode) {
    return OrderStatus.values.firstWhere((OrderStatus status) => status.apiCode == apiCode);
  }
}
