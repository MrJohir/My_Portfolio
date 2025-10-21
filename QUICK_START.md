# Quick Start Guide - Customization Checklist

Follow this checklist to quickly customize the portfolio with your information.

## ✅ Step-by-Step Customization

### Step 1: Update Personal Information (5 minutes)

**File**: `lib/core/utils/constants/app_strings.dart`

Replace these values:
```dart
static const String fullName = 'YOUR NAME HERE';
static const String email = 'YOUR_EMAIL@example.com';
static const String phone = '+880 YOUR_PHONE';
static const String linkedinUrl = 'YOUR_LINKEDIN_URL';
static const String githubUrl = 'YOUR_GITHUB_URL';
```

### Step 2: Add Your Profile Image (2 minutes)

**File**: `lib/core/utils/constants/app_assets.dart`

Option A - Use URL:
```dart
static const String profileImagePlaceholder = 'YOUR_IMAGE_URL';
```

Option B - Use local asset:
1. Add image to `assets/images/profile.png`
2. Update `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
```
3. Update `app_assets.dart`:
```dart
static const String profileImage = 'assets/images/profile.png';
```

### Step 3: Add Your Projects (10 minutes)

**File**: `lib/features/portfolio/data/mock_projects.dart`

Add your projects:
```dart
Project(
  id: '1',
  title: 'YOUR PROJECT NAME',
  description: 'PROJECT DESCRIPTION (2-3 sentences)',
  technologies: ['Flutter', 'Firebase', 'GetX'], // Your tech stack
  imageUrl: 'PROJECT_IMAGE_URL',
  githubUrl: 'GITHUB_REPO_URL',
  liveUrl: 'LIVE_DEMO_URL', // Optional
  completedDate: DateTime(2024, 12, 1),
),
```

**Tips for Project Images**:
- Use placeholder: `https://via.placeholder.com/600x400/2196F3/ffffff?text=Project+Name`
- Or upload to: [imgur.com](https://imgur.com) or [cloudinary.com](https://cloudinary.com)

### Step 4: Update Your Skills (5 minutes)

**File**: `lib/features/portfolio/views/sections/skills_section.dart`

Modify the `_skillsData` map (line ~17):
```dart
static const Map<String, List<String>> _skillsData = {
  'Framework & Languages': [
    'YOUR_SKILL_1',
    'YOUR_SKILL_2',
    // Add more...
  ],
  'Backend & Database': [
    'YOUR_BACKEND_SKILL',
    // Add more...
  ],
  // Add more categories...
};
```

### Step 5: Customize About Section (5 minutes)

**File**: `lib/core/utils/constants/app_strings.dart`

Update:
```dart
static const String aboutDescription = 
    'YOUR PROFESSIONAL SUMMARY - Who you are, what you do, your expertise';

static const String aboutExtended = 
    'MORE DETAILS - Your approach, goals, what drives you';
```

### Step 6: Change Color Theme (Optional - 2 minutes)

**File**: `lib/core/utils/constants/app_colors.dart`

Pick colors from [materialpalette.com](https://www.materialpalette.com) or [coolors.co](https://coolors.co):
```dart
static const Color primary = Color(0xFFYOUR_COLOR);
static const Color accent = Color(0xFFYOUR_ACCENT);
```

### Step 7: Test Your Portfolio (5 minutes)

```bash
flutter run -d chrome
```

Check:
- ✅ All information is correct
- ✅ Links work properly
- ✅ Images load correctly
- ✅ Responsive on different screen sizes
- ✅ Contact form works

### Step 8: Build for Production (2 minutes)

```bash
flutter build web --release
```

Check the `build/web` folder for output.

## 🎯 Quick Reference - File Locations

| What to Change | File Location |
|----------------|---------------|
| Personal Info | `lib/core/utils/constants/app_strings.dart` |
| Profile Image | `lib/core/utils/constants/app_assets.dart` |
| Projects | `lib/features/portfolio/data/mock_projects.dart` |
| Skills | `lib/features/portfolio/views/sections/skills_section.dart` |
| Colors | `lib/core/utils/constants/app_colors.dart` |
| About Text | `lib/core/utils/constants/app_strings.dart` |

## 🚀 Deploy Checklist

### GitHub Pages Deploy (10 minutes)

1. ✅ Create GitHub repository
2. ✅ Build with base-href:
   ```bash
   flutter build web --release --base-href "/REPO_NAME/"
   ```
3. ✅ Create `.nojekyll` in build/web
4. ✅ Push to gh-pages branch
5. ✅ Enable GitHub Pages in settings
6. ✅ Wait 2-5 minutes for deployment
7. ✅ Visit: `https://USERNAME.github.io/REPO_NAME/`

## 🔍 Testing on Different Devices

### Desktop
- ✅ Chrome: `flutter run -d chrome`
- ✅ Check responsive layout (resize browser)

### Mobile Simulation
- ✅ Chrome DevTools: F12 → Toggle device toolbar
- ✅ Test mobile, tablet, desktop views

## 💡 Pro Tips

1. **Keep it Simple**: Don't overcomplicate. Less is more.
2. **Use Good Images**: High-quality project screenshots matter.
3. **Write Clear Descriptions**: Keep project descriptions concise (2-3 lines).
4. **Test Everything**: Click all links, test all forms.
5. **Mobile First**: Always check mobile layout.
6. **Fast Loading**: Optimize images (use TinyPNG or similar).
7. **Professional Email**: Use a professional email address.
8. **Active Links**: Ensure all social links are active.

## 🆘 Common Issues & Quick Fixes

### "Overflow by X pixels"
**Fix**: Reduce padding in ResponsivePadding or reduce font sizes

### Links not working
**Fix**: Check URLs in `app_strings.dart`, ensure https://

### Images not loading
**Fix**: 
- Check image URLs are accessible
- Use placeholder URLs for testing
- Verify CORS if using external images

### Slow loading
**Fix**: 
- Optimize images
- Use smaller bundle: `--web-renderer canvaskit`

### Contact form not working
**Fix**: It's currently simulated. Integrate Firebase or backend for production.

## 📝 Final Checks Before Deploy

- [ ] All personal information is updated
- [ ] All links are working
- [ ] Images load correctly
- [ ] No placeholder text remains
- [ ] Color scheme looks good
- [ ] Mobile responsive works
- [ ] Contact form submits (shows success)
- [ ] No console errors
- [ ] README.md updated with your info
- [ ] Tested on Chrome, Safari, Firefox

## 🎉 Done!

Your portfolio is ready! Now:
1. Deploy to GitHub Pages
2. Share on LinkedIn
3. Add to your resume
4. Get hired! 🚀

---

**Total Time**: ~30-40 minutes
**Difficulty**: Easy
**Result**: Professional Portfolio Website

Need help? Email: mdjohiruli826@gmail.com
