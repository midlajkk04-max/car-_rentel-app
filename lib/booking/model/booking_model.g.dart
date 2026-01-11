// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookingModelAdapter extends TypeAdapter<BookingModel> {
  @override
  final int typeId = 2;

  @override
  BookingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookingModel(
      userId: fields[0] as String,
      carName: fields[1] as String,
      carImage: fields[2] as String,
      carPrice: fields[3] as int,
      bookingDate: fields[4] as String,
      days: fields[5] as int,
      totalAmount: fields[6] as int,
      startDate: fields[7] as String,
      endDate: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookingModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.carName)
      ..writeByte(2)
      ..write(obj.carImage)
      ..writeByte(3)
      ..write(obj.carPrice)
      ..writeByte(4)
      ..write(obj.bookingDate)
      ..writeByte(5)
      ..write(obj.days)
      ..writeByte(6)
      ..write(obj.totalAmount)
      ..writeByte(7)
      ..write(obj.startDate)
      ..writeByte(8)
      ..write(obj.endDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
