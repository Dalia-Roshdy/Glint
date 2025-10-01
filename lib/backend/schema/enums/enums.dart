import 'package:collection/collection.dart';

enum Role {
  admin,
  pm,
  resource,
}

enum CalendarType {
  General_EG,
  Project,
  Resource,
  General_US,
}

enum Days {
  Saturday,
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (CalendarType):
      return CalendarType.values.deserialize(value) as T?;
    case (Days):
      return Days.values.deserialize(value) as T?;
    default:
      return null;
  }
}
