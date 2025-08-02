# DynamicTypeDictionary

타입 캐스팅 없이 사용할 수 있는 타입 안전한 Swift Dictionary 구현체입니다.

[English Version](README.md)

## 🎯 만들게 된 계기

Swift에서 다양한 타입의 값을 저장하는 Dictionary를 사용할 때 일반적으로 `[AnyHashable: Any]`를 사용합니다. 하지만 이 방식은 값을 가져올 때마다 매번 타입 캐스팅을 해야 하는 번거로움과 오류 가능성이 있었습니다.

```swift
// 기존 방식의 문제점
var dictionary: [String: Any] = [:]
dictionary["name"] = "John"
dictionary["age"] = 25

// 값을 가져올 때마다 타입 캐스팅 필요
let name = dictionary["name"] as? String ?? ""
let age = dictionary["age"] as? Int ?? 0
```

**DynamicTypeDictionary**는 이러한 문제를 해결하기 위해 만들어졌습니다. 컴파일 타임 타입 안전성을 유지하면서도 수동 타입 캐스팅의 필요성을 제거하는 타입 안전한 Dictionary를 제공합니다.

## ✨ 주요 기능

- **타입 안전성**: 컴파일 타임 타입 검사
- **타입 캐스팅 불필요**: 값을 가져올 때 자동으로 올바른 타입 반환
- **기본값 지원**: 존재하지 않는 키에 대해 기본값 자동 반환
- **다중 타입 지원**: 하나의 Dictionary에 여러 타입의 값 저장 가능

## 🚀 사용법

### 기본 사용법

```swift
import DynamicTypeDictionary

// Dictionary 생성
let dictionary = DynamicTypeDictionary()

// 타입별 키 정의 (기본값 포함)
let nameKey = DynamicTypeDictionaryKey(keyId: "name", defaultValue: "알 수 없음")
let ageKey = DynamicTypeDictionaryKey(keyId: "age", defaultValue: 0)
let isActiveKey = DynamicTypeDictionaryKey(keyId: "isActive", defaultValue: false)

// 값 저장
dictionary[nameKey] = "홍길동"
dictionary[ageKey] = 25
dictionary[isActiveKey] = true

// 값 조회 (타입 캐스팅 불필요!)
let name: String = dictionary[nameKey]        // "홍길동"
let age: Int = dictionary[ageKey]             // 25
let isActive: Bool = dictionary[isActiveKey]  // true
```

### 기본값 사용

```swift
// 존재하지 않는 키에 접근하면 기본값 반환
let unknownKey = DynamicTypeDictionaryKey(keyId: "unknown", defaultValue: "해당 없음")
let result: String = dictionary[unknownKey]  // "해당 없음"
```

### 하나의 Dictionary에 여러 타입 저장

```swift
let dictionary = DynamicTypeDictionary()

// 다양한 타입의 키 정의
let stringKey = DynamicTypeDictionaryKey(keyId: "text", defaultValue: "")
let intKey = DynamicTypeDictionaryKey(keyId: "number", defaultValue: 0)
let arrayKey = DynamicTypeDictionaryKey(keyId: "items", defaultValue: [String]())

// 값 저장
dictionary[stringKey] = "안녕하세요!"
dictionary[intKey] = 42
dictionary[arrayKey] = ["Swift", "iOS", "macOS"]

// 타입 안전한 접근
let text: String = dictionary[stringKey]      // "안녕하세요!"
let number: Int = dictionary[intKey]          // 42
let items: [String] = dictionary[arrayKey]    // ["Swift", "iOS", "macOS"]
```

## 🎁 장점

### 1. 타입 안전성
컴파일 타임에 타입이 결정되어 런타임 오류를 방지합니다.

### 2. 깔끔한 코드
```swift
// ❌ 기존 방식
let name = dictionary["name"] as? String ?? "알 수 없음"

// ✅ DynamicTypeDictionary
let name: String = dictionary[nameKey]
```

### 3. 기본값 자동 처리
키가 존재하지 않을 때 기본값을 자동으로 반환하여 nil 체크가 불필요합니다.

### 4. IDE 지원 강화
IDE에서 완전한 타입 정보를 제공하여 개발 생산성이 향상됩니다.

## 📦 설치

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/pinguding/DynamicTypeDictionary.git", from: "1.0.0")
]
```

## 🧪 테스트

```bash
swift test
```

## 📄 라이선스

MIT License

## 👨‍💻 제작자

박종우