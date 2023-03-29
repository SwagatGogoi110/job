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
        'Google',
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
        'Google',
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
    ];
  }
}
