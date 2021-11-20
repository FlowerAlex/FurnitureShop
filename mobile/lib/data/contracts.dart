import 'package:cqrs/contracts.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'contracts.g.dart';

final _ = EquatableConfig.stringify = true;

/// [TimeOfDay] but with seconds precision
class Time with EquatableMixin {
  const Time(this.hour, this.minute, this.second)
      : assert(hour >= 0 && hour <= 23),
        assert(minute >= 0 && minute <= 59),
        assert(second >= 0 && second <= 59);

  factory Time.fromJson(String json) {
    final chunks = json.split(':');
    return Time(
      int.parse(chunks[0]),
      int.parse(chunks[1]),
      int.parse(chunks[2]),
    );
  }

  final int hour;

  final int minute;

  final int second;

  get props => [hour, minute, second];

  String toJson() => '$hour:$minute:$second';
}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class ExampleCommand with EquatableMixin implements IRemoteCommand {
  ExampleCommand({
    required this.arg,
  });

  factory ExampleCommand.fromJson(Map<String, dynamic> json) =>
      _$ExampleCommandFromJson(json);

  final String arg;

  get props => [arg];

  Map<String, dynamic> toJson() => _$ExampleCommandToJson(this);
  String getFullName() => 'FurnitureShop.Core.Contracts.Example.ExampleCommand';
}

class ExampleCommandErrorCodes {
  static const emptyArg = 1;
}
