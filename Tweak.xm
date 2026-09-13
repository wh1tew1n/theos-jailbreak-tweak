#import <UIKit/UIKit.h>

// 🌸 AnimePhone Sakura Edition 🌸
// Transform the Phone app into beautiful anime style with falling cherry blossoms!

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

// Create falling sakura animation
static void addSakuraAnimation(UIView *view) {
    // Create emitter layer for sakura petals
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(view.bounds.size.width / 2.0, -50);
    emitterLayer.emitterShape = kCAEmitterShapeCircle;
    emitterLayer.emitterSize = CGSizeMake(view.bounds.size.width, 20);
    
    // Create sakura petal cell
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.birthRate = 15;
    cell.lifetime = 8.0;
    cell.velocity = 30;
    cell.velocityVariation = 10;
    cell.emissionRange = M_PI * 2;
    cell.spin = 2;
    cell.spinVariation = 3;
    cell.scale = 0.02;
    cell.scaleVariation = 0.01;
    
    // Create sakura petal image
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(10, 10), NO, 0);
    [[UIColor colorWithRed:1.0 green:0.75 blue:0.88 alpha:0.7] setFill];
    UIBezierPath *petalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 10, 10)];
    [petalPath fill];
    UIImage *petalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    cell.contents = (id)petalImage.CGImage;
    emitterLayer.emitterCells = @[cell];
    
    [view.layer addSublayer:emitterLayer];
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
    
    // Add sakura animation only for sakura theme
    if ([selectedTheme isEqualToString:@"sakura"] && animationsEnabled) {
        addSakuraAnimation(self.view);
    }
}

- (void)viewWillAppear:(BOOL)animated {
    %orig;
    
    loadPreferences();
    
    if (!animeEnabled || !animationsEnabled) return;
    
    // Smooth fade-in animation
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.fromValue = @0.0;
    fadeIn.toValue = @1.0;
    fadeIn.duration = 0.5f * (1.0f / animationSpeed);
    [self.view.layer addAnimation:fadeIn forKey:@"animeEnter"];
    
    // Add scale animation for sakura theme
    if ([selectedTheme isEqualToString:@"sakura"]) {
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = @0.95;
        scaleAnimation.toValue = @1.0;
        scaleAnimation.duration = 0.6f * (1.0f / animationSpeed);
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        [self.view.layer addAnimation:scaleAnimation forKey:@"sakuraScale"];
    }
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    %orig;
    
    loadPreferences();
    
    if (!animeEnabled || !animationsEnabled) return;
    
    // Add sakura petal animation on button press
    if ([selectedTheme isEqualToString:@"sakura"]) {
        CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        pulse.fromValue = @1.0;
        pulse.toValue = @1.1;
        pulse.duration = 0.1f * (1.0f / animationSpeed);
        pulse.autoreverses = YES;
        [self.layer addAnimation:pulse forKey:@"sakuraPulse"];
    }
}

%end

// Hook UITabBar for special sakura effects
%hook UITabBar

- (void)layoutSubviews {
    %orig;
    
    loadPreferences();
    
    if (!animeEnabled) return;
    
    if ([selectedTheme isEqualToString:@"sakura"]) {
        // Add sakura glow effect to tab bar
        CAGradientLayer *glowLayer = [CAGradientLayer layer];
        glowLayer.frame = self.bounds;
        glowLayer.colors = @[(id)[UIColor colorWithRed:1.0 green:0.75 blue:0.88 alpha:0.3].CGColor,
                            (id)[UIColor colorWithRed:1.0 green:0.75 blue:0.88 alpha:0.1].CGColor];
        glowLayer.startPoint = CGPointMake(0, 0);
        glowLayer.endPoint = CGPointMake(1, 1);
        [self.layer insertSublayer:glowLayer atIndex:0];
    }
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
