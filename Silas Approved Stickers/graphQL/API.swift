// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum StickerType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case silasApprovedOriginal
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "SILAS_APPROVED_ORIGINAL": self = .silasApprovedOriginal
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .silasApprovedOriginal: return "SILAS_APPROVED_ORIGINAL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: StickerType, rhs: StickerType) -> Bool {
    switch (lhs, rhs) {
      case (.silasApprovedOriginal, .silasApprovedOriginal): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [StickerType] {
    return [
      .silasApprovedOriginal,
    ]
  }
}

public final class AllStickersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllStickers {
      stickers {
        __typename
        id
        name
        type
        location {
          __typename
          lat
          lng
        }
        imageUrl
      }
    }
    """

  public let operationName: String = "AllStickers"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("stickers", type: .nonNull(.list(.object(Sticker.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(stickers: [Sticker?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "stickers": stickers.map { (value: Sticker?) -> ResultMap? in value.flatMap { (value: Sticker) -> ResultMap in value.resultMap } }])
    }

    public var stickers: [Sticker?] {
      get {
        return (resultMap["stickers"] as! [ResultMap?]).map { (value: ResultMap?) -> Sticker? in value.flatMap { (value: ResultMap) -> Sticker in Sticker(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Sticker?) -> ResultMap? in value.flatMap { (value: Sticker) -> ResultMap in value.resultMap } }, forKey: "stickers")
      }
    }

    public struct Sticker: Identifiable, GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Sticker"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(StickerType.self))),
          GraphQLField("location", type: .nonNull(.object(Location.selections))),
          GraphQLField("imageUrl", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, type: StickerType, location: Location, imageUrl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Sticker", "id": id, "name": name, "type": type, "location": location.resultMap, "imageUrl": imageUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var type: StickerType {
        get {
          return resultMap["type"]! as! StickerType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var location: Location {
        get {
          return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "location")
        }
      }

      public var imageUrl: String? {
        get {
          return resultMap["imageUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "imageUrl")
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Location"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lat: Double, lng: Double) {
          self.init(unsafeResultMap: ["__typename": "Location", "lat": lat, "lng": lng])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lat: Double {
          get {
            return resultMap["lat"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lat")
          }
        }

        public var lng: Double {
          get {
            return resultMap["lng"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lng")
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "Login"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(Login.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthPayload", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class SignUpMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SignUp($email: String!, $password: String!, $name: String!) {
      signup(email: $email, password: $password, name: $name) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "SignUp"

  public var email: String
  public var password: String
  public var name: String

  public init(email: String, password: String, name: String) {
    self.email = email
    self.password = password
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password, "name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signup", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password"), "name": GraphQLVariable("name")], type: .object(Signup.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signup: Signup? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signup": signup.flatMap { (value: Signup) -> ResultMap in value.resultMap }])
    }

    public var signup: Signup? {
      get {
        return (resultMap["signup"] as? ResultMap).flatMap { Signup(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "signup")
      }
    }

    public struct Signup: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthPayload", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}
