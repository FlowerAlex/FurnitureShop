import 'package:furniture_shop/data/contracts.dart';

extension UserInfoDTOEx on UserInfoDTO {
  UserInfoDTO copyWith({
    String? id,
    String? firstname,
    String? surname,
    String? username,
    String? emailAddress,
    String? address,
    int? funds,
    bool? isBanned,
  }) =>
      UserInfoDTO(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        surname: surname ?? this.surname,
        username: username ?? this.username,
        emailAddress: emailAddress ?? this.emailAddress,
        address: address ?? this.address,
        funds: funds ?? this.funds,
        isBanned: isBanned ?? this.isBanned,
      );
}
