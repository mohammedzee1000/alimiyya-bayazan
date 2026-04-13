# Data Sources Documentation

This document tracks all data sources used in the Alimiyya Bayazan project, including exact download locations and versions.

## 📚 Shared Resources (All Themes)

### Metadata
- **File**: `sources/shared/metadata/quran-data.xml`
- **Source**: [Tanzil.net](https://tanzil.net/download/)
- **Type**: Quran metadata (Surah names, ayah counts, Makki/Madani classification)
- **Format**: XML
- **License**: Public domain for non-commercial use

### Morphology Databases
- **Files**:
  - `word-root.db`, `word-lemma.db`, `word-stem.db`
  - `ayah-root.db`, `ayah-lemma.db`, `ayah-stem.db`
- **Source**: [QUL Tarteel - Morphology Resources](https://qul.tarteel.ai/resources/morphology)
- **Type**: Morphological analysis (roots, lemmas, stems)
- **Format**: SQLite databases
- **Purpose**: Word-by-word grammatical analysis
- **Note**: These databases enable tracing each Quranic word back to its classical Arabic root

### Leeds Morphology
- **File**: `quranic-corpus-morphology-0.4.txt`
- **Source**: [Quranic Arabic Corpus](http://corpus.quran.com/) (University of Leeds)
- **Maintainer**: Kais Dukes
- **Type**: Part-of-speech tagging
- **Format**: Tab-separated text file
- **Purpose**: Color-coded grammar (Noun/Verb/Particle)

## 🎨 Standard Mode Resources

### Text
- **File**: `sources/standard/quran-simple.txt`
- **Source**: [Tanzil.net](https://tanzil.net/download/)
- **Type**: Simple Arabic text (no diacritics)
- **Format**: Plain text
- **Script**: Standard Arabic

### Font
- **File**: `sources/standard/KFGQPCNastaleeq-Regular.ttf`
- **Source**: [King Fahd Glorious Qur'an Printing Complex](https://fonts.qurancomplex.gov.sa/)
- **Type**: Nastaleeq font
- **License**: Free for non-commercial use

## 🎨 Theme: Indo-Pak

### Text Database
- **File**: `sources/themes/indopak/text/indopak-nastaleeq.db`
- **Source**: [QUL Tarteel - Indo-Pak Nastaleeq Script](https://qul.tarteel.ai/resources/quran-script/59)
- **Type**: Word-by-word database with Indo-Pak orthography
- **Format**: SQLite database
- **Script**: Indo-Pak Nastaleeq
- **Version**: Check QUL website for latest version

### Font
- **File**: `sources/themes/indopak/fonts/AlQuran IndoPak by QuranWBW.ttf`
- **Source**: [QUL Tarteel - Indo-Pak Font](https://qul.tarteel.ai/resources/font/242)
- **Type**: Indo-Pak Nastaleeq font
- **Creator**: QuranWBW (Quran Word by Word)
- **License**: Check QUL website for license terms

## 🎨 Theme: Uthmani

### Text Database
- **File**: `sources/themes/uthmani/text/uthmani.db`
- **Source**: [QUL Tarteel - Uthmani Script](https://qul.tarteel.ai/resources/quran-script/56)
- **Type**: Word-by-word database with Uthmani orthography
- **Format**: SQLite database
- **Script**: Uthmani (Hafs narration)
- **Version**: Check QUL website for latest version

### Font
- **File**: `sources/themes/uthmani/fonts/KFGQPC Uthmanic Script HAFS.otf`
- **Source**: [Arabic Fonts - KFGQPC Uthmanic Script HAFS](https://arabicfonts.net/fonts/kfgqpc-uthmanic-script-hafs-regular)
- **Original Source**: King Fahd Glorious Qur'an Printing Complex (KFGQPC)
- **Type**: Uthmani script font (HAFS narration)
- **Format**: OpenType Font (.otf)
- **License**: Free for non-commercial use
- **Status**: ✅ **INSTALLED AND CONFIGURED**

## 📋 Database Schema Compatibility

All word-by-word databases (Indo-Pak and Uthmani) from QUL Tarteel share the same schema:

```sql
-- Expected table structure
CREATE TABLE words (
    surah INTEGER,
    ayah INTEGER,
    word INTEGER,
    location TEXT,
    text TEXT
);
```

This ensures compatibility across themes without code changes.

## 🔄 Update Procedure

When updating data sources:

1. **Check for updates** on source websites
2. **Download new versions** to a temporary location
3. **Backup current files** before replacing
4. **Test generation** with new files
5. **Update this document** with new version info
6. **Commit changes** with clear version notes

## ⚠️ To Do

- [ ] **Version numbers**: Add version/date info for all resources when available
- [ ] **License details**: Verify and document all licenses in detail
- [ ] **Alternative sources**: Document backup download locations
- [ ] **Update check dates**: Track when resources were last verified

## 📞 Support & Questions

For questions about data sources:
- **QUL Tarteel**: Check their website or contact through their platform
- **Tanzil**: Visit [tanzil.net](https://tanzil.net/)
- **Quranic Corpus**: Visit [corpus.quran.com](http://corpus.quran.com/)
- **King Fahd Complex**: Visit [qurancomplex.gov.sa](https://qurancomplex.gov.sa/)

## 🙏 Acknowledgments

This project relies entirely on freely available, academically verified Islamic resources. We are deeply grateful to:
- Tanzil.net team
- Quranic Universal Library (QUL) / Tarteel.ai
- University of Leeds Quranic Corpus team
- King Fahd Glorious Qur'an Printing Complex
- All scholars and researchers who made their work accessible

---

**Last Updated**: 2026-04-13  
**Maintainer**: Please update this document when adding/changing data sources