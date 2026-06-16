import Foundation

enum DogBreed: String, CaseIterable {
    case australian = "australian"
    case golden = "golden"
    case german = "german"
    case stBernard = "st_bernard"
    
    var displayName: String {
        switch self {
        case .australian:
            return "Australian Shepherd"
        case .golden:
            return "Golden Retriever"
        case .german:
            return "German Shepherd"
        case .stBernard:
            return "St. Bernard"
        }
    }
    
    var iconImageName: String {
        return rawValue
    }
    
    func getDogImages() -> [String] {
        let prefix = rawValue == "st_bernard" ? "stbernard" : rawValue
        
        // Return image names from Assets catalog
        switch self {
        case .australian:
            return ["australian1", "australian2", "australian3", "australian4"]
        case .golden:
            return ["golden1", "golden2", "golden3", "golden4", "golden5"]
        case .german:
            return ["german1", "german2", "german3", "german4"]
        case .stBernard:
            return ["stbernard1", "stbernard2", "stbernard3", "stbernard4"]
        }
    }
}
