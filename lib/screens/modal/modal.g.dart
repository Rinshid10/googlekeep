// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoogleNotsAdapter extends TypeAdapter<GoogleNots> {
  @override
  final int typeId = 0;

  @override
  GoogleNots read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoogleNots(
      title: fields[0] as String?,
      subTitle: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GoogleNots obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoogleNotsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
