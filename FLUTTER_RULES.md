# AI Rules for Flutter

This document establishes comprehensive guidelines for Flutter and Dart development, targeting developers familiar with programming but potentially new to Dart.

**Source**: [Official Flutter AI Rules](https://raw.githubusercontent.com/flutter/flutter/refs/heads/main/docs/rules/rules.md)

## Core Principles

**Architecture & Organization:**
- Apply SOLID principles throughout codebases
- Separate ephemeral state from app state using appropriate state management
- Organize projects into presentation, domain, data, and core layers
- Favor feature-based organization for larger projects

**Code Quality:**
- "Write concise, modern, technical Dart code. Prefer functional and declarative patterns."
- Maintain 80-character line limits
- Use meaningful names; avoid abbreviations
- Keep functions short (under 20 lines ideally)

**State Management (Built-in Preferred):**
- `ValueNotifier` with `ValueListenableBuilder` for single values
- `ChangeNotifier` with `ListenableBuilder` for complex shared state
- `Streams` and `StreamBuilder` for async event sequences
- `Futures` and `FutureBuilder` for single async operations
- Manual constructor injection for dependencies

**Navigation:**
- Use `go_router` for declarative routing with deep linking
- Built-in `Navigator` for temporary screens (dialogs)

**UI & Design:**
- Build responsive interfaces using `LayoutBuilder` or `MediaQuery`
- Generate color palettes via `ColorScheme.fromSeed()`
- Support both light and dark themes
- Implement accessibility standards (WCAG 4.5:1 contrast minimum)
- Use `google_fonts` for custom typography

**Testing:**
- Unit tests via `package:test`
- Widget tests via `package:flutter_test`
- Integration tests via `package:integration_test`
- Follow Arrange-Act-Assert pattern

**Documentation:**
- Use `///` for dartdoc comments on public APIs
- Explain *why*, not *what*
- Include code samples where appropriate
