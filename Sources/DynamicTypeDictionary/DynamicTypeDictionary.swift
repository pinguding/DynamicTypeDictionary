//
//  DynamicTypeDictionary.swift
//  DynamicTypeDictionary
//
//  Created by 박종우 on 8/2/25.

public class DynamicTypeDictionary {

    private var storage: [String: Any]

    public required init() {
        self.storage = [:]
    }

    private func getValue<DictionaryValueType>(_ key: DynamicTypeDictionaryKey<DictionaryValueType>) -> DictionaryValueType {
        if let value = self.storage[key.keyId] as? DictionaryValueType {
            return value
        } else {
            self.setValue(key, value: key.defaultValue)
            return key.defaultValue
        }
    }

    private func setValue<DictionaryValueType>(_ key: DynamicTypeDictionaryKey<DictionaryValueType>, value: DictionaryValueType) {
        self.storage[key.keyId] = value
    }

    public subscript<DictionaryValueType>(key: DynamicTypeDictionaryKey<DictionaryValueType>) -> DictionaryValueType {
        get {
            return self.getValue(key)
        } set {
            self.setValue(key, value: newValue)
        }
    }
}
