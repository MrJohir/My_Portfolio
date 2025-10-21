# Md. Johirul Islam - Portfolio Website

A modern, responsive personal portfolio website built with Flutter Web, showcasing projects, skills, and professional experience.

## 🌟 Features

- **Responsive Design**: Fully responsive layout for desktop, tablet, and mobile devices
- **Modern UI**: Clean and elegant design with smooth animations
- **Sections Include**:
  - Hero Section with professional introduction
  - About Me with educational and professional background
  - Skills showcase with categorized technology badges
  - Projects portfolio with detailed project cards
  - Contact form with validation
  - Footer with social links

## 🛠 Technologies Used

- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language
- **GetX** - State management and navigation
- **Google Fonts** - Typography
- **Flutter ScreenUtil** - Responsive sizing
- **URL Launcher** - External link handling
- **Animate Do** - Smooth animations

## 📋 Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK (3.8.1 or higher)
- Chrome or any modern web browser

## 🚀 Getting Started

### Installation

1. Clone the repository:
```bash
git clone https://github.com/MrJohir/flutter_portfolio.git
cd flutter_application_1
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run -d chrome
```

## 📦 Building for Production

### Build for Web

```bash
flutter build web --release
```

The build output will be in the `build/web` directory.

### Deploy to GitHub Pages

1. Build the web version:
```bash
flutter build web --release --base-href "/flutter_portfolio/"
```

2. Navigate to the build directory:
```bash
cd build/web
```

3. Create a `.nojekyll` file:
```bash
touch .nojekyll
```

4. Initialize git and push to gh-pages branch:
```bash
git init
git add .
git commit -m "Deploy Flutter Web Portfolio"
git branch -M gh-pages
git remote add origin https://github.com/MrJohir/flutter_portfolio.git
git push -f origin gh-pages
```

5. Enable GitHub Pages in your repository settings:
   - Go to Settings > Pages
   - Select `gh-pages` branch as source
   - Save

Your portfolio will be available at: `https://mrjohir.github.io/flutter_portfolio/`

## 📁 Project Structure

```
lib/
├── core/
│   ├── common/
│   │   └── widgets/          # Reusable widgets
│   └── utils/
│       ├── constants/         # App constants
│       └── validators/        # Form validators
├── features/
│   └── portfolio/
│       ├── controllers/       # GetX controllers
│       ├── data/             # Mock data
│       ├── models/           # Data models
│       └── views/
│           ├── screens/      # Main screens
│           ├── sections/     # Portfolio sections
│           └── widgets/      # Feature-specific widgets
└── main.dart                 # App entry point
```

## 🎨 Customization

### Update Personal Information

Edit `lib/core/utils/constants/app_strings.dart`

### Add Projects

Update `lib/features/portfolio/data/mock_projects.dart`

### Customize Colors

Edit `lib/core/utils/constants/app_colors.dart`

## 📱 Contact

- **Email**: mdjohiruli826@gmail.com
- **Phone**: +880 1751228824
- **LinkedIn**: [md-johirul-islam](https://www.linkedin.com/in/md-johirul-islam-1a6844363)
- **GitHub**: [MrJohir](https://github.com/MrJohir)

## 📝 License

MIT License - Open source and free to use

---

**Built with ❤️ using Flutter**

Made by Md. Johirul Islam © 2025
# My_Portfolio
