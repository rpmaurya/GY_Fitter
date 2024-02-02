import 'package:fitness_app/constans/image_path_constants.dart';

class HomeConstants {
  static String titleName = 'GY-Fitter';
  static String searchDetail = 'Search pilates, abs workout etc... ';
  static String activitiesName = 'Daily Activities';

  static List<Map<String, dynamic>> dailyActivities = [
    {
      'imageActivities': ImagePath.caloriesIcon,
      'detail': '430 kcal',
      'help': 'Calories'
    },
    {
      'imageActivities': ImagePath.darkWorkoutIcon,
      'detail': '8 workouts',
      'help': 'Trainings'
    },
    {
      'imageActivities': ImagePath.timeIcon,
      'detail': '20 mines',
      'help': 'Durations'
    },
  ];
  static String workout = 'Continue Workout';
  static String workoutViewAll = 'View All';
  static List<Map<String, dynamic>> continueWorkout = [
    {
      'workVideo':
          'https://player.vimeo.com/external/405409082.sd.mp4?s=061da58244992364e56098cb9411453e0178626d&profile_id=164&oauth2_token_id=57447761',
      'workoutName': 'Power Body Workout',
      'exercises': '10 Exercises',
      'time': '2 hr 10 min',
    },
    {
      'workVideo':
          'https://player.vimeo.com/external/371831336.sd.mp4?s=a756dc91a424fa40f37f1183ed19877bfc8e99ad&profile_id=164&oauth2_token_id=57447761',
      'workoutName': 'Battle Rope Workout',
      'exercises': '7 Exercises',
      'time': '2 hr 15 min',
    },
  ];
  static List weightTraining = [
    'Weight Training',
    'Yoga',
    'Cardio',
    'Upper Body',
  ];
  static String trending = 'Trending';
  static String trendingViewAll = 'View All';
  static List<Map<String, dynamic>> trendingWorkout = [
    {
      'trendingVideo':
          'https://player.vimeo.com/external/263604445.sd.mp4?s=321a7199a53d01976dd652692184649c1863f347&profile_id=164&oauth2_token_id=57447761',
      'trendingName': 'Power Body Workout',
      'exercises': '10 Exercises',
    },
    {
      'trendingVideo':
          'https://player.vimeo.com/external/214459832.sd.mp4?s=434be1484bba72c4fbbee25ea5156ddd7fa03d3a&profile_id=164&oauth2_token_id=57447761',
      'trendingName': 'Battle Rope Workout',
      'exercises': '7 Exercises',
    },
    {
      'trendingVideo':
          'https://player.vimeo.com/external/416845967.sd.mp4?s=f66bf376070be8b633073db2af860839e5cb1aab&profile_id=164&oauth2_token_id=57447761',
      'trendingName': 'Battle Rope Workout',
      'exercises': '8 Exercises',
    },
  ];
  static String popular = 'Popular Trainers';
  static List<Map<String, dynamic>> popularTrainers = [
    {
      'trainersImage':
          'https://www.mmagyms.net/wp-content/uploads/2020/01/Personal-Trainer-Packages.png',
      'trainersName': 'Edward W.',
      'trainersPart': 'HIT',
      'trainerDetails':
          'Experienced gym trainer dedicated to helping clients achieve their fitness goals through personalized workout plans and motivational support. Specialized in strength training, cardiovascular exercises, and nutrition guidance for a holistic approach to health and wellness.'
    },
    {
      'trainersImage':
          'https://tse2.mm.bing.net/th?id=OIP.-xuxpvtSiguv51uFOpjXcwHaE7&pid=Api&P=0&h=220',
      'trainersName': 'Rich Errol',
      'trainersPart': 'Strength',
      'trainerDetails':
          'Versatile fitness professional adept in both yoga and gym training. Passionate about fostering physical and mental well-being through tailored yoga sessions and effective gym workouts, promoting holistic health for clients.'
    },
    {
      'trainersImage':
          'https://www.pts.sg/wp-content/uploads/2017/12/female-personal-trainer-singapore-e1514778311137-845x423.jpg',
      'trainersName': 'Eliana R.',
      'trainersPart': 'Yoga',
      'trainerDetails':
          'Dedicated yoga instructor fostering well-being through mindful practice. Expert in guiding individuals in yoga poses, breathwork, and relaxation techniques.'
    },
    {
      'trainersImage':
          'https://tse3.mm.bing.net/th?id=OIP.9qF1U6-yNZFoYfEWPHCWVAHaE7&pid=Api&P=0&h=220',
      'trainersName': 'Rubina Evan',
      'trainersPart': 'Boxing',
      'trainerDetails':
          'Combining expertise in yoga and nutrition, I am a dedicated professional guiding individuals towards holistic well-being. Crafting personalized yoga sessions and dietary plans, I empower clients to enhance physical and mental health. With a focus on balance, I aim to inspire sustainable lifestyle changes for optimal health and vitality.'
    },
  ];
  static String joinImage =
      'https://images.pexels.com/photos/1552252/pexels-photo-1552252.jpeg?auto=compress&cs=tinysrgb&w=1600';
  static String joinTitle = 'Take it Seriously';
  static String joinDetail = 'Join more workout programs.';
  static String joinNowButton = 'JOIN NOW';
}
