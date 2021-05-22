//
//  PersistenceManager.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 19/05/21.
//

import UIKit
import RealmSwift

class PersistenceManager: NSObject {

    public class func configPersistence(){
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        config.fileURL = config.fileURL!
            .deletingLastPathComponent()
            .appendingPathComponent(".default.realm")
        
        Realm.Configuration.defaultConfiguration = config
    }
    
    public class func clear(){
        do{
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        }catch{ }
    }
    
}
