class CryptoNetworkModel {
  CryptoNetworkModel({
    required this.coin,
    required this.wallet,
    required this.network,
  });
  factory CryptoNetworkModel.fromJson(Map<String, dynamic> json) {
    return CryptoNetworkModel(
      coin: json['coin'] as String?,
      wallet: json['wallet'] as String?,
      network: json['network'] as String?,
    );
  }

  final String? coin;
  final String? wallet;
  final String? network;

  CryptoNetworkModel copyWith({String? coin, String? wallet, String? network}) {
    return CryptoNetworkModel(
      coin: coin ?? this.coin,
      wallet: wallet ?? this.wallet,
      network: network ?? this.network,
    );
  }

  @override
  String toString() {
    return '$coin, $wallet, $network, ';
  }
}
