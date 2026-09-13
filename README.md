# 🌸 AnimePhone - Transform Your iPhone Phone App Into Anime Art 🌸

![Version](https://img.shields.io/badge/version-1.0.0-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![iOS](https://img.shields.io/badge/iOS-14%2B-lightgrey)
![THEOS](https://img.shields.io/badge/built%20with-THEOS-FF69B4)
![Language](https://img.shields.io/badge/Language-English%20%7C%20Russian-blue)

> *Transform your iPhone's Phone application into a breathtaking anime-styled masterpiece with AnimePhone - the ultimate jailbreak tweak for anime enthusiasts!* ✨

---

## ✨ Features

### 🎨 Stunning Visual Transformations
- **Anime-Styled Interface**: Beautiful gradient backgrounds with cherry blossom-inspired color schemes
- **Multiple Themes**: 
  - 🌸 **Sakura** - Soft pink cherry blossom aesthetic
  - 🌙 **Night Sky** - Mystical deep space purple theme
  - 🌊 **Summer** - Refreshing ocean blue vibes
- **Smooth Animations**: Elegant entrance effects and transitions
- **Custom Shadows & Depth**: Professional 3D effects for modern UI
- **Rounded Design**: Soft, anime-friendly corner radius throughout

### ⚙️ Advanced Customization
- **Toggle On/Off**: Enable or disable anime style at any time
- **Animation Control**: Adjust animation speed from 0.5x to 2.0x
- **Enable/Disable Effects**: Fine-tune which effects to use
- **Real-time Updates**: Changes apply instantly without respring

### 🌍 Multilingual Support
- **English** 🇬🇧 - Full English localization
- **Русский (Russian)** 🇷🇺 - Complete Russian translation
- Switch languages directly from preferences

### 🎪 Preference Loader Integration
- **Anime-Styled Settings**: Preferences app features anime-themed UI
- **Beautiful Header**: Gradient anime-styled header with custom fonts
- **Intuitive Controls**: Smooth switches, sliders, and segments
- **Real-time Preview**: See changes applied instantly to your device

---

## 📋 System Requirements

- **iOS Version**: 14.0 or later (tested up to iOS 17)
- **Processor**: ARM64 / ARM64e (iPhone 6s and later)
- **Jailbreak**: Compatible with Checkra1n, Palera1n, and other modern jailbreaks
- **Dependencies**:
  - MobileSubstrate
  - PreferenceLoader

---

## 🚀 Installation

### From Cydia/Sileo:
1. Add the repository to your package manager
2. Search for "AnimePhone"
3. Install the package
4. Respring your device
5. Open Settings → AnimePhone to configure

### Manual Installation (Developers):
```bash
# Clone this repository
git clone https://github.com/wh1tew1n/theos-jailbreak-tweak.git
cd theos-jailbreak-tweak

# Build the package
make clean
make package

# Install to device
make install

# Respring
make install RESPRING=1
```

---

## 🎯 Usage Guide

### First Time Setup
1. **Open Settings** on your iPhone
2. **Navigate to AnimePhone** preferences
3. **Enable Anime Style** toggle
4. **Select Your Favorite Theme**:
   - 🌸 Sakura (recommended for beginners)
   - 🌙 Night Sky (perfect for night mode users)
   - 🌊 Summer (great for bright environments)
5. **Configure Animation Speed** using the slider
6. **Choose Your Language** - English or Русский
7. **Tap Save** and enjoy!

### Customization Tips
- **Performance Issues?** Disable animations or lower animation speed
- **Color Too Bold?** Try the Night Sky theme for softer colors
- **Want More Speed?** Increase animation speed to 2.0x
- **Language Support**: Switch between English and Russian instantly

---

## 🛠️ Technical Details

### Architecture
- **Language**: Objective-C with THEOS hooks
- **Hooking Framework**: Logos
- **Preference Storage**: Darwin Notifications + NSUserDefaults
- **UI Framework**: UIKit

### Hooked Components
- `UIViewController` - Main view styling and animations
- `UIButton` - Button anime-styling with borders and shadows
- `UITableViewCell` - Table cell anime transformations
- Navigation Bar - Custom gradient and colors

### Code Structure
```
AnimePhone/
├── Makefile              # Build configuration
├── Tweak.xm              # Main tweak implementation
├── control               # Package metadata
├── README.md             # This file
└── LICENSE               # MIT License
```

---

## 🎨 Anime Color Schemes

### Sakura Theme 🌸
```
Primary Color: RGB(255, 191, 224) - Cherry Blossom Pink
Accent: Soft gradients to white
Best for: Daytime, normal brightness
```

### Night Sky Theme 🌙
```
Primary Color: RGB(26, 13, 77) - Deep Purple
Accent: Mystery and elegance
Best for: Night mode, OLED screens
```

### Summer Theme 🌊
```
Primary Color: RGB(51, 204, 230) - Ocean Blue
Accent: Bright and refreshing
Best for: Bright environments, summer vibes
```

---

## 🔧 Development

### Building from Source
```bash
# Install THEOS
export THEOS=~/theos

# Clone repository
git clone https://github.com/wh1tew1n/theos-jailbreak-tweak.git
cd theos-jailbreak-tweak

# Build package
make package

# Install to connected device
make install
```

### Adding New Themes
1. Edit `Tweak.xm` and add a new color function:
```objc
static UIColor* getMyThemeColor() {
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}
```
2. Update preferences with new theme option
3. Rebuild and test

### Contributing Translations
1. Fork the repository
2. Add translations to preference files
3. Submit a pull request

---

## 🐛 Troubleshooting

### Tweak Not Appearing in Settings
- **Solution**: Respring device or use `killall -9 Preferences`
- **Check**: Verify PreferenceLoader is installed

### Animations Are Slow
- **Solution**: Reduce animation speed in preferences
- **Check**: Ensure device has enough free RAM

### Colors Look Different
- **Solution**: Adjust display settings on iPhone
- **Check**: Try different theme for comparison

### Changes Not Applying
- **Solution**: Respring or fully restart the Phone app
- **Check**: Ensure "Enable Anime Style" toggle is ON

---

## 📞 Support & Contact

- **GitHub Issues**: [Report Bugs](https://github.com/wh1tew1n/theos-jailbreak-tweak/issues)
- **Author**: wh1tew1n
- **Repository**: https://github.com/wh1tew1n/theos-jailbreak-tweak
- **Discussions**: Feel free to open discussions for feature requests

---

## 📄 License

MIT License - See LICENSE file for details

```
Copyright (c) 2024 wh1tew1n

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 🙏 Special Thanks

- **THEOS Community** - For the amazing jailbreak development framework
- **Anime Lovers Everywhere** - For inspiring this beautiful project
- **MobileSubstrate** - For runtime code injection capabilities
- **PreferenceLoader** - For easy preferences integration

---

## 🚀 Roadmap

### Version 1.0 (Current) ✅
- ✅ Core anime styling system
- ✅ Three beautiful themes
- ✅ Animation controls
- ✅ Bilingual support (EN/RU)
- ✅ Anime-styled preferences

### Version 1.1 (Planned) 🔄
- 🔄 Additional themes (Cyberpunk, Magical Girl, etc.)
- 🔄 Custom color picker
- 🔄 Sound effects integration
- 🔄 Character/Avatar customization

### Version 2.0 (Future) 🎯
- 🎯 App-wide anime theming
- 🎯 Particle effects
- 🎯 Custom fonts
- 🎯 More languages (日本語, 中文, etc.)

---

**AnimePhone** - Because your Phone app deserves to be as beautiful as anime! 🌸✨

*Made with 💖 for jailbreak enthusiasts and anime fans*
