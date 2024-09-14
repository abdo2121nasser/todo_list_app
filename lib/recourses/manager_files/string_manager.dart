class StringManager

{
static  UiStrings ui=UiStrings();
 static  LogicStrings logic=LogicStrings();

}

class UiStrings{
   String kSignInWord = 'Sign In';
   String kPasswordWord = 'Password';
   String kLoginWord = 'Login';
   String kSignInMessageWord = 'Didn’t have any account? ';
   String kSignUpHereWord = 'Sign Up here';
   String kPhoneNumberIsEmpty = 'phone number field is empty';
   String kPhoneNumberInValid = 'phone number is invalid';
   String kPasswordLengthError = 'password should be > 6';
   String kPasswordIsEmpty = 'password field is empty';

   String kSignUpWord = 'Sign Up';
   String kSignInHereWord = 'Sign In here';
   String kSignUpMessageWord = 'Already Have An Account? ';

   String kNameWord = 'Name';
   String kExperienceWord = 'Years of Experience';
   String kAddressWord = 'Address';
   String kJuniorWord = 'junior';
   String kSeniorWord = 'senior';
   String kFreshWord = 'fresh';
   String kMidLevelWord = 'midLevel';
   String kSignUpEmptyFieldMessage = 'fill all the fields';
   String kError = 'something went wrong';


   String kLogo    = 'Logo';
   String kProfile = 'Profile';
   String kPhone   = 'Phone';
   String kLevel    = 'level';
   String kExperience = 'Years of experience';
   String kLocation = 'Location';


   String kMyTasksWord = 'My Tasks';



}
class LogicStrings{

   String kRegisterEndPoint = '/auth/register';
   String kLoginEndPoint = '/auth/login';
   String kProfileEndPoint = '/auth/profile';
   String kLogOutEndPoint = '/auth/logout';

   String kRefreshTokenEndPoint = '/auth/refresh-token?';
   String kRefreshTokenQuery = 'token=';

   String kPhoneNumber = 'phone';
   String kPassword = 'password';
   String kName = 'displayName';
   String kExperience = 'experienceYears';
   String kAddress = 'address';
   String kLevel = 'level';


   String kTokenBox = 'token box';

   String kProfileBox = 'profile box';
   String kMyProfileModel = 'my profile model';


   String kUserId = '_id';
   String kAccessToken = 'access_token';
   String kRefreshToken = 'refresh_token';


}