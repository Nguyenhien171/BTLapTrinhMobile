class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({required this.image, required this.title, required this.description});
}

List<OnboardingModel> contents = [
  OnboardingModel(
      title: 'Easy Time Management',
      image: 'assets/step1.png',
      description: "With management based on priority and daily tasks, "
          "it will give you convenience in managing and determining the tasks that must be done first "
  ),
  OnboardingModel(
      title: 'Increase Work Effectiveness',
      image: 'assets/step2.png',
      description: "Time management and the determination of more important "
          "tasks will give your job statistics better and always improve"
  ),
  OnboardingModel(
      title: 'Reminder Notification',
      image: 'assets/step3.png',
      description: "The advantage of this application is that it also "
          "provides reminders for you so you don't forget to keep doing your "
          "assignments well and according to the time you have set"
  ),
];