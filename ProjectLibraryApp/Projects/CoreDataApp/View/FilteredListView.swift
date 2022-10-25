//
//  FilteredListView.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 24/10/2022.
//

import CoreData
import SwiftUI

struct FilteredListView<T: NSManagedObject, Content: View>: View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: filterKey == "" ? nil : (NSPredicate(format: "%K CONTAINS[c] %@", filterValue, filterKey)))
        self.content = content
    }
}
