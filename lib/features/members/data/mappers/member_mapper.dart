import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/member_entity.dart';

extension MemberMapper on Member {
  MemberEntity toEntity() {
    return MemberEntity(
      id: id,
      groupId: groupId,
      fullName: fullName,
      photoUrl: photoUrl,
      familyInfo: familyInfo,
      profession: profession,
      education: education,
      ministry: ministry,
      conversionDate: conversionDate,
      baptismDate: baptismDate,
      temperament: temperament,
      prayerFrequency: PrayerFrequency.values.firstWhere(
            (e) => e.name == prayerFrequency,
        orElse: () => PrayerFrequency.weekly,
      ),
      status: MemberStatus.values.firstWhere(
            (e) => e.name == status,
        orElse: () => MemberStatus.active,
      ),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension MemberEntityMapper on MemberEntity {
  MembersCompanion toCompanion() {
    return MembersCompanion(
      id: Value(id),
      groupId: Value(groupId),
      fullName: Value(fullName),
      photoUrl: Value(photoUrl),
      familyInfo: Value(familyInfo),
      profession: Value(profession),
      education: Value(education),
      ministry: Value(ministry),
      temperament: Value(temperament),
      conversionDate: Value(conversionDate),
      baptismDate: Value(baptismDate),
      prayerFrequency: Value(prayerFrequency.name),
      status: Value(status.name),
      updatedAt: Value(DateTime.now()),
    );
  }
}