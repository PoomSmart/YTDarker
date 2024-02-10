#import <YouTubeHeader/YTColor.h>
#import <YouTubeHeader/YTColorPalette.h>
#import <YouTubeHeader/YTCommonColorPalette.h>

%hook YTColdConfig

- (BOOL)enableDarkerDarkMode {
    return YES;
}

- (BOOL)useDarkerPaletteBgColorForElements {
    return YES;
}

- (BOOL)useDarkerPaletteTextColorForElements {
    return YES;
}

- (BOOL)uiSystemsClientGlobalConfigUseDarkerPaletteBgColorForNative {
    return YES;
}

- (BOOL)uiSystemsClientGlobalConfigUseDarkerPaletteTextColorForNative {
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

- (UIColor *)background1 {
    return [self pageStyle] == 1 ? [%c(YTColor) black3] : %orig;
}

- (UIColor *)raisedBackground {
    return [self pageStyle] == 1 ? [%c(YTColor) black3] : %orig;
}

%end

%hook YTAccountPanelBodyViewController

- (UIColor *)backgroundColor:(NSInteger)pageStyle {
    if (pageStyle == 1) {
        if (%c(YTCommonColorPalette))
            return [[%c(YTCommonColorPalette) darkPalette] background1];
        return [[%c(YTColorPalette) darkPalette] background1];
    }
    return %orig;
}

%end