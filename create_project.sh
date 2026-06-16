#!/bin/bash
mkdir -p "DogSwipeApp.xcodeproj"
cd "DogSwipeApp.xcodeproj"
cat > project.pbxproj << 'PBXPROJ'
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 56;
	objects = {
		1A1A1A1A1A1A1A1A1A1A1A1A /* DogSwipeApp.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DogSwipeApp.swift; sourceTree = "<group>"; };
		1A1A1A1A1A1A1A1A1A1A1A1B /* DogBreed.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DogBreed.swift; sourceTree = "<group>"; };
		1A1A1A1A1A1A1A1A1A1A1A1C /* MainTabView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = MainTabView.swift; sourceTree = "<group>"; };
		1A1A1A1A1A1A1A1A1A1A1A1D /* BreedSelectionView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = BreedSelectionView.swift; sourceTree = "<group>"; };
		1A1A1A1A1A1A1A1A1A1A1A1E /* SwipeView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SwipeView.swift; sourceTree = "<group>"; };
		1A1A1A1A1A1A1A1A1A1A1A1F /* StoreView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = StoreView.swift; sourceTree = "<group>"; };
		1A1A1A1A1A1A1A1A1A1A1A20 /* EmergencyMapView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EmergencyMapView.swift; sourceTree = "<group>"; };
		1A1A1A1A1A1A1A1A1A1A1A21 /* EventsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = EventsView.swift; sourceTree = "<group>"; };
		1A1A1A1A1A1A1A1A1A1A1A22 /* VetBookingView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = VetBookingView.swift; sourceTree = "<group>"; };
		1A1A1A1A1A1A1A1A1A1A1A23 /* SettingsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SettingsView.swift; sourceTree = "<group>"; };
		1B1B1B1B1B1B1B1B1B1B1B1B /* DogSwipeApp.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = DogSwipeApp.app; sourceTree = BUILT_PRODUCTS_DIR; };
		1C1C1C1C1C1C1C1C1C1C1C1C /* DogSwipeApp */ = {
			isa = PBXGroup;
			children = (
				1A1A1A1A1A1A1A1A1A1A1A1A /* DogSwipeApp.swift */,
				1D1D1D1D1D1D1D1D1D1D1D1D /* Models */,
				1E1E1E1E1E1E1E1E1E1E1E1E /* Views */,
			);
			path = DogSwipeApp;
			sourceTree = "<group>";
		};
		1D1D1D1D1D1D1D1D1D1D1D1D /* Models */ = {
			isa = PBXGroup;
			children = (
				1A1A1A1A1A1A1A1A1A1A1A1B /* DogBreed.swift */,
			);
			path = Models;
			sourceTree = "<group>";
		};
		1E1E1E1E1E1E1E1E1E1E1E1E /* Views */ = {
			isa = PBXGroup;
			children = (
				1A1A1A1A1A1A1A1A1A1A1A1C /* MainTabView.swift */,
				1A1A1A1A1A1A1A1A1A1A1A1D /* BreedSelectionView.swift */,
				1A1A1A1A1A1A1A1A1A1A1A1E /* SwipeView.swift */,
				1A1A1A1A1A1A1A1A1A1A1A1F /* StoreView.swift */,
				1A1A1A1A1A1A1A1A1A1A1A20 /* EmergencyMapView.swift */,
				1A1A1A1A1A1A1A1A1A1A1A21 /* EventsView.swift */,
				1A1A1A1A1A1A1A1A1A1A1A22 /* VetBookingView.swift */,
				1A1A1A1A1A1A1A1A1A1A1A23 /* SettingsView.swift */,
			);
			path = Views;
			sourceTree = "<group>";
		};
		1F1F1F1F1F1F1F1F1F1F1F1F /* Products */ = {
			isa = PBXGroup;
			children = (
				1B1B1B1B1B1B1B1B1B1B1B1B /* DogSwipeApp.app */,
			);
			name = Products;
			sourceTree = "<group>";
		};
		2A2A2A2A2A2A2A2A2A2A2A2A = {
			isa = PBXGroup;
			children = (
				1C1C1C1C1C1C1C1C1C1C1C1C /* DogSwipeApp */,
				1F1F1F1F1F1F1F1F1F1F1F1F /* Products */,
			);
			sourceTree = "<group>";
		};
		2B2B2B2B2B2B2B2B2B2B2B2B /* DogSwipeApp */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = 2D2D2D2D2D2D2D2D2D2D2D2D /* Build configuration list for PBXNativeTarget "DogSwipeApp" */;
			buildPhases = (
				2E2E2E2E2E2E2E2E2E2E2E2E /* Sources */,
				2F2F2F2F2F2F2F2F2F2F2F2F /* Frameworks */,
				3A3A3A3A3A3A3A3A3A3A3A3A /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = DogSwipeApp;
			productName = DogSwipeApp;
			productReference = 1B1B1B1B1B1B1B1B1B1B1B1B /* DogSwipeApp.app */;
			productType = "com.apple.product-type.application";
		};
		2C2C2C2C2C2C2C2C2C2C2C2C /* Project object */ = {
			isa = PBXProject;
			attributes = {
				BuildIndependentTargetsInParallel = 1;
				LastSwiftUpdateCheck = 1500;
				LastUpgradeCheck = 1500;
			};
			buildConfigurationList = 3B3B3B3B3B3B3B3B3B3B3B3B /* Build configuration list for PBXProject "DogSwipeApp" */;
			compatibilityVersion = "Xcode 14.0";
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
			);
			mainGroup = 2A2A2A2A2A2A2A2A2A2A2A2A;
			productRefGroup = 1F1F1F1F1F1F1F1F1F1F1F1F /* Products */;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				2B2B2B2B2B2B2B2B2B2B2B2B /* DogSwipeApp */,
			);
		};
		2D2D2D2D2D2D2D2D2D2D2D2D /* Build configuration list for PBXNativeTarget "DogSwipeApp" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				3C3C3C3C3C3C3C3C3C3C3C3C /* Debug */,
				3D3D3D3D3D3D3D3D3D3D3D3D /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		2E2E2E2E2E2E2E2E2E2E2E2E /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				4A4A4A4A4A4A4A4A4A4A4A4A /* DogSwipeApp.swift in Sources */,
				4A4A4A4A4A4A4A4A4A4A4A4B /* DogBreed.swift in Sources */,
				4A4A4A4A4A4A4A4A4A4A4A4C /* MainTabView.swift in Sources */,
				4A4A4A4A4A4A4A4A4A4A4A4D /* BreedSelectionView.swift in Sources */,
				4A4A4A4A4A4A4A4A4A4A4A4E /* SwipeView.swift in Sources */,
				4A4A4A4A4A4A4A4A4A4A4A4F /* StoreView.swift in Sources */,
				4A4A4A4A4A4A4A4A4A4A4A50 /* EmergencyMapView.swift in Sources */,
				4A4A4A4A4A4A4A4A4A4A4A51 /* EventsView.swift in Sources */,
				4A4A4A4A4A4A4A4A4A4A4A52 /* VetBookingView.swift in Sources */,
				4A4A4A4A4A4A4A4A4A4A4A53 /* SettingsView.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		2F2F2F2F2F2F2F2F2F2F2F2F /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		3A3A3A3A3A3A3A3A3A3A3A3A /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		3B3B3B3B3B3B3B3B3B3B3B3B /* Build configuration list for PBXProject "DogSwipeApp" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				3E3E3E3E3E3E3E3E3E3E3E3E /* Debug */,
				3F3F3F3F3F3F3F3F3F3F3F3F /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		3C3C3C3C3C3C3C3C3C3C3C3C /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = YES;
				INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
				INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
				INFOPLIST_KEY_UILaunchScreen_Generation = YES;
				INFOPLIST_KEY_UISupportedInterfaceOrientations = UIInterfaceOrientationPortrait;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.dogswipe.DogSwipeApp;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = "1,2";
			};
			name = Debug;
		};
		3D3D3D3D3D3D3D3D3D3D3D3D /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = YES;
				INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
				INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
				INFOPLIST_KEY_UILaunchScreen_Generation = YES;
				INFOPLIST_KEY_UISupportedInterfaceOrientations = UIInterfaceOrientationPortrait;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.dogswipe.DogSwipeApp;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = "1,2";
			};
			name = Release;
		};
		3E3E3E3E3E3E3E3E3E3E3E3E /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = dwarf;
				ENABLE_TESTABILITY = YES;
				GCC_C_LANGUAGE_STANDARD = gnu17;
				GCC_DYNAMIC_NO_PIC = NO;
				GCC_OPTIMIZATION_LEVEL = 0;
				GCC_PREPROCESSOR_DEFINITIONS = (
					"DEBUG=1",
					"$(inherited)",
				);
				IPHONEOS_DEPLOYMENT_TARGET = 15.0;
				MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
				ONLY_ACTIVE_ARCH = YES;
				SDKROOT = iphoneos;
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG $(inherited)";
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
			};
			name = Debug;
		};
		3F3F3F3F3F3F3F3F3F3F3F3F /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
				ENABLE_NS_ASSERTIONS = NO;
				GCC_C_LANGUAGE_STANDARD = gnu17;
				IPHONEOS_DEPLOYMENT_TARGET = 15.0;
				MTL_ENABLE_DEBUG_INFO = NO;
				SDKROOT = iphoneos;
				SWIFT_COMPILATION_MODE = wholemodule;
				VALIDATE_PRODUCT = YES;
			};
			name = Release;
		};
		4A4A4A4A4A4A4A4A4A4A4A4A /* DogSwipeApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A1A1A1A1A1A1A1A1A1A1A1A /* DogSwipeApp.swift */; };
		4A4A4A4A4A4A4A4A4A4A4A4B /* DogBreed.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A1A1A1A1A1A1A1A1A1A1A1B /* DogBreed.swift */; };
		4A4A4A4A4A4A4A4A4A4A4A4C /* MainTabView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A1A1A1A1A1A1A1A1A1A1A1C /* MainTabView.swift */; };
		4A4A4A4A4A4A4A4A4A4A4A4D /* BreedSelectionView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A1A1A1A1A1A1A1A1A1A1A1D /* BreedSelectionView.swift */; };
		4A4A4A4A4A4A4A4A4A4A4A4E /* SwipeView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A1A1A1A1A1A1A1A1A1A1A1E /* SwipeView.swift */; };
		4A4A4A4A4A4A4A4A4A4A4A4F /* StoreView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A1A1A1A1A1A1A1A1A1A1A1F /* StoreView.swift */; };
		4A4A4A4A4A4A4A4A4A4A4A50 /* EmergencyMapView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A1A1A1A1A1A1A1A1A1A1A20 /* EmergencyMapView.swift */; };
		4A4A4A4A4A4A4A4A4A4A4A51 /* EventsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A1A1A1A1A1A1A1A1A1A1A21 /* EventsView.swift */; };
		4A4A4A4A4A4A4A4A4A4A4A52 /* VetBookingView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A1A1A1A1A1A1A1A1A1A1A22 /* VetBookingView.swift */; };
		4A4A4A4A4A4A4A4A4A4A4A53 /* SettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A1A1A1A1A1A1A1A1A1A1A23 /* SettingsView.swift */; };
	};
	rootObject = 2C2C2C2C2C2C2C2C2C2C2C2C /* Project object */;
}
PBXPROJ
