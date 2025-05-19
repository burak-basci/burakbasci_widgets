# 📦 Dart Package – Update Instructions

## ✅ Update Package

### Step 1: Bump version

Edit `pubspec.yaml`:

```yaml
version: 1.0.1
```

### Step 2: Update changelog (optional)

Edit `CHANGELOG.md` with a short summary of changes.

### Step 3: Validate package

```bash
dart pub publish --dry-run
```

### Step 4: Publish

```bash
dart pub publish
```

Confirm when prompted.
