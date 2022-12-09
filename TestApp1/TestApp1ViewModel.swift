//
//  TestApp1ViewModel.swift
//  TestApp1
//
//  Created by Michael Kemper on 22.09.22.
//

import Foundation
import SwiftUI
import MapKit

class TestApp1ViewModel: ObservableObject {
    @Published var items = [TestItem]()
    @Published var region:MKCoordinateRegion

    private var timer: Timer?
    private var counter = 0
 
    init() {
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 8), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 6))
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                self.addItem()
        }
    }
    
    func addItem() {
        counter += 1
        let name = "Item " + counter.formatted()
        let latitude = Double.random(in: 45...55)
        let longitude = Double.random(in: 5...11)
        DispatchQueue.main.async {
            withAnimation {
                self.items.append(TestItem(name: name, latitude: latitude, longitude: longitude))
            }
        }
    }
}
