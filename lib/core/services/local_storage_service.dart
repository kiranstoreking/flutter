import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _firstNameKey = 'firstName';
  static const String _lastNameKey = 'lastName';
  static const String _genderKey = 'gender';
  static const String _dateOfBirthKey = 'dateOfBirth';
  static const String _qualificationKey = 'qualification';
  static const String _rolePreferenceKey = 'rolePreference';
  static const String _locationKey = 'location';
  static const String _phoneKey = 'phone';
  static const String _emailKey = 'email';
  static const String _skillsKey = 'skills';
  static const String _experienceKey = 'experience';
  static const String _educationKey = 'education';
  static const String _projectsKey = 'projects';
  static const String _awardsKey = 'awards';
  static const String _aboutMeKey = 'aboutMe';

  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  LocalStorageService._();

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService._();
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  // Personal Info Methods
  Future<void> saveFirstName(String firstName) async {
    await _preferences?.setString(_firstNameKey, firstName);
  }

  String? getFirstName() {
    return _preferences?.getString(_firstNameKey);
  }

  Future<void> saveLastName(String lastName) async {
    await _preferences?.setString(_lastNameKey, lastName);
  }

  String? getLastName() {
    return _preferences?.getString(_lastNameKey);
  }

  Future<void> saveGender(String gender) async {
    await _preferences?.setString(_genderKey, gender);
  }

  String? getGender() {
    return _preferences?.getString(_genderKey);
  }

  Future<void> saveDateOfBirth(String dateOfBirth) async {
    await _preferences?.setString(_dateOfBirthKey, dateOfBirth);
  }

  String? getDateOfBirth() {
    return _preferences?.getString(_dateOfBirthKey);
  }

  // Qualification Methods
  Future<void> saveQualification(String qualification) async {
    await _preferences?.setString(_qualificationKey, qualification);
  }

  String? getQualification() {
    return _preferences?.getString(_qualificationKey);
  }

  // Role Preference Methods
  Future<void> saveRolePreference(String rolePreference) async {
    await _preferences?.setString(_rolePreferenceKey, rolePreference);
  }

  String? getRolePreference() {
    return _preferences?.getString(_rolePreferenceKey);
  }

  // Location Methods
  Future<void> saveLocation(String location) async {
    await _preferences?.setString(_locationKey, location);
  }

  String? getLocation() {
    return _preferences?.getString(_locationKey);
  }

  // Contact Methods
  Future<void> savePhone(String phone) async {
    await _preferences?.setString(_phoneKey, phone);
  }

  String? getPhone() {
    return _preferences?.getString(_phoneKey);
  }

  Future<void> saveEmail(String email) async {
    await _preferences?.setString(_emailKey, email);
  }

  String? getEmail() {
    return _preferences?.getString(_emailKey);
  }

  // Skills Methods
  Future<void> saveSkills(List<String> skills) async {
    await _preferences?.setStringList(_skillsKey, skills);
  }

  List<String> getSkills() {
    return _preferences?.getStringList(_skillsKey) ?? [];
  }

  // Experience Methods
  Future<void> saveExperience(String experience) async {
    await _preferences?.setString(_experienceKey, experience);
  }

  String? getExperience() {
    return _preferences?.getString(_experienceKey);
  }

  // Education Methods
  Future<void> saveEducation(String education) async {
    await _preferences?.setString(_educationKey, education);
  }

  String? getEducation() {
    return _preferences?.getString(_educationKey);
  }

  // Projects Methods
  Future<void> saveProjects(String projects) async {
    await _preferences?.setString(_projectsKey, projects);
  }

  String? getProjects() {
    return _preferences?.getString(_projectsKey);
  }

  // Awards Methods
  Future<void> saveAwards(String awards) async {
    await _preferences?.setString(_awardsKey, awards);
  }

  String? getAwards() {
    return _preferences?.getString(_awardsKey);
  }

  // About Me Methods
  Future<void> saveAboutMe(String aboutMe) async {
    await _preferences?.setString(_aboutMeKey, aboutMe);
  }

  String? getAboutMe() {
    return _preferences?.getString(_aboutMeKey);
  }

  // Get all user data
  Map<String, dynamic> getAllUserData() {
    return {
      'firstName': getFirstName(),
      'lastName': getLastName(),
      'gender': getGender(),
      'dateOfBirth': getDateOfBirth(),
      'qualification': getQualification(),
      'rolePreference': getRolePreference(),
      'location': getLocation(),
      'phone': getPhone(),
      'email': getEmail(),
      'skills': getSkills(),
      'experience': getExperience(),
      'education': getEducation(),
      'projects': getProjects(),
      'awards': getAwards(),
      'aboutMe': getAboutMe(),
    };
  }

  // Clear all data (for logout)
  Future<void> clearAllData() async {
    await _preferences?.clear();
  }

  // Check if user has completed onboarding
  bool hasCompletedOnboarding() {
    return getFirstName() != null &&
        getLastName() != null &&
        getGender() != null &&
        getDateOfBirth() != null &&
        getQualification() != null &&
        getRolePreference() != null &&
        getLocation() != null;
  }
}
