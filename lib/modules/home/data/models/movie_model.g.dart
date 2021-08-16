// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelAdapter extends TypeAdapter<MovieModel> {
  @override
  final int typeId = 0;

  @override
  MovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModel()
      ..movieName = fields[0] as String
      ..director = fields[1] as String
      ..imgUrl = fields[2] as String
      ..timeCreated = fields[3] as int;
  }

  @override
  void write(BinaryWriter writer, MovieModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.movieName)
      ..writeByte(1)
      ..write(obj.director)
      ..writeByte(2)
      ..write(obj.imgUrl)
      ..writeByte(3)
      ..write(obj.timeCreated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
