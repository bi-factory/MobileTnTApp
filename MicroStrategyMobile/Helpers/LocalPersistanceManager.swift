//created on  2/04/24

import Foundation

enum PersistanceKeys: String {
    
    case shouldRememberUser
    
}

protocol LocalPersistanceRepresentable {
    
    func getShouldRememberUser() -> Bool?
    func setShouldRememberUser(_ value: Bool)
    func deleteShouldRememberUser()
    
    var shouldRememberUser: Bool { get set }
    
}

final class LocalPersistanceManager: LocalPersistanceRepresentable {
    
    func getShouldRememberUser() -> Bool? {
        return getData(forKey: .shouldRememberUser)
    }
    
    func setShouldRememberUser(_ value: Bool) {
        saveData(value, forKey: .shouldRememberUser)
    }
    
    func deleteShouldRememberUser() {
        delete(forKey: .shouldRememberUser)
    }
    
    static let shared = LocalPersistanceManager()
    
    var shouldRememberUser = false
    
    private init() {}
    
    func saveData<T>(_ value: T, forKey key: PersistanceKeys) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key.rawValue)
    }
    
    func getData<T>(forKey key: PersistanceKeys) -> T? {
        let defaults = UserDefaults.standard
        return defaults.value(forKey: key.rawValue) as? T
    }
    
    func delete(forKey key: PersistanceKeys) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key.rawValue)
    }
    
}
