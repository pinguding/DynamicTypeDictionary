//
//  DynamicTypeDictionaryKey.swift
//  DynamicTypeDictionary
//
//  Created by 박종우 on 8/2/25.
//

public struct DynamicTypeDictionaryKey<MatchedValueType>: Hashable {

    public let keyId: String

    public let defaultValue: MatchedValueType

    public init(keyId: String, defaultValue: MatchedValueType) {
        self.keyId = keyId
        self.defaultValue = defaultValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.keyId)
    }

    public static func == (lhs: DynamicTypeDictionaryKey<MatchedValueType>,
                           rhs: DynamicTypeDictionaryKey<MatchedValueType>) -> Bool {
        return lhs.keyId == rhs.keyId
    }
}
