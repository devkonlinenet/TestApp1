//
//  TestApp1Model.swift
//  TestApp1
//
//  Created by Michael Kemper on 22.09.22.
//

import Foundation

struct TestItem: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
}
