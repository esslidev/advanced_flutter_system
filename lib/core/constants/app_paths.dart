class AppPaths {
  static FilesPaths get files => FilesPaths();

  static IconsPaths get icons => IconsPaths();

  static ImagesPaths get images => ImagesPaths();

  static VectorsPaths get vectors => VectorsPaths();

  static RoutesPaths get routes => RoutesPaths();
}

class FilesPaths {
  //...
}

class IconsPaths {
  final String favIcon = 'assets/icons/favicon.png';
  final String icon = 'assets/icons/icon.png';
}

class ImagesPaths {
  final String logo = 'assets/images/logo.png';
  final String defaultProfilePicture =
      'assets/images/default-profile-picture.jpg';
}

class VectorsPaths {
// Home nav icons paths
  final String logo = 'assets/vectors/logo.svg';
  final String defaultProfilePicture =
      'assets/vectors/default-profile-picture.svg';
  final String googleIcon = 'assets/vectors/google-icon.svg';
  final String xIcon = 'assets/vectors/x-icon.svg';
  final String facebookIcon = 'assets/vectors/facebook-icon.svg';
  final String microsoftIcon = 'assets/vectors/microsoft-icon.svg';
  final String notificationIcon = 'assets/vectors/notification-icon.svg';
  final String searchIcon = 'assets/vectors/search-icon.svg';
  final String trendingUpIcon = 'assets/vectors/trending-up-icon.svg';
  final String trendingDownIcon = 'assets/vectors/trending-down-icon.svg';
  final String emailIcon = 'assets/vectors/email-icon.svg';
  final String passwordIcon = 'assets/vectors/password-icon.svg';
  final String homeIcon = 'assets/vectors/home-icon.svg';
  final String dashboardIcon = 'assets/vectors/dashboard-icon.svg';
  final String usersIcon = 'assets/vectors/users-icon.svg';
  final String userIcon = 'assets/vectors/user-icon.svg';
  final String userPlusIcon = 'assets/vectors/user-plus-icon.svg';
  final String mealPlanIcon = 'assets/vectors/meal-plan-icon.svg';
  final String fitnessPlanIcon = 'assets/vectors/fitness-plan-icon.svg';
  final String settingsIcon = 'assets/vectors/settings-icon.svg';
  final String signOutIcon = 'assets/vectors/sign-out-icon.svg';
  final String greaterThanIcon = 'assets/vectors/greater-than-icon.svg';
}

class RoutesPaths {
  final String signInScreen = '/sign-in';
  final String signUpScreen = '/sign-up';
  final String introScreen = '/intro';
  final String homeScreen = '/home';
  final String dashboardScreen = '/home/dashboard';
  final String badRoutingScreen = '/bad-routing';

  String getRouteName(String route) {
    switch (route) {
      case '/sign-in':
        return 'Sign In';
      case '/sign-up':
        return 'Sign Up';
      case '/intro':
        return 'Intro';
      case '/home':
        return 'Home';
      case '/home/dashboard':
        return 'Dashboard';
      case '/bad-routing':
        return 'Bad Routing';
      default:
        return 'Unknown Route';
    }
  }
}
