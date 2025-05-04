# Flutter Guess The Number Game

A Flutter application that challenges players to guess a random number between 0 and 100. The game keeps track of scores and maintains a list of the top 5 best scores.

## Recent Changes

### Top Scores Implementation
- Added a system to track and display the top 5 scores
- Implemented a beautiful UI to show the scores in a ListView
- Scores are automatically saved when a game is restarted
- Added visual indicators for score positions (1st, 2nd, etc.)

### Technical Improvements
- Created a `_topScores` list in the Game class to store scores
- Added sorting functionality to maintain scores in descending order
- Implemented a maximum limit of 5 scores
- Added proper state management through the ViewModel
- Created a responsive and visually appealing UI for the scores screen

## Features
- Random number generation between 0 and 100
- Score calculation based on how close the guess is to the target number
- Round tracking
- Top 5 scores leaderboard
- Beautiful and intuitive UI

## How to Play
1. Move the slider to guess a number
2. The closer your guess is to the target number, the more points you get
3. Try to get the highest score possible
4. Your best scores will be saved in the top 5 leaderboard

## Getting Started
1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application
