# Dog Swipe App 🐕

A Tinder-style iOS app for swiping through dog pictures by breed!

## Features

- **Breed Selection Screen**: Choose from 4 dog breeds with visual cards
  - Australian Shepherd
  - Golden Retriever
  - German Shepherd
  - St. Bernard

- **Swipe Interface**: Tinder-style swipe functionality
  - Swipe right (or tap heart) to like a dog
  - Swipe left (or tap X) to pass
  - Visual indicators show your choice
  - Cards animate smoothly with rotation and offset

## How to Run

### Prerequisites
- macOS with Xcode 15.0 or later
- iOS 15.0+ simulator or device

### Setup Instructions

1. **Open in Xcode**:
   ```bash
   open DogSwipeApp.xcodeproj
   ```

2. **Add Assets to Xcode**:
   - The app expects images to be in the main bundle under `Assets/breed` and `Assets/dogs`
   - In Xcode, create an Asset Catalog or add the Assets folder to the project
   - Make sure "Copy items if needed" is checked when adding the Assets folder

3. **Build and Run**:
   - Select an iOS simulator (iPhone 14 or later recommended)
   - Click the Play button or press Cmd+R

## Project Structure

```
DogSwipeApp/
├── DogSwipeApp.swift           # App entry point
├── Models/
│   └── DogBreed.swift          # Breed enum and image loading logic
└── Views/
    ├── BreedSelectionView.swift # Main selection screen
    └── SwipeView.swift          # Swipe interface
```

## How It Works

1. **Launch**: App opens to the breed selection screen showing 4 breed cards in a grid
2. **Select Breed**: Tap any breed card to open the swipe view for that breed
3. **Swipe**: 
   - Drag cards left or right
   - Or use the X (reject) and heart (accept) buttons
   - Visual feedback shows your choice
4. **Complete**: After all dogs are reviewed, see your results and choose another breed

## Customization

To add more breeds:
1. Add breed images to `Assets/breed/`
2. Add dog images to `Assets/dogs/` (prefix with breed name)
3. Update the `DogBreed` enum in `DogBreed.swift`

## Requirements

- iOS 15.0+
- SwiftUI
- Xcode 15.0+

Enjoy swiping through adorable dog pictures! 🐶❤️
