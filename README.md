# ✨ Custom Page Scaffold – Flutter Widget Library

A lightweight Flutter widget library focused on reusable **page scaffolding** and layout patterns, designed for fast development across multiple projects. This package provides a unified structure for app pages, allowing for consistent UI and code reuse.

---

## 📦 Features

- 🚀 **Reusable Page Scaffold** widget with customizable title, tabs and actions
- 🌓 Built-in support for theming (light/dark modes)
- 🧪 Simple and testable widget composition

---

## 🛠️ Getting Started

To start using the package:

1. Add it to your `pubspec.yaml`:
   ```yaml
   dependencies:
     custom_page_scaffold:
       git:
         url: https://github.com/burak-basci/burakbasci_widgets.git
   ```

2. Run:
   ```bash
   flutter pub get
   ```

3. Import it in your Dart code:
   ```dart
   import 'package:burakbasci_widgets/burakbasci_widgets.dart';
   ```

---

## 🚀 Usage

Here's a simple example of using the `CustomPageScaffold` widget:

```dart
import 'package:flutter/material.dart';
import 'package:custom_page_scaffold/custom_page_scaffold.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffolding(
// coming soon
    );
  }
}
```

➡️ For advanced usage and composition examples, check the `/example` directory.

---

## 📚 Additional Information

- **Contributions:** Pull requests are welcome! Please fork the repository and submit a PR.
- **Issues:** Found a bug or want a new feature? [Open an issue](https://github.com/burak-basci/burakbasci_widgets/issues)
- **License:** BSD-3-Clause (see `LICENSE` file)
- **Author:** [Burak Basci](https://github.com/burak-basci)

---

> This package is built primarily for personal use, but you're welcome to use and contribute if you find it helpful. It's ideal for any Flutter project where consistent page layout is needed.
