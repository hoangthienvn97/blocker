import CallKit
import Foundation
import RealmSwift

internal final class RealmHelper {
    private static let applicationGroupIdentifier = "group.co.vacsolutions.callblocker"
    static let shared = RealmHelper()
    private let sharedUserDefaults = UserDefaults(suiteName: RealmHelper.applicationGroupIdentifier)
    private let lastUpdatedDateKey = "lastUpdatedDateKey"
    private init() {}
    private lazy var sharedRealm: Realm = {
        try! Realm(configuration: realmConfiguration)
    }()
    
    private lazy var realmConfiguration: Realm.Configuration = {
        let directory = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: RealmHelper.applicationGroupIdentifier)!
        let realmPath = directory.appendingPathComponent("db.realm")
        var configuration = Realm.Configuration.defaultConfiguration
        configuration.fileURL = realmPath
        return configuration
    }()
    
    func lastUpdatedDate() -> Date? {
        return sharedUserDefaults?.object(forKey: lastUpdatedDateKey) as? Date
    }
    
    func setLastUpdatedDate(_ date: Date?) {
        sharedUserDefaults?.set(date, forKey: lastUpdatedDateKey)
    }
    
    func callers(onlyBlocked: Bool = false, includeRemoved: Bool = false, since date: Date? = nil) -> [Caller] {
        var predicates: [NSPredicate] = []
        if onlyBlocked {
            let blockedPredicate = NSPredicate(format: "isBlocked == %@", NSNumber(value: true))
            predicates.append(blockedPredicate)
        }
        if !includeRemoved {
            let removedPredicate = NSPredicate(format: "isRemoved == %@", NSNumber(value: false))
            predicates.append(removedPredicate)
        }
        if let dateFrom = date {
            let datePredicate = NSPredicate(format: "updatedDate > %@", dateFrom as NSDate)
            predicates.append(datePredicate)
        }
        let predicate = NSCompoundPredicate(type: .and, subpredicates: predicates)
        return sharedRealm.objects(Caller.self).filter(predicate).map { $0 }
    }
    
    func addCallers(_ callers: [Caller]) {
        do {
            try sharedRealm.write {
                sharedRealm.add(callers)
            }
        } catch {
            print("RealmHelper error: \(error.localizedDescription)")
        }
    }
    
    func updateCaller(_ caller: Caller,
                      number: Int64,
                      isBlocked: Bool = true,
                      isRemoved: Bool = false)
    {
        do {
            try sharedRealm.write {
                caller.number = number
                caller.isBlocked = isBlocked
                caller.isRemoved = isRemoved
                caller.updatedDate = Date()
                sharedRealm.add(caller, update: .modified)
            }
        } catch {
            print("RealmHelper error: \(error.localizedDescription)")
        }
    }
    
    func removeCaller(_ caller: Caller) {
        do {
            try sharedRealm.write {
                sharedRealm.delete(caller)
            }
        } catch {
            print("RealmHelper error: \(error.localizedDescription)")
        }
    }
    
    func getCaller(number: Int64) -> Caller? {
        return sharedRealm.objects(Caller.self).filter(NSPredicate(format: "number == %@", NSNumber(value: number))).first
    }
}
