# NewsWave

<p align="center">
  <img src="assets/images/app_logo.png" alt="NewsWave Logo" width="200"/>
</p>

A modern news application built with Flutter that delivers real-time news across various categories, with a clean and intuitive user interface.

## 📱 Features

- **Categorized News**: Browse news from multiple categories (General, Business, Entertainment, Health, Science, Technology, Sports)
- **Search Functionality**: Search for specific news topics, keywords, or events
- **Dark Mode Support**: Toggle between light and dark themes for comfortable reading in any environment
- **Responsive Design**: Fully responsive UI that adapts to different screen sizes
- **Smooth User Experience**: Fluid animations and transitions
- **Error Handling**: Graceful error handling with user-friendly messages

## 📸 Screenshots

<p align="center">
  <img src="screenshots/home_light.png" width="200" alt="Home Screen (Light)"/>
  <img src="screenshots/home_dark.png" width="200" alt="Home Screen (Dark)"/>
  <img src="screenshots/search.png" width="200" alt="Search Screen"/>
  <img src="screenshots/category.png" width="200" alt="Category View"/>
</p>

## 🛠️ Architecture & Technologies

NewsWave is built using the BLoC (Business Logic Component) pattern, which separates the presentation layer from the business logic.

### Key Technologies:

- **Flutter**: Cross-platform UI toolkit
- **flutter_bloc**: State management solution
- **Dio**: HTTP client for API requests
- **Equatable**: Simplifies equality comparisons

### Project Structure:

```
lib/
├── models/              # Data models
├── services/            # API services and data fetching
├── news/                # News-related state management
├── theme/               # Theme management
├── views/               # UI screens
│   ├── home/            # Home screen
│   ├── search/          # Search functionality
│   └── about/           # About screen
├── widgets/             # Reusable UI components
└── main.dart            # Application entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter (latest stable version)
- An IDE (VS Code, Android Studio, etc.)
- News API key (from [newsapi.org](https://newsapi.org/))

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/ahmedhamodaa/NewsWave.git
   cd NewsWave
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Replace the API key in `news_service.dart` with your own key:
   ```dart
   final String apiKey = 'YOUR_API_KEY';
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## 📄 API Usage

This app uses the [News API](https://newsapi.org/) to fetch news articles. The free tier has some limitations:
- Limited number of requests per day
- Only available for development environments
- Some endpoints restricted

For production use, consider upgrading to a paid plan.

## 🤝 Contributing

Contributions are welcome! Feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Ahmed Elsayed Hamoda**

- GitHub: [ahmedhamodaa](https://github.com/ahmedhamodaa)
- Email: ahmdhamoda11@gmail.com

## 🙏 Acknowledgements

- [News API](https://newsapi.org/) for providing the news data
- [Flutter Team](https://flutter.dev/) for the amazing framework
- All contributors and supporters of this project
