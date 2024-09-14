// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileModelAdapter extends TypeAdapter<ProfileModel> {
  @override
  final int typeId = 1;

  @override
  ProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileModel(
      createdAt: fields[0] as DateTime,
      address: fields[1] as String,
      level: fields[2] as String,
      displayName: fields[3] as String,
      roles: (fields[4] as List).cast<String>(),
      v: fields[5] as int,
      active: fields[6] as bool,
      id: fields[7] as String,
      experienceYears: fields[8] as int,
      username: fields[9] as String,
      updatedAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.level)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.roles)
      ..writeByte(5)
      ..write(obj.v)
      ..writeByte(6)
      ..write(obj.active)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.experienceYears)
      ..writeByte(9)
      ..write(obj.username)
      ..writeByte(10)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
