enum PrayerFrequency { daily, twiceWeekly, weekly }
enum MemberStatus { active, inactive }

class MemberEntity {
  final String id;
  final String groupId;
  final String fullName;
  final String? photoUrl;
  final String? familyInfo;
  final String? profession;
  final String? education;
  final String? ministry;
  final DateTime? conversionDate;
  final DateTime? baptismDate;
  final String? temperament;
  final PrayerFrequency prayerFrequency;
  final MemberStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const MemberEntity({
    required this.id,
    required this.groupId,
    required this.fullName,
    this.photoUrl,
    this.familyInfo,
    this.profession,
    this.education,
    this.ministry,
    this.conversionDate,
    this.baptismDate,
    this.temperament,
    this.prayerFrequency = PrayerFrequency.weekly,
    this.status = MemberStatus.active,
    required this.createdAt,
    required this.updatedAt,
  });

  MemberEntity copyWith({
    String? fullName,
    String? photoUrl,
    String? familyInfo,
    String? profession,
    String? education,
    String? ministry,
    DateTime? conversionDate,
    DateTime? baptismDate,
    String? temperament,
    PrayerFrequency? prayerFrequency,
    MemberStatus? status,
    DateTime? updatedAt,
  }) {
    return MemberEntity(
      id: id,
      groupId: groupId,
      fullName: fullName ?? this.fullName,
      photoUrl: photoUrl ?? this.photoUrl,
      familyInfo: familyInfo ?? this.familyInfo,
      profession: profession ?? this.profession,
      education: education ?? this.education,
      ministry: ministry ?? this.ministry,
      conversionDate: conversionDate ?? this.conversionDate,
      baptismDate: baptismDate ?? this.baptismDate,
      temperament: temperament ?? this.temperament,
      prayerFrequency: prayerFrequency ?? this.prayerFrequency,
      status: status ?? this.status,
      createdAt: createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}