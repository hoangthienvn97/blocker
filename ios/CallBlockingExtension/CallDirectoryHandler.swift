import CallerDataManager
import CallKit
import Foundation

class CallDirectoryHandler: CXCallDirectoryProvider {
    override func beginRequest(with context: CXCallDirectoryExtensionContext) {
        DispatchQueue.main.async {
            context.delegate = self
            if let lastUpdate = CallerDataManager.shared.lastUpdatedDate(), context.isIncremental {
                self.addOrRemoveIncrementalBlockingPhoneNumbers(to: context, since: lastUpdate)
            } else {
                self.addAllBlockingPhoneNumbers(to: context)
            }
            CallerDataManager.shared.setLastUpdatedDate(Date())
            context.completeRequest()
        }
    }

    private func addAllBlockingPhoneNumbers(to context: CXCallDirectoryExtensionContext) {
        let uniqueBlockedNumbers = Array(Set(CallerDataManager.shared.blockedCallers().map { $0.number })).sorted{ $0 < $1 }
        for number in uniqueBlockedNumbers {
          context.addBlockingEntry(withNextSequentialPhoneNumber: number)
        }
      }

    private func addOrRemoveIncrementalBlockingPhoneNumbers(to context: CXCallDirectoryExtensionContext, since date: Date) {
        for caller in CallerDataManager.shared.updatedCallers(since: date) {
          if !caller.isRemoved, caller.isBlocked {
            context.addBlockingEntry(withNextSequentialPhoneNumber: caller.number)
          } else {
            context.removeBlockingEntry(withPhoneNumber: caller.number)
            if caller.isRemoved {
              CallerDataManager.shared.removeCallerFromDatabase(caller)
            }
          }
        }
      }
}

extension CallDirectoryHandler: CXCallDirectoryExtensionContextDelegate {
    func requestFailed(for extensionContext: CXCallDirectoryExtensionContext, withError error: Error) {
        // An error occurred while adding blocking or identification entries, check the NSError for details.
        // For Call Directory error codes, see the CXErrorCodeCallDirectoryManagerError enum in <CallKit/CXError.h>.
        //
        // This may be used to store the error details in a location accessible by the extension’s containing app, so that the
        // app may be notified about errors which occured while loading data even if the request to load data was initiated by
        // the user in Settings instead of via the app itself.
    }
}
