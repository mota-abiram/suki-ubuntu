#!/bin/bash
# ============================================================
# Sukhii Ubuntu — Build & Migration Script
# Usage: bash build.sh
# Output: dist/ folder + sukhii-ubuntu-build.zip
# ============================================================

set -e

DIST="dist"
ZIP_NAME="sukhii-ubuntu-build.zip"

echo "🔨 Starting build..."

# Clean previous build
rm -rf "$DIST"
mkdir -p "$DIST/assets"

# Copy all files
echo "📁 Copying files..."
cp index.html "$DIST/"
cp thankyou.html "$DIST/"
cp privacy-policy.html "$DIST/"
cp Ubuntu-Logo.svg "$DIST/"
cp "mini brochure.pdf" "$DIST/"
cp assets/* "$DIST/assets/"

# Minify HTML files if html-minifier-terser is available
if command -v html-minifier-terser &> /dev/null; then
    echo "🗜️  Minifying HTML..."
    for f in "$DIST"/*.html; do
        html-minifier-terser \
            --collapse-whitespace \
            --remove-comments \
            --remove-optional-tags \
            --remove-redundant-attributes \
            --remove-script-type-attributes \
            --use-short-doctype \
            --minify-css true \
            --minify-js true \
            "$f" -o "$f"
        echo "   ✓ $(basename $f)"
    done
else
    echo "⚠️  html-minifier-terser not found — skipping minification."
    echo "   Run: npm install -g html-minifier-terser"
fi

# Create zip
echo "📦 Creating zip..."
rm -f "$ZIP_NAME"
cd "$DIST" && zip -r "../$ZIP_NAME" . && cd ..

echo ""
echo "✅ Build complete!"
echo "   → Folder : ./$DIST/"
echo "   → Archive: ./$ZIP_NAME"
echo ""
echo "Deploy options:"
echo "  Vercel  : cd dist && npx vercel"
echo "  Netlify : drag & drop dist/ at app.netlify.com"
echo "  cPanel  : upload $ZIP_NAME and extract in public_html"
