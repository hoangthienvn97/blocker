import Foundation
import RealmSwift

@objcMembers
public final class Caller: Object {
    dynamic var uuid = UUID().uuidString
    public dynamic var isBlocked: Bool = true
    public dynamic var isRemoved: Bool = false
    public dynamic var number: Int64 = 0
    public dynamic var updatedDate: Date?

    override public static func primaryKey() -> String? {
        return "uuid"
    }

    public convenience init(number: Int64,
                            isBlocked: Bool,
                            isRemoved: Bool) {
        self.init()
        self.number = number
        self.isBlocked = isBlocked
        self.isRemoved = isRemoved
        self.updatedDate = Date()
    }
}
