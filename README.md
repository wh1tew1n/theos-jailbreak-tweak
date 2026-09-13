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
  - 🌸 **Sakura** - Soft pink cherry blossom aesthetic with falling petals
  - 🌙 **Night Sky** - Mystical deep space purple theme
  - 🌊 **Summer** - Refreshing ocean blue vibes
- **Smooth Animations**: Elegant entrance effects and transitions
- **Custom Shadows & Depth**: Professional 3D effects for modern UI
- **Rounded Design**: Soft, anime-friendly corner radius throughout

### 🌸 Sakura Petal Animations
- **Falling Petals**: Beautiful cherry blossom petals falling through the interface
- **Physics-Based Movement**: Realistic petal animation with velocity variation
- **Glow Effects**: Sakura glow on interactive elements
- **Button Press Animations**: Pulsing effects when tapping buttons
- **Tab Bar Effects**: Sakura-themed gradient on the Phone app tab bar

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
- **Anime-Styled Settings**: Preferences app features anime-themed UI with gradient header
- **Beautiful Header**: Gradient anime-styled header with custom fonts
- **Intuitive Controls**: Smooth switches, sliders, and segments
- **Real-time Preview**: See changes applied instantly to your device

---

## 📋 System Requirements

- **iOS Version**: 14.0 or later (tested up to iOS 17)
- **Processor**: ARM64 / ARM64e (iPhone 6s and later)
- **Jailbreak**: Compatible with Checkra1n, Palera1n, and other modern jailbreaks
- **Rootless Support**: Palera1n rootless compatible
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

### Building for Rootless (Palera1n):
```bash
# Set up THEOS for rootless
export THEOS=~/theos
export THEOS_DEVICE_IP=192.168.1.100  # Change to your device IP
export THEOS_DEVICE_PORT=22

# Clone repository
git clone https://github.com/wh1tew1n/theos-jailbreak-tweak.git
cd theos-jailbreak-tweak

# Build for rootless
make clean
make package FINALPACKAGE=1

# Install to rootless device
make install INSTALL_TARGET_PROCESSES=Phone

# Respring (rootless safe)
make install RESPRING=1
```

---

## 🎯 Usage Guide

### First Time Setup
1. **Open Settings** on your iPhone
2. **Navigate to AnimePhone** preferences
3. **Enable Anime Style** toggle
4. **Select Your Favorite Theme**:
   - 🌸 Sakura (recommended - features falling petal animations)
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
- **Rootless Users**: Make sure device IP is correctly set in environment

---

## 🛠️ Technical Details

### Architecture
- **Language**: Objective-C with THEOS hooks
- **Hooking Framework**: Logos
- **Preference Storage**: Darwin Notifications + NSUserDefaults
- **UI Framework**: UIKit
- **Animation Engine**: Core Animation with CAEmitterLayer

### Hooked Components
- `UIViewController` - Main view styling and animations with sakura effects
- `UIButton` - Button anime-styling with borders, shadows, and pulse animations
- `UITableViewCell` - Table cell anime transformations
- `UITabBar` - Tab bar customization with sakura glow effects
- Navigation Bar - Custom gradient and colors

### Code Structure
```
AnimePhone/
├── Makefile              # Build configuration (THEOS compatible)
├── Tweak.xm              # Main tweak implementation with sakura animations
├── control               # Package metadata
├── README.md             # This file
├── LICENSE               # MIT License
└── animephone-prefs/     # Preference Loader bundle
    ├── Resources/
    │   ├── Root.plist    # Preferences structure
    │   ├── en.lproj/     # English localization
    │   └── ru.lproj/     # Russian localization
    └── entry.plist       # Entry point
```

---

## 🎨 Anime Color Schemes

### Sakura Theme 🌸
```
Primary Color: RGB(255, 191, 224) - Cherry Blossom Pink
Accent: Soft gradients to white
Animation: Falling sakura petals with physics
Best for: Daytime, normal brightness, anime lovers
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

#### Standard Build:
```bash
# Install THEOS
export THEOS=~/theos

# Clone repository
git clone https://github.com/wh1tew1n/theos-jailbreak-tweak.git
cd theos-jailbreak-tweak

# Build package
make clean
make package

# Install to connected device
make install
```

#### Rootless Build (Palera1n):
```bash
# Setup environment
export THEOS=~/theos
export THEOS_DEVICE_IP=YOUR_DEVICE_IP
export THEOS_DEVICE_PORT=22

# Navigate to project
cd ~/theos-jailbreak-tweak

# Clean and build
make clean
make package FINALPACKAGE=1

# Install to rootless jailbreak
make install INSTALL_TARGET_PROCESSES=Phone

# Apply changes without full respring
make install RESPRING=1
```

### Adding New Themes
1. Edit `Tweak.xm` and add a new color function:
```objc
static UIColor* getMyThemeColor() {
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}
```
2. Update preferences with new theme option
3. Add sakura animation support if desired
4. Rebuild and test

### Contributing Translations
1. Fork the repository
2. Add translations to:
   - `animephone-prefs/Resources/[language].lproj/Root.strings`
3. Submit a pull request

---

## 🐛 Troubleshooting

### Tweak Not Appearing in Settings
- **Solution**: Respring device or use `killall -9 Preferences`
- **Check**: Verify PreferenceLoader is installed
- **Rootless**: Ensure device is properly jailbroken with Palera1n

### Animations Are Slow
- **Solution**: Reduce animation speed in preferences
- **Check**: Ensure device has enough free RAM
- **Rootless**: Check if running other heavy tweaks

### Colors Look Different
- **Solution**: Adjust display settings on iPhone
- **Check**: Try different theme for comparison

### Changes Not Applying
- **Solution**: Respring or fully restart the Phone app
- **Check**: Ensure "Enable Anime Style" toggle is ON

### Rootless Installation Issues
- **Solution**: Verify correct device IP: `settings -> About -> IP Address`
- **Check**: SSH connection works: `ssh mobile@YOUR_DEVICE_IP`
- **Solution**: Update THEOS to latest version: `cd ~/theos && git pull`

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
- **Palera1n Team** - For rootless jailbreak support

---

## 🚀 Roadmap

### Version 1.0 (Current) ✅
- ✅ Core anime styling system
- ✅ Sakura petal animations
- ✅ Three beautiful themes
- ✅ Animation controls
- ✅ Bilingual support (EN/RU)
- ✅ Anime-styled preferences
- ✅ Rootless support

### Version 1.1 (Planned) 🔄
- 🔄 Additional themes (Cyberpunk, Magical Girl, etc.)
- 🔄 Custom color picker
- 🔄 Sound effects integration
- 🔄 Character/Avatar customization
- 🔄 More sakura animation variations

### Version 2.0 (Future) 🎯
- 🎯 App-wide anime theming
- 🎯 Advanced particle effects
- 🎯 Custom fonts
- 🎯 More languages (日本語, 中文, etc.)
- 🎯 Dynamic theme creation

---

**AnimePhone - Sakura Edition** - Because your Phone app deserves to be as beautiful as anime! 🌸✨

*Made with 💖 for jailbreak enthusiasts and anime fans*

*Now with full rootless support! 🚀*
