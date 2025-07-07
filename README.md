
# Trippify 🌍✈️🚉

__Trippify__ is an AI-powered trip planning application designed to make travel planning seamless and personalized. Built with __Flutter__ and __AWS Amplify__, Trippify offers a range of features to help users create, manage, and share their travel plans with a global community.

<p align="center">
  <img src="assets/screenshots/ss2.jpg" alt="Image 1" width="200">
  <img src="assets/screenshots/ss1.jpg" alt="Image 2" width="200">
</p>


## Features ✨


- __Browse Trips__: Explore a variety of trips shared by other travelers from around the world
- __Manual Trip Creation__: Create custom trip plans with complete flexibility.
- __AI-Generated Trips__: Use Google Gemini API to generate AI-powered trip plans tailored to your preferences.
- __Real-Time Travel Info__: Access ongoing flight details (via Skyscanner API) and train schedules (via IRCTC API).
- __Global Community Sharing__: Share your trips to inspire and connect with other adventurers.

## Tech Stack 🛠️

**Frontend**: Flutter

**Backend**: AWS Amplify (Authentication, API, and Storage)

**State Management**: Bloc

**Local Database**: Hive

**APIs**: Google Gemini API, Flight API, IRCTC API

## Features Breakdown
### 1. Authentication
- **Email and Password Authentication:** Implemented using AWS Amplify Auth for secure user sign-up and login.

- **Google Sign-In:** Integrated with AWS Amplify to allow users to sign in using their Google accounts.

### 2. User Information Storage
- User information, including profile details, is securely stored in AWS Amplify's database.

### 3. Trip Management
- User-created trips are stored in Amplify Storage, ensuring accessibility and synchronization across devices.

- Trips can be manually created or generated via **Google Gemini API** for AI-driven suggestions.

### 4. Local Data Persistence
- **Hive** is used as the local database to cache user data and trips for offline access and improved performance.

### 5. Real-Time Travel Information
- **Skyscanner API:** Provides real-time flight schedules and updates.

- **IRCTC API:** Fetches live train information for planning travel by rail.

### 6. State Management
- **Bloc** is used to manage state efficiently across the application, ensuring a smooth and responsive user experience.


## How to Run the Project 🚀

**Prerequisites**

1. Flutter SDK installed.
2. AWS Amplify CLI configured.
3. API keys for Google Gemini API, Flight API, and IRCTC API.

**Steps to Set Up**
1. Clone the repository:
```bash
git clone https://github.com/arman-pani/trippify.git
cd trippify 
```
2. Install dependencies:
```bash
flutter pub get
```
3. Configure AWS Amplify: Ensure that authentication, storage, and API modules are configured in the backend.
```bash
amplify init  
amplify push
```
4. Add API keys for Google Gemini, Flight API, and IRCTC API to a secure configuration file.

5. Run the app:
```bash
flutter run
```


## Contribution 🤝

We welcome contributions from the community! To contribute:

- Fork the repository.
- Create a feature branch:
```bash
git checkout -b feature-name
```
- Commit your changes and push to the branch.
- Create a pull request for review.

## License 📜

This project is licensed under [MIT](https://choosealicense.com/licenses/mit/) License.

