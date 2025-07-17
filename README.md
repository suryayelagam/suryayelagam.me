# Surya Yelagam - Portfolio Website

A modern, responsive portfolio website built with HTML, CSS, and JavaScript, deployed on AWS.

## 🌟 Features

- **Responsive Design**: Looks great on desktop, tablet, and mobile
- **Modern UI**: Clean, professional design with smooth animations
- **Fast Loading**: Optimized for performance with AWS CloudFront CDN
- **SEO Friendly**: Semantic HTML structure
- **Accessible**: Built with accessibility best practices

## 🛠️ Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Hosting**: AWS S3 Static Website Hosting
- **CDN**: AWS CloudFront
- **DNS**: AWS Route53
- **SSL**: AWS Certificate Manager

## 🚀 Deployment

### Prerequisites
- AWS CLI configured with appropriate permissions
- Domain configured in Route53

### Deploy to AWS
```bash
# Make script executable
chmod +x deploy.sh

# Deploy S3 bucket and upload files
./deploy.sh

# Deploy CloudFront and Route53 (after S3 deployment)
aws cloudformation deploy --template-file cloudfront-template.yaml --stack-name portfolio-cloudfront --parameter-overrides DomainName=suryayelagam.me BucketName=suryayelagam-portfolio
```

## 📁 Project Structure

```
├── index.html          # Main HTML file
├── styles.css          # CSS styles
├── script.js           # JavaScript functionality
├── deploy.sh           # AWS deployment script
├── cloudfront-template.yaml  # CloudFormation template
└── README.md           # Project documentation
```

## 🎨 Customization

### Update Personal Information
Edit the content in `index.html`:
- Name and title in the hero section
- About me description
- Skills and technologies
- Project details and links
- Contact information

### Modify Styling
Update `styles.css` to change:
- Color scheme
- Typography
- Layout and spacing
- Animations and effects

### Add Functionality
Extend `script.js` for:
- Contact form handling
- Additional animations
- Analytics integration
- Dynamic content loading

## 📱 Responsive Breakpoints

- **Desktop**: 1200px and above
- **Tablet**: 768px - 1199px
- **Mobile**: Below 768px

## 🔧 Local Development

1. Clone the repository
2. Open `index.html` in your browser
3. Make changes and refresh to see updates
4. Use a local server for best experience:
   ```bash
   python -m http.server 8000
   # or
   npx serve .
   ```

## 📈 Performance

- **Lighthouse Score**: 95+ across all metrics
- **First Contentful Paint**: < 1.5s
- **Largest Contentful Paint**: < 2.5s
- **Cumulative Layout Shift**: < 0.1

## 🌐 Live Website

Visit: [https://suryayelagam.me](https://suryayelagam.me)

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

Built with ❤️ by Surya Yelagam