// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profession_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfessionAdapter extends TypeAdapter<UserProfession> {
  @override
  final int typeId = 1;

  @override
  UserProfession read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserProfession.doctor;
      case 1:
        return UserProfession.engineer;
      case 2:
        return UserProfession.teacher;
      case 3:
        return UserProfession.lawyer;
      case 4:
        return UserProfession.accountant;
      case 5:
        return UserProfession.nurse;
      case 6:
        return UserProfession.architect;
      case 7:
        return UserProfession.artist;
      case 8:
        return UserProfession.musician;
      case 9:
        return UserProfession.scientist;
      case 10:
        return UserProfession.journalist;
      case 11:
        return UserProfession.pilot;
      case 12:
        return UserProfession.firefighter;
      case 13:
        return UserProfession.policeOfficer;
      case 14:
        return UserProfession.softwareDeveloper;
      case 15:
        return UserProfession.dataScientist;
      case 16:
        return UserProfession.chef;
      case 17:
        return UserProfession.pharmacist;
      case 18:
        return UserProfession.electrician;
      case 19:
        return UserProfession.plumber;
      case 20:
        return UserProfession.mechanic;
      case 21:
        return UserProfession.dentist;
      case 22:
        return UserProfession.veterinarian;
      case 23:
        return UserProfession.psychologist;
      case 24:
        return UserProfession.writer;
      case 25:
        return UserProfession.photographer;
      case 26:
        return UserProfession.marketer;
      case 27:
        return UserProfession.salesperson;
      case 28:
        return UserProfession.farmer;
      case 29:
        return UserProfession.entrepreneur;
      case 30:
        return UserProfession.financialAnalyst;
      case 31:
        return UserProfession.businessConsultant;
      case 32:
        return UserProfession.civilServant;
      case 33:
        return UserProfession.militaryOfficer;
      case 34:
        return UserProfession.actor;
      case 35:
        return UserProfession.socialWorker;
      case 36:
        return UserProfession.fashionDesigner;
      case 37:
        return UserProfession.graphicDesigner;
      case 38:
        return UserProfession.webDeveloper;
      case 39:
        return UserProfession.contentCreator;
      case 40:
        return UserProfession.researcher;
      default:
        return UserProfession.doctor;
    }
  }

  @override
  void write(BinaryWriter writer, UserProfession obj) {
    switch (obj) {
      case UserProfession.doctor:
        writer.writeByte(0);
        break;
      case UserProfession.engineer:
        writer.writeByte(1);
        break;
      case UserProfession.teacher:
        writer.writeByte(2);
        break;
      case UserProfession.lawyer:
        writer.writeByte(3);
        break;
      case UserProfession.accountant:
        writer.writeByte(4);
        break;
      case UserProfession.nurse:
        writer.writeByte(5);
        break;
      case UserProfession.architect:
        writer.writeByte(6);
        break;
      case UserProfession.artist:
        writer.writeByte(7);
        break;
      case UserProfession.musician:
        writer.writeByte(8);
        break;
      case UserProfession.scientist:
        writer.writeByte(9);
        break;
      case UserProfession.journalist:
        writer.writeByte(10);
        break;
      case UserProfession.pilot:
        writer.writeByte(11);
        break;
      case UserProfession.firefighter:
        writer.writeByte(12);
        break;
      case UserProfession.policeOfficer:
        writer.writeByte(13);
        break;
      case UserProfession.softwareDeveloper:
        writer.writeByte(14);
        break;
      case UserProfession.dataScientist:
        writer.writeByte(15);
        break;
      case UserProfession.chef:
        writer.writeByte(16);
        break;
      case UserProfession.pharmacist:
        writer.writeByte(17);
        break;
      case UserProfession.electrician:
        writer.writeByte(18);
        break;
      case UserProfession.plumber:
        writer.writeByte(19);
        break;
      case UserProfession.mechanic:
        writer.writeByte(20);
        break;
      case UserProfession.dentist:
        writer.writeByte(21);
        break;
      case UserProfession.veterinarian:
        writer.writeByte(22);
        break;
      case UserProfession.psychologist:
        writer.writeByte(23);
        break;
      case UserProfession.writer:
        writer.writeByte(24);
        break;
      case UserProfession.photographer:
        writer.writeByte(25);
        break;
      case UserProfession.marketer:
        writer.writeByte(26);
        break;
      case UserProfession.salesperson:
        writer.writeByte(27);
        break;
      case UserProfession.farmer:
        writer.writeByte(28);
        break;
      case UserProfession.entrepreneur:
        writer.writeByte(29);
        break;
      case UserProfession.financialAnalyst:
        writer.writeByte(30);
        break;
      case UserProfession.businessConsultant:
        writer.writeByte(31);
        break;
      case UserProfession.civilServant:
        writer.writeByte(32);
        break;
      case UserProfession.militaryOfficer:
        writer.writeByte(33);
        break;
      case UserProfession.actor:
        writer.writeByte(34);
        break;
      case UserProfession.socialWorker:
        writer.writeByte(35);
        break;
      case UserProfession.fashionDesigner:
        writer.writeByte(36);
        break;
      case UserProfession.graphicDesigner:
        writer.writeByte(37);
        break;
      case UserProfession.webDeveloper:
        writer.writeByte(38);
        break;
      case UserProfession.contentCreator:
        writer.writeByte(39);
        break;
      case UserProfession.researcher:
        writer.writeByte(40);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
