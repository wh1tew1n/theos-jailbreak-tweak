#import <Preferences/Preferences.h>
#import <UIKit/UIKit.h>

@interface AnimePhoneListController : PSListController
@end

@implementation AnimePhoneListController

- (id)specifiers {
    if (!_specifiers) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
    }
    return _specifiers;
}

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"AnimePhone";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Anime-styled navigation bar
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.0 green:0.75 blue:0.88 alpha:1.0];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    NSDictionary *attributes = @{
        NSForegroundColorAttributeName : [UIColor whiteColor],
        NSFontAttributeName : [UIFont boldSystemFontOfSize:18.0]
    };
    self.navigationController.navigationBar.titleTextAttributes = attributes;
}

@end
