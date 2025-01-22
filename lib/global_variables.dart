class GlobalVariables {
  static final GlobalVariables _instance = GlobalVariables._internal();

  factory GlobalVariables() {
    return _instance;
  }

  GlobalVariables._internal();

  // Globale variabelen
  String horseName = "Olaf";
  String feeling = "happy";
  bool recordingStatus = false;
  String intensity = "low";
  int target = 3;
  int progress = 5;
  double trophyProgress = 0.05;

}
