#!/bin/bash

# Alimiyya Bayazan - Release Preparation Script
# This script generates all artifacts for v1.0.0 release

set -e  # Exit on error

VERSION="v1.0.1"
RELEASE_DIR="release-artifacts"

echo "=========================================="
echo "Alimiyya Bayazan Release Preparation"
echo "Version: $VERSION"
echo "=========================================="
echo ""

# Check if virtual environment is activated
if [ -z "$VIRTUAL_ENV" ]; then
    echo "⚠️  Warning: Virtual environment not activated!"
    echo "Please run: source venv/bin/activate"
    exit 1
fi

# Check if required data sources exist
echo "🔍 Checking data sources..."
if [ ! -f "sources/shared/metadata/quran-data.xml" ]; then
    echo "❌ Error: Metadata file not found!"
    echo "Please ensure all data sources are downloaded as per DATA_SOURCES.md"
    exit 1
fi

if [ ! -f "sources/themes/indopak/text/indopak-nastaleeq.db" ]; then
    echo "❌ Error: Indo-Pak database not found!"
    exit 1
fi

if [ ! -f "sources/themes/uthmani/text/uthmani.db" ]; then
    echo "❌ Error: Uthmani database not found!"
    exit 1
fi

echo "✅ All data sources found"
echo ""

# Create release directory
mkdir -p "$RELEASE_DIR"

# Function to clean generated directory
cleanup_generated() {
    echo "🧹 Cleaning generated directory..."
    rm -rf generated/*
    echo "✅ Cleanup complete"
    echo ""
}

# Function to copy usage instructions
copy_usage_instructions() {
    echo "📄 Copying usage instructions..."
    if [ -f "USAGE_INSTRUCTIONS.md" ]; then
        cp USAGE_INSTRUCTIONS.md generated/
        echo "✅ USAGE_INSTRUCTIONS.md copied"
    else
        echo "⚠️  Warning: USAGE_INSTRUCTIONS.md not found"
    fi
    echo ""
}

# Function to package artifacts
package_artifacts() {
    local mode=$1
    local base_name=$2
    
    echo "📦 Packaging $mode artifacts..."
    cd generated
    
    # Create tar.gz (for Linux/macOS users)
    tar -czf "../$RELEASE_DIR/${base_name}.tar.gz" *.docx *.ttf *.otf *.md 2>/dev/null || true
    local tar_size=$(du -h "../$RELEASE_DIR/${base_name}.tar.gz" | cut -f1)
    echo "✅ Created: ${base_name}.tar.gz ($tar_size)"
    
    # Create zip (for Windows users - native support)
    zip -q -r "../$RELEASE_DIR/${base_name}.zip" *.docx *.ttf *.otf *.md 2>/dev/null || true
    local zip_size=$(du -h "../$RELEASE_DIR/${base_name}.zip" | cut -f1)
    echo "✅ Created: ${base_name}.zip ($zip_size)"
    
    cd ..
    echo ""
}

# ==========================================
# 1. STANDARD MODE
# ==========================================
echo "=========================================="
echo "1️⃣  Generating STANDARD MODE artifacts"
echo "=========================================="
echo ""

cleanup_generated

echo "🚀 Running: bash gen_bayzan_all.sh"
bash gen_bayzan_all.sh

if [ $? -eq 0 ]; then
    echo "✅ Standard mode generation complete"
    echo ""
    
    copy_usage_instructions
    
    # Count generated files
    docx_count=$(ls -1 generated/*.docx 2>/dev/null | wc -l)
    echo "📊 Generated $docx_count workbook files"
    
    package_artifacts "Standard Mode" "alimiyya-bayazan-standard-$VERSION"
else
    echo "❌ Standard mode generation failed!"
    exit 1
fi

# ==========================================
# 2. PRO MODE - INDO-PAK
# ==========================================
echo "=========================================="
echo "2️⃣  Generating PRO MODE - INDO-PAK"
echo "=========================================="
echo ""

cleanup_generated

echo "🚀 Running: bash gen_bayzan_all.sh --pro --theme=indopak"
bash gen_bayzan_all.sh --pro --theme=indopak

if [ $? -eq 0 ]; then
    echo "✅ Pro Indo-Pak mode generation complete"
    echo ""
    
    copy_usage_instructions
    
    # Count generated files
    docx_count=$(ls -1 generated/*.docx 2>/dev/null | wc -l)
    echo "📊 Generated $docx_count workbook files"
    
    package_artifacts "Pro Indo-Pak Mode" "alimiyya-bayazan-pro-indopak-$VERSION"
else
    echo "❌ Pro Indo-Pak mode generation failed!"
    exit 1
fi

# ==========================================
# 3. PRO MODE - UTHMANI
# ==========================================
echo "=========================================="
echo "3️⃣  Generating PRO MODE - UTHMANI"
echo "=========================================="
echo ""

cleanup_generated

echo "🚀 Running: bash gen_bayzan_all.sh --pro --theme=uthmani"
bash gen_bayzan_all.sh --pro --theme=uthmani

if [ $? -eq 0 ]; then
    echo "✅ Pro Uthmani mode generation complete"
    echo ""
    
    copy_usage_instructions
    
    # Count generated files
    docx_count=$(ls -1 generated/*.docx 2>/dev/null | wc -l)
    echo "📊 Generated $docx_count workbook files"
    
    package_artifacts "Pro Uthmani Mode" "alimiyya-bayazan-pro-uthmani-$VERSION"
else
    echo "❌ Pro Uthmani mode generation failed!"
    exit 1
fi

# ==========================================
# FINAL CLEANUP
# ==========================================
cleanup_generated

# ==========================================
# SUMMARY
# ==========================================
echo "=========================================="
echo "✅ RELEASE PREPARATION COMPLETE!"
echo "=========================================="
echo ""
echo "📦 Release Artifacts:"
echo ""
ls -lh "$RELEASE_DIR"/*
echo ""
echo "📊 Total artifacts: $(ls -1 "$RELEASE_DIR" | wc -l) files"
echo ""
echo "📍 Location: $RELEASE_DIR/"
echo ""
echo "Next Steps:"
echo "1. Verify the generated tarballs"
echo "2. Create a GitHub release for $VERSION"
echo "3. Upload the tarballs as release assets"
echo "4. Copy RELEASE_NOTES.md content to release description"
echo ""
echo "=========================================="

# Made with Bob
