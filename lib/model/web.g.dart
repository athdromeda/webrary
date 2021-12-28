// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WebAdapter extends TypeAdapter<Web> {
  @override
  final int typeId = 1;

  @override
  Web read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Web(
      title: fields[0] as String,
      subtitle: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Web obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
