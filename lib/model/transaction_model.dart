import 'package:equatable/equatable.dart';
import 'package:flutter_app_airplane/model/destination_model.dart';

class TransactionModel extends Equatable {

  final String id;
  final DestinationModel destinationModel;
  final int amountOfTraveler;
  final String selectedSeat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    this.id = '',
    required this.destinationModel,
    this.amountOfTraveler = 0,
    this.selectedSeat = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        destinationModel: DestinationModel.fromJson(json['destinations']['id'], json['destinations']),
        amountOfTraveler: json['amountOfTraveler'],
        selectedSeat: json['selectedSeat'],
        insurance: json['insurance'],
        refundable: json['refundable'],
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
      );

  @override
  List<Object?> get props => [
        destinationModel,
        amountOfTraveler,
        selectedSeat,
        insurance,
        refundable,
        vat,
        price,
        grandTotal
      ];
}
