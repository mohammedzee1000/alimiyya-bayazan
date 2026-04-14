---
name: Urdu Translation
about: Help translate documentation to Urdu
title: '[Translation] Add Urdu translations for documentation'
labels: 'enhancement, documentation, translation, help wanted, good first issue'
assignees: ''
---

# 🌍 Urdu Translation Request

We're looking for community contributors to help translate our documentation into Urdu (اردو)!

## 📋 Files to Translate

The following files need Urdu translations:

### 1. README.ur.md
- **Source:** [`README.md`](../../README.md)
- **Target:** [`README.ur.md`](../../README.ur.md) (placeholder exists)
- **Priority:** High
- **Estimated lines:** ~400 lines

### 2. USAGE_INSTRUCTIONS.ur.md
- **Source:** [`USAGE_INSTRUCTIONS.md`](../../USAGE_INSTRUCTIONS.md)
- **Target:** [`USAGE_INSTRUCTIONS.ur.md`](../../USAGE_INSTRUCTIONS.ur.md) (placeholder exists)
- **Priority:** High
- **Estimated lines:** ~200 lines

## 🎯 Translation Guidelines

### Content to Translate
- All headings and section titles
- All descriptive text and explanations
- Installation instructions
- Usage examples and tips
- Troubleshooting sections

### Content to Keep in English
- Code snippets and commands
- File paths and directory names
- Technical terms (e.g., "Python", "Git", "Microsoft Word")
- URLs and links
- Version numbers

### Formatting Requirements
1. **Preserve Markdown syntax** - Keep all `#`, `*`, `-`, `>`, etc.
2. **Maintain RTL (Right-to-Left) text direction** for Urdu content
3. **Keep all links functional** - Update link text to Urdu but keep URLs unchanged
4. **Preserve code blocks** - Don't translate content inside ``` blocks
5. **Keep placeholder `[NUMBER]`** in issue references until actual issue number is assigned

### Example Translation Pattern

**English:**
```markdown
## Installation

To install the fonts, follow these steps:

1. Download the font file
2. Double-click to open
3. Click "Install"
```

**Urdu:**
```markdown
## تنصیب

فونٹس انسٹال کرنے کے لیے، یہ اقدامات کریں:

1. فونٹ فائل ڈاؤن لوڈ کریں
2. کھولنے کے لیے ڈبل کلک کریں
3. "Install" پر کلک کریں
```

## 🤝 How to Contribute

### Option 1: Direct Translation (Recommended for experienced contributors)

1. **Fork the repository**
   ```bash
   git clone https://github.com/mohammedzee1000/alimiyya-bayazan.git
   cd alimiyya-bayazan
   ```

2. **Create a translation branch**
   ```bash
   git checkout -b urdu-translation
   ```

3. **Translate the files**
   - Edit `README.ur.md`
   - Edit `USAGE_INSTRUCTIONS.ur.md`
   - Replace placeholder content with full Urdu translations

4. **Test your translations**
   - Preview the markdown files in GitHub or a markdown viewer
   - Verify all links work correctly
   - Check RTL text rendering

5. **Submit a Pull Request**
   - Commit your changes with clear messages
   - Push to your fork
   - Open a PR against the `main` branch
   - Reference this issue in your PR description

### Option 2: Collaborative Translation (For new contributors)

1. **Comment on this issue** to claim a file (README or USAGE_INSTRUCTIONS)
2. **Translate in sections** - You can submit partial translations
3. **Share your translation** as a comment or gist
4. **We'll help** integrate it into the repository

## ✅ Acceptance Criteria

A complete translation should:
- [ ] Translate all user-facing text to Urdu
- [ ] Preserve all markdown formatting
- [ ] Keep all code blocks and commands in English
- [ ] Maintain all links and references
- [ ] Use proper Urdu grammar and terminology
- [ ] Be reviewed by at least one native Urdu speaker
- [ ] Render correctly in GitHub's markdown viewer

## 🎓 Translation Resources

### Urdu Technical Terms
- **Download** = ڈاؤن لوڈ
- **Install** = انسٹال کریں
- **Font** = فونٹ
- **File** = فائل
- **Directory** = ڈائریکٹری
- **Command** = کمانڈ
- **Script** = اسکرپٹ
- **Workbook** = ورک بک
- **Documentation** = دستاویزات

### Helpful Tools
- [Google Translate](https://translate.google.com/?sl=en&tl=ur) (for reference, not direct copy)
- [Urdu Keyboard](https://www.branah.com/urdu) (online typing tool)
- [Markdown Preview](https://markdownlivepreview.com/) (test formatting)

## 📞 Questions?

- **Ask in comments** below
- **Join discussions** in the PR
- **Tag maintainers** @mohammedzee1000 for guidance

## 🏆 Recognition

Contributors will be:
- Listed in the project's CONTRIBUTORS.md file
- Mentioned in release notes
- Credited in the translated documentation

---

**Thank you for helping make Alimiyya Bayazan accessible to Urdu-speaking students! جزاک اللہ خیرا**