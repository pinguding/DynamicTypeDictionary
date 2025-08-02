import Testing
@testable import DynamicTypeDictionary

@Test func notStoredKeyAccessShouldReturnDefaultValue() {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let defaultValue: Int = 1
    let key = DynamicTypeDictionaryKey(keyId: "testKey", defaultValue: defaultValue)
    let dictionary = DynamicTypeDictionary()
    #expect(dictionary[key] == defaultValue)
}

@Test func storedKeyShouldReturnStoredValue() {
    let storedValue: Int = 10
    let key = DynamicTypeDictionaryKey(keyId: "testKey", defaultValue: 1)
    let dictionary = DynamicTypeDictionary()
    dictionary[key] = storedValue
    #expect(dictionary[key] == storedValue)
}

@Test func multipleKeysWithSameIdShouldReturnLastStoredValue() {
    let storedValue: Int = 10
    let key = DynamicTypeDictionaryKey(keyId: "testKey", defaultValue: 1)
    let dictionary = DynamicTypeDictionary()

    dictionary[key] = 0
    dictionary[key] = storedValue
    #expect(dictionary[key] == storedValue)
}

@Test func dynamicTypeDictionaryCanStoreMultiTypeValue() {

    let dictionary = DynamicTypeDictionary()

    let stringKey = DynamicTypeDictionaryKey(keyId: "stringKey", defaultValue: "defaultValue")
    let intKey = DynamicTypeDictionaryKey(keyId: "intKey", defaultValue: 0)
    let boolKey = DynamicTypeDictionaryKey(keyId: "boolKey", defaultValue: false)

    let resultStringValue = "Result String"
    let resultIntValue = 42
    let resultBoolValue = true

    dictionary[stringKey] = resultStringValue
    dictionary[intKey] = resultIntValue
    dictionary[boolKey] = resultBoolValue

    #expect(dictionary[stringKey] == resultStringValue)
    #expect(dictionary[intKey] == resultIntValue)
    #expect(dictionary[boolKey] == resultBoolValue)
}
