import 'package:hive/hive.dart';
part 'profession_enum.g.dart';  

@HiveType(typeId: 1)  // Unique typeId for Hive
enum UserProfession {
  @HiveField(0)
  doctor,
  
  @HiveField(1)
  engineer,

  @HiveField(2)
  teacher,

  @HiveField(3)
  lawyer,

  @HiveField(4)
  accountant,

  @HiveField(5)
  nurse,

  @HiveField(6)
  architect,

  @HiveField(7)
  artist,

  @HiveField(8)
  musician,

  @HiveField(9)
  scientist,

  @HiveField(10)
  journalist,

  @HiveField(11)
  pilot,

  @HiveField(12)
  firefighter,

  @HiveField(13)
  policeOfficer,

  @HiveField(14)
  softwareDeveloper,

  @HiveField(15)
  dataScientist,

  @HiveField(16)
  chef,

  @HiveField(17)
  pharmacist,

  @HiveField(18)
  electrician,

  @HiveField(19)
  plumber,

  @HiveField(20)
  mechanic,

  @HiveField(21)
  dentist,

  @HiveField(22)
  veterinarian,

  @HiveField(23)
  psychologist,

  @HiveField(24)
  writer,

  @HiveField(25)
  photographer,

  @HiveField(26)
  marketer,

  @HiveField(27)
  salesperson,

  @HiveField(28)
  farmer,

  @HiveField(29)
  entrepreneur,

  @HiveField(30)
  financialAnalyst,

  @HiveField(31)
  businessConsultant,

  @HiveField(32)
  civilServant,

  @HiveField(33)
  militaryOfficer,

  @HiveField(34)
  actor,

  @HiveField(35)
  socialWorker,

  @HiveField(36)
  fashionDesigner,

  @HiveField(37)
  graphicDesigner,

  @HiveField(38)
  webDeveloper,

  @HiveField(39)
  contentCreator,

  @HiveField(40)
  researcher,
}
