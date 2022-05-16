#import "../YouTubeHeader/YTColor.h"
#import "../YouTubeHeader/YTColorPalette.h"
#import "../YouTubeHeader/YTCommonColorPalette.h"

%hook YTColdConfig

- (BOOL)enableDarkerDarkMode {
    return YES;
}

%end

%hook YTColorPalette

- (UIColor *)brandBackgroundPrimary {
    return [self pageStyle] == 1 ? [%c(YTColor) black3] : %orig;
}

%end

%hook YTCommonColorPalette

- (UIColor *)brandBackgroundPrimary {
    return [self pageStyle] == 1 ? [%c(YTColor) black3] : %orig;
}

%end

%hook YTAccountPanelBodyViewController

- (UIColor *)backgroundColor:(NSInteger)pageStyle {
    return pageStyle == 1 ? [[%c(YTColorPalette) darkPalette] background1] : %orig;
}

%end