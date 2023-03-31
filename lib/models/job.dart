class Job {
  String company;
  String logoUrl;
  bool isMark;
  String title;
  String location;
  String time;
  List<String> req;
  Job(this.company, this.logoUrl, this.isMark, this.title, this.location,
      this.time, this.req);

  static List<Job> generateJobs() {
    return [
      Job(
        'Google',
        'assets/images/google_logo.png',
        false,
        'Software Development Engineer',
        'USA',
        'Full Time',
        [
          'Experience in Flutter',
          'Experience in Dart',
          'Experience in Firebase',
          'Experience in Google Cloud Platform',
        ],
      ),
      Job(
        'Airbnb',
        'assets/images/airbnb_logo.png',
        true,
        'Software Development Engineer',
        'London',
        'Full Time',
        [
          'Experience in Flutter',
          'Experience in Dart',
          'Experience in Firebase',
          'Experience in Google Cloud Platform',
        ],
      ),
      Job(
        'LinkedIn',
        'assets/images/linkedin_logo.png',
        false,
        'Software Development Engineer',
        'USA',
        'Full Time',
        [
          'Experience in Flutter',
          'Experience in Dart',
          'Experience in Firebase',
          'Experience in Google Cloud Platform',
        ],
      ),
      Job(
        'Adobe',
        'assets/images/adobe.png',
        false,
        'Software Development Engineer',
        'USA',
        'Full Time',
        [
          'Experience in Flutter',
          'Experience in Dart',
          'Experience in Firebase',
          'Experience in Google Cloud Platform',
        ],
      ),
      Job(
        'Facebook',
        'assets/images/facebook.png',
        false,
        'Software Development Engineer',
        'USA',
        'Full Time',
        [
          'Experience in Flutter',
          'Experience in Dart',
          'Experience in Firebase',
          'Experience in Google Cloud Platform',
        ],
      ),
      Job(
        'Instagram',
        'assets/images/instagram.png',
        false,
        'Software Development Engineer',
        'USA',
        'Full Time',
        [
          'Experience in Flutter',
          'Experience in Dart',
          'Experience in Firebase',
          'Experience in Google Cloud Platform',
        ],
      ),
    ];
  }
}
