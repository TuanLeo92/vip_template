//
//  Firebase_Store.swift
//  VIPTemplate
//
//  Created by Le Tuan on 18/3/20.
//  Copyright © 2020 Tuan Le. All rights reserved.
//

import Foundation
import RxSwift
import FirebaseFirestore

extension FirebaseService {
    
    private func generateSurveillanceReferences(on date: String) -> CollectionReference {
        let surveillancePath = [Define.databaseRoot, Define.surveillance, date].joined(separator: "/")
        let surveillanceRefs = firestore.collection(surveillancePath)
        return surveillanceRefs
    }
    
    func fetchListRegions(on date: String) -> Observable<[Region]> {
        return Observable.create { [unowned self] observer -> Disposable in
            let surveillanceReferences = self.generateSurveillanceReferences(on: date)
            surveillanceReferences.getDocuments { querySnapshot, error in
                if let error = error {
                    observer.onError(error)
                }
                if let querySnapshot = querySnapshot {
                    let documents = querySnapshot.documents
                    let regions = documents.map { document -> Region in
                        return Region(document: document)
                    }
                    observer.onNext(regions)
                    observer.onCompleted()
                } else {
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
