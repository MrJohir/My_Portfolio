# Flutter Web Portfolio - Deployment Guide

## GitHub Pages Deployment (Recommended)

### Step 1: Prepare Your Repository

1. Create a new repository on GitHub (e.g., `flutter_portfolio`)
2. Don't initialize with README (we already have one)

### Step 2: Build for Web

```bash
# Navigate to your project directory
cd /Users/Johirul/Documents/my_portfolio/flutter_application_1

# Build for web with proper base href
flutter build web --release --base-href "/flutter_portfolio/"
```

**Note**: Replace `/flutter_portfolio/` with your repository name if different.

### Step 3: Deploy to GitHub Pages

```bash
# Navigate to build directory
cd build/web

# Create .nojekyll file (important for GitHub Pages)
touch .nojekyll

# Initialize git
git init

# Add all files
git add .

# Commit
git commit -m "Initial deployment"

# Create gh-pages branch
git branch -M gh-pages

# Add remote (replace with your GitHub username)
git remote add origin https://github.com/MrJohir/flutter_portfolio.git

# Push to gh-pages branch
git push -f origin gh-pages
```

### Step 4: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click on **Settings**
3. Scroll to **Pages** section
4. Under **Source**, select:
   - Branch: `gh-pages`
   - Folder: `/ (root)`
5. Click **Save**

### Step 5: Access Your Portfolio

Your portfolio will be available at:
```
https://mrjohir.github.io/flutter_portfolio/
```

## Alternative: Firebase Hosting

### Prerequisites
```bash
npm install -g firebase-tools
```

### Steps

1. Login to Firebase:
```bash
firebase login
```

2. Initialize Firebase in your project:
```bash
cd /Users/Johirul/Documents/my_portfolio/flutter_application_1
firebase init hosting
```

3. Configure `firebase.json`:
```json
{
  "hosting": {
    "public": "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

4. Build and Deploy:
```bash
flutter build web --release
firebase deploy --only hosting
```

## Alternative: Netlify

### Using Netlify CLI

1. Install Netlify CLI:
```bash
npm install -g netlify-cli
```

2. Build your project:
```bash
flutter build web --release
```

3. Deploy:
```bash
cd build/web
netlify deploy --prod
```

### Using Netlify Dashboard

1. Build your project:
```bash
flutter build web --release
```

2. Go to [Netlify](https://app.netlify.com/)
3. Drag and drop the `build/web` folder
4. Your site will be deployed!

## Alternative: Vercel

1. Install Vercel CLI:
```bash
npm install -g vercel
```

2. Build your project:
```bash
flutter build web --release
```

3. Deploy:
```bash
cd build/web
vercel --prod
```

## Custom Domain Setup (Optional)

### For GitHub Pages

1. Add a `CNAME` file in `build/web`:
```bash
echo "yourdomain.com" > build/web/CNAME
```

2. In your domain registrar, add DNS records:
```
Type: A
Name: @
Value: 185.199.108.153
       185.199.109.153
       185.199.110.153
       185.199.111.153

Type: CNAME
Name: www
Value: mrjohir.github.io
```

3. In GitHub repository settings, under Pages, add your custom domain

### For Firebase/Netlify/Vercel

Follow their respective custom domain documentation:
- [Firebase Custom Domain](https://firebase.google.com/docs/hosting/custom-domain)
- [Netlify Custom Domain](https://docs.netlify.com/domains-https/custom-domains/)
- [Vercel Custom Domain](https://vercel.com/docs/concepts/projects/custom-domains)

## Troubleshooting

### Issue: Blank page after deployment
**Solution**: Make sure you used `--base-href` flag correctly with your repository name.

### Issue: 404 on refresh
**Solution**: Add proper routing configuration in your hosting service.

### Issue: Assets not loading
**Solution**: Check that all assets are properly referenced and included in pubspec.yaml.

### Issue: Large bundle size
**Solution**: 
```bash
# Build with skia renderer for smaller size
flutter build web --release --web-renderer canvaskit
```

## Performance Optimization

1. **Enable caching** in your hosting service
2. **Use CDN** for assets
3. **Compress images** before deployment
4. **Enable HTTPS** (usually automatic with modern hosting)
5. **Add meta tags** for SEO in `web/index.html`

## Automated Deployment (CI/CD)

### GitHub Actions Example

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.8.1'
    
    - name: Install dependencies
      run: flutter pub get
    
    - name: Build web
      run: flutter build web --release --base-href "/flutter_portfolio/"
    
    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./build/web
```

## Monitoring

### Google Analytics Setup

1. Get your tracking ID from Google Analytics
2. Add to `web/index.html`:

```html
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=YOUR_TRACKING_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'YOUR_TRACKING_ID');
</script>
```

## Support

For deployment issues:
- Check Flutter web documentation: https://docs.flutter.dev/deployment/web
- GitHub Pages issues: https://docs.github.com/en/pages

---

**Last Updated**: October 2025
**Author**: Md. Johirul Islam
