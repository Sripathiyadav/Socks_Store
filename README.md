SOCKS_STORE

​
Table of Contents

Overview
Getting Started
Prerequisites
Installation
Usage
Testing
Overview

Socks_Store is a feature-rich, cross-platform Flutter-based e-commerce template designed to accelerate your development process across mobile, desktop, and web. It combines a modular architecture with native platform integrations, ensuring a seamless user experience on Windows, macOS, Linux, iOS, Android, and Web.

Why Socks_Store?

This project streamlines the creation of scalable, maintainable shopping apps with a focus on code quality and platform-specific optimizations. The core features include:

🎯 🧩 Cross-Platform Compatibility: Supports Flutter, Windows, macOS, Linux, iOS, Android, and Web, enabling broad reach.
🚀 Platform-Specific Build Configurations: Custom CMake and build scripts ensure smooth deployment on each platform.
🔌 Plugin & Resource Management: Automated plugin registration and resource handling streamline development.
🎨 UI Components & Navigation: Pre-built screens, custom navigation, and reusable widgets facilitate rapid UI development.
🛠️ Code Quality & Standards: Static analysis and linting configurations promote consistent, maintainable code.
⚙️ Modular Architecture: Organized source code structure supports scalability and easy customization.
Getting Started

Prerequisites

This project requires the following dependencies:

Programming Language: Dart
Package Manager: Pub, Cmake, Gradle
Container Runtime: Podman
Installation

Build Socks_Store from the source and install dependencies:

Clone the repository:

❯ git clone https://github.com/Sripathiyadav/Socks_Store
Navigate to the project directory:

❯ cd Socks_Store
Install the dependencies:

Using pub:

❯ pub get
Using cmake:

❯ cmake . && make
Using gradle:

❯ gradle build
Usage

Run the project with:

Using pub:

dart {entrypoint}
Using cmake:

./Socks_Store
Using gradle:

gradle run
Testing

Socks_store uses the {test_framework} test framework. Run the test suite with:

Using pub:

pub run test
Using cmake:

ctest
Using gradle:

gradle test
