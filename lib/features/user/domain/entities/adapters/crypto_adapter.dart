import 'package:userlist_app/features/user/data/models/crypto_model.dart';
import 'package:userlist_app/features/user/domain/entities/crypto.dart';

extension CryptoAdapter on CryptoNetworkModel {
  Crypto toEntity() {
    return Crypto(coin: coin, wallet: wallet, network: network);
  }
}
