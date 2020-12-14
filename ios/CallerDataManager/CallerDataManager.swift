//
//  CallerDataManager.swift
//  CallerDataManager
//
//  Created by Nguyen Truong Luu on 11/27/20.
//  Copyright © 2020 Open Web Technology SA. All rights reserved.
//

import CallKit
import UIKit

public final class CallerDataManager {
    public static let shared = CallerDataManager()
    private init() {}
    
    public func lastUpdatedDate() -> Date? {
        return RealmHelper.shared.lastUpdatedDate()
    }
    
    public func setLastUpdatedDate(_ date: Date?) {
        RealmHelper.shared.setLastUpdatedDate(date)
    }
    
    public func blockedCallers() -> [Caller] {
        return RealmHelper.shared.callers(onlyBlocked: true)
    }
    
    public func blockedNumbers() -> [Int64] {
        return RealmHelper.shared.callers(onlyBlocked: true).map{$0.number}
    }
    
    public func allNumbers() -> [Int64] {
        return RealmHelper.shared.callers(onlyBlocked: false, includeRemoved: true).map{$0.number}
    }
    
    public func updatedCallers(since date: Date) -> [Caller] {
        return RealmHelper.shared.callers(includeRemoved: true, since: date)
    }
    
    public func blockNumbers(_ numbers: [Int64]) {
        if RealmHelper.shared.callers(onlyBlocked: false, includeRemoved: true).isEmpty {
            CallerDataManager.shared.setLastUpdatedDate(nil)
        }
        
        numbers.forEach { number in
            if let caller = getCaller(number: number) {
                RealmHelper.shared.updateCaller(caller, number: caller.number, isBlocked: true, isRemoved: false)
            } else {
                RealmHelper.shared.addCallers([Caller(number: number, isBlocked: true, isRemoved: false)])
            }
        }
        
        UIApplication.reloadCallKitExtension()
    }
    
    public func unblockNumbers(_ numbers: [Int64]) {
        numbers.forEach { (number) in
            if let caller = getCaller(number: number) {
                RealmHelper.shared.updateCaller(caller, number: caller.number, isBlocked: false, isRemoved: true)
            } else {
                RealmHelper.shared.addCallers([Caller(number: number, isBlocked: false, isRemoved: true)])
            }
        }
        
        UIApplication.reloadCallKitExtension()
    }
    
    public func toggleNumber(_ number: Int64, isBlocked: Bool) {
        if isBlocked {
            blockNumbers([number])
        } else {
            unblockNumbers([number])
        }
    }
    
    public func unblockAllNumbers() {
        for caller in RealmHelper.shared.callers(onlyBlocked: false, includeRemoved: true) {
            RealmHelper.shared.updateCaller(caller, number: caller.number, isBlocked: false, isRemoved: true)
        }
        
        UIApplication.reloadCallKitExtension()
    }
    
    public func removeCallerFromDatabase(_ caller: Caller) {
        RealmHelper.shared.removeCaller(caller)
    }
    
    public func getCaller(number: Int64) -> Caller? {
        return RealmHelper.shared.getCaller(number: number)
    }
}

internal extension UIApplication {
    static func reloadCallKitExtension() {
        CXCallDirectoryManager.sharedInstance.reloadExtension(withIdentifier: "co.vacsolutions.secretbox.CallBlockingExtension", completionHandler: { error in
            if let error = error {
                print("Error reloading extension: \(error.localizedDescription)")
            }
        })
    }
}
