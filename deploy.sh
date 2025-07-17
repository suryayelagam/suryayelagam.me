#!/bin/bash

# Portfolio Deployment Script for AWS
# Make sure you have AWS CLI configured with appropriate permissions

DOMAIN="suryayelagam.me"
BUCKET_NAME="suryayelagam-portfolio"
REGION="us-east-1"  # Required for CloudFront

echo "🚀 Starting deployment for $DOMAIN..."

# Create S3 bucket
echo "📦 Creating S3 bucket..."
aws s3 mb s3://$BUCKET_NAME --region $REGION

# Configure bucket for static website hosting
echo "🌐 Configuring static website hosting..."
aws s3 website s3://$BUCKET_NAME --index-document index.html --error-document index.html

# Set bucket policy for public read access
echo "🔓 Setting bucket policy..."
cat > bucket-policy.json << EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::$BUCKET_NAME/*"
        }
    ]
}
EOF

aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy file://bucket-policy.json

# Upload website files
echo "📤 Uploading website files..."
aws s3 sync . s3://$BUCKET_NAME --exclude "*.sh" --exclude "*.json" --exclude ".git/*" --exclude "README.md"

# Set proper content types
aws s3 cp s3://$BUCKET_NAME/styles.css s3://$BUCKET_NAME/styles.css --content-type "text/css" --metadata-directive REPLACE
aws s3 cp s3://$BUCKET_NAME/script.js s3://$BUCKET_NAME/script.js --content-type "application/javascript" --metadata-directive REPLACE

echo "✅ S3 setup complete!"
echo "🌍 Website URL: http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"

echo ""
echo "Next steps:"
echo "1. Request SSL certificate in AWS Certificate Manager for $DOMAIN and www.$DOMAIN"
echo "2. Create CloudFront distribution"
echo "3. Update Route53 records"
echo ""
echo "Run the following commands after certificate is issued:"
echo "aws cloudformation deploy --template-file cloudfront-template.yaml --stack-name portfolio-cloudfront --parameter-overrides DomainName=$DOMAIN BucketName=$BUCKET_NAME"

# Clean up
rm bucket-policy.json