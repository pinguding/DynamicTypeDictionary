# DynamicTypeDictionary

A type-safe dictionary implementation for Swift that eliminates the need for manual type casting.

[한국어 버전](README.ko.md)

## 🎯 Motivation

When using dictionaries to store various types of values in Swift, we typically use `[AnyHashable: Any]`. However, this approach requires manual type casting every time we retrieve values, which can be cumbersome and error-prone.

```swift
// Problems with the traditional approach
var dictionary: [String: Any] = [:]
dictionary["name"] = "John"
dictionary["age"] = 25

// Type casting required every time
let name = dictionary["name"] as? String ?? ""
let age = dictionary["age"] as? Int ?? 0
```

**DynamicTypeDictionary** was created to solve this problem. It provides a type-safe dictionary that eliminates the need for manual type casting while maintaining compile-time type safety.

## ✨ Features

- **Type Safety**: Compile-time type checking
- **No Type Casting Required**: Automatically returns the correct type when retrieving values
- **Default Value Support**: Automatically returns default values for non-existent keys
- **Multi-Type Support**: Store multiple types of values in a single dictionary

## 🚀 Usage

### Basic Usage

```swift
import DynamicTypeDictionary

// Create dictionary
let dictionary = DynamicTypeDictionary()

// Define type-specific keys with default values
let nameKey = DynamicTypeDictionaryKey(keyId: "name", defaultValue: "Unknown")
let ageKey = DynamicTypeDictionaryKey(keyId: "age", defaultValue: 0)
let isActiveKey = DynamicTypeDictionaryKey(keyId: "isActive", defaultValue: false)

// Store values
dictionary[nameKey] = "John Doe"
dictionary[ageKey] = 25
dictionary[isActiveKey] = true

// Retrieve values (no type casting needed!)
let name: String = dictionary[nameKey]        // "John Doe"
let age: Int = dictionary[ageKey]             // 25
let isActive: Bool = dictionary[isActiveKey]  // true
```

### Default Values

```swift
// Returns default value when accessing non-existent keys
let unknownKey = DynamicTypeDictionaryKey(keyId: "unknown", defaultValue: "N/A")
let result: String = dictionary[unknownKey]  // "N/A"
```

### Multiple Types in One Dictionary

```swift
let dictionary = DynamicTypeDictionary()

// Define keys for various types
let stringKey = DynamicTypeDictionaryKey(keyId: "text", defaultValue: "")
let intKey = DynamicTypeDictionaryKey(keyId: "number", defaultValue: 0)
let arrayKey = DynamicTypeDictionaryKey(keyId: "items", defaultValue: [String]())

// Store values
dictionary[stringKey] = "Hello, World!"
dictionary[intKey] = 42
dictionary[arrayKey] = ["Swift", "iOS", "macOS"]

// Type-safe access
let text: String = dictionary[stringKey]      // "Hello, World!"
let number: Int = dictionary[intKey]          // 42
let items: [String] = dictionary[arrayKey]    // ["Swift", "iOS", "macOS"]
```

## 🎁 Advantages

### 1. Type Safety
Compile-time type determination prevents runtime errors.

### 2. Cleaner Code
```swift
// ❌ Traditional approach
let name = dictionary["name"] as? String ?? "Unknown"

// ✅ DynamicTypeDictionary
let name: String = dictionary[nameKey]
```

### 3. Automatic Default Value Handling
Eliminates the need for nil checks by automatically returning default values when keys don't exist.

### 4. IntelliSense Support
Provides complete type information in IDEs, improving development productivity.

## 📦 Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/pinguding/DynamicTypeDictionary.git", from: "1.0.0")
]
```

## 🧪 Testing

```bash
swift test
```

## 📄 License

MIT License

## 👨‍💻 Author

Created by Jongwoo Park