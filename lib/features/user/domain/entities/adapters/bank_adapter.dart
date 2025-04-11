import 'package:userlist_app/features/user/data/models/bank_model.dart';
import 'package:userlist_app/features/user/domain/entities/bank.dart';

extension BankAdapter on BankNetworkModel {
  Bank toEntity() {
    return Bank(
      cardExpire: cardExpire,
      cardNumber: cardNumber,
      cardType: cardType,
      currency: currency,
      iban: iban,
    );
  }
}
