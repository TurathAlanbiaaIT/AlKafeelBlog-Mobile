class ApiEndPoints {
  static var auth = Auth("/mobile-app/v2");
  static var profile = Profile("/mobile-app/v2");
  static var emailVerification = EmailVerification("/mobile-app/v2");
  static var categories = Categories("/mobile-app/v2");
  static var posts = Posts("/mobile-app/v2");
  static var myPosts = MyPosts("/mobile-app/v2");
  static var reposts = Reports("/mobile-app/v2");
  static var comments = Comments("/mobile-app/v2");
}

class Auth {
  Auth(prefix) {
    register = "$prefix/auth/register";
    login = "$prefix/auth/login";
    loginByProvider = "$prefix/auth/login-by-provider";
    me = "$prefix/auth/me";
    refresh = "$prefix/auth/refresh";
    logout = "$prefix/auth/logout";
  }
  late final String? register;
  late final String? login;
  late final String? loginByProvider;
  late final String? me;
  late final String? refresh;
  late final String? logout;
}

class Profile {
  Profile(prefix) {
    changeInfo = "$prefix/profile/change-info";
    changeEmail = "$prefix/profile/change-email";
    changePassword = "$prefix/profile/change-password";
    changeAvatar = "$prefix/profile/change-avatar";
  }

  late final String? changeInfo;
  late final String? changeEmail;
  late final String? changePassword;
  late final String? changeAvatar;
}

class EmailVerification {
  EmailVerification(prefix) {
    sendToken = "$prefix/email/send";
    verifyToken = "$prefix/email/verify";
  }

  late final String? sendToken;
  late final String? verifyToken;
}

class Categories {
  Categories(prefix) {
    all = "$prefix/categories";
  }

  late final String? all;
}

class Posts {
  Posts(prefix) {
    all = "$prefix/posts";
    show = "$prefix/posts/{PARAM}";
  }

  late final String? all;
  late final String? show;
}

class MyPosts {
  MyPosts(prefix) {
    all = "$prefix/my-posts";
    show = "$prefix/my-posts/{id}";
    store = "$prefix/my-posts";
    update = "$prefix/my-posts/{PARAM}/update";
    changeImage = "$prefix/my-posts/{PARAM}/change-image";
    delete = "$prefix/my-posts/{PARAM}/delete";
  }

  late final String? all;
  late final String? show;
  late final String? store;
  late final String? update;
  late final String? changeImage;
  late final String? delete;
}

class Reports {
  Reports(prefix) {
    store = "$prefix/posts/{PARAM}/reports";
  }

  late final String? store;
}

class Comments {
  Comments(prefix) {
    all = "$prefix/posts/{PARAM}/comments";
    store = "$prefix/posts/{PARAM}/comments";
    disable = "$prefix/posts/{PARAM}/comments/{PARAM}";
    delete = "$prefix/posts/{PARAM}/comments/{PARAM}";
  }

  late final String? all;
  late final String? store;
  late final String? disable;
  late final String? delete;
}
