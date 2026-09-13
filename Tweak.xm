#import <UIKit/UIKit.h>

// Anime Phone Tweak - Main Implementation
// Transform the Phone app into anime style!

// Get preferences
static BOOL animeEnabled = YES;
static BOOL animationsEnabled = YES;
static NSString *selectedTheme = @"sakura";
static float animationSpeed = 1.0f;
static NSString *appLanguage = @"en";

static void loadPreferences() {
    NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.wh1tew1n.animephone.prefs"];
    animeEnabled = [prefs boolForKey:@"animeEnabled"] ?: YES;
    animationsEnabled = [prefs boolForKey:@"animationsEnabled"] ?: YES;
    selectedTheme = [prefs stringForKey:@"selectedTheme"] ?: @"sakura";
    animationSpeed = [prefs floatForKey:@"animationSpeed"] ?: 1.0f;
    appLanguage = [prefs stringForKey:@"appLanguage"] ?: @"en";
}

// Anime color schemes
static UIColor* getSakuraColor() {
    return [UIColor colorWithRed:1.0 green:0.75 blue:0.88 alpha:1.0];
}

static UIColor* getNightSkyColor() {
    return [UIColor colorWithRed:0.1 green:0.05 blue:0.3 alpha:1.0];
}

static UIColor* getSummerColor() {
    return [UIColor colorWithRed:0.2 green:0.8 blue:0.9 alpha:1.0];
}

// Hook into Phone app UIViewController
%hook UIViewController

- (void)viewDidLoad {
    %orig;
    
    loadPreferences();
    
    if (!animeEnabled) return;
    
    UIColor *themeColor;
    
    if ([selectedTheme isEqualToString:@"sakura"]) {
        themeColor = getSakuraColor();
    } else if ([selectedTheme isEqualToString:@"nightsky"]) {
        themeColor = getNightSkyColor();
    } else {
        themeColor = getSummerColor();
    }
    
    // Apply gradient background
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)themeColor.CGColor, (id)[[UIColor colorWithWhite:0.95 alpha:1.0] CGColor]];
    gradient.locations = @[@0.0, @1.0];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    self.view.layer.cornerRadius = 20.0f;
    self.view.layer.masksToBounds = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    %orig;
    
    loadPreferences();
    
    if (!animeEnabled || !animationsEnabled) return;
    
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.fromValue = @0.0;
    fadeIn.toValue = @1.0;
    fadeIn.duration = 0.5f * (1.0f / animationSpeed);
    [self.view.layer addAnimation:fadeIn forKey:@"animeEnter"];
}

%end

// Hook UIButton to add anime style
%hook UIButton

- (void)layoutSubviews {
    %orig;
    
    loadPreferences();
    
    if (!animeEnabled) return;
    
    self.layer.cornerRadius = 12.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 2.0f;
    
    UIColor *themeColor = [selectedTheme isEqualToString:@"sakura"] ? getSakuraColor() : getNightSkyColor();
    self.layer.borderColor = themeColor.CGColor;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.2f;
    self.layer.shadowOffset = CGSizeMake(0, 4);
    self.layer.shadowRadius = 8.0f;
}

%end

// Hook UITableViewCell for anime styling
%hook UITableViewCell

- (void)layoutSubviews {
    %orig;
    
    loadPreferences();
    
    if (!animeEnabled) return;
    
    self.layer.cornerRadius = 15.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1.0f;
    
    UIColor *themeColor = getSakuraColor();
    self.layer.borderColor = themeColor.CGColor;
    
    self.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
}

%end

// Preference change listener
%ctor {
    CFNotificationCenterAddObserver(
        CFNotificationCenterGetDarwinNotifyCenter(),
        NULL,
        (CFNotificationCallback)loadPreferences,
        CFSTR("com.wh1tew1n.animephone.prefs/ReloadPrefs"),
        NULL,
        CFNotificationSuspensionBehaviorCoalesce
    );
    loadPreferences();
}
