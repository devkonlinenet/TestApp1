//
//  TestApp1View.swift
//  TestApp1
//
//  Created by Michael Kemper on 22.09.22.
//

import SwiftUI
import MapKit

struct TestApp1View: View {
    @StateObject var testVM = TestApp1ViewModel()

    var body: some View {
        NavigationView {
            TabView {
                listView
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                MapView(testVM: testVM)
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
            }
            .navigationTitle("TEST")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var listView: some View {
        VStack {
            List(testVM.items.sorted(by: {$0.longitude < $1.longitude})) { item in
                HStack {
                    Text(item.name)
                    Text(item.latitude.formatted())
                    Text(item.longitude.formatted())
                }
            }
        }
    }
    

}

struct MapView:  View {
    @ObservedObject var testVM:TestApp1ViewModel
    
    var body: some View {
        Map(coordinateRegion: $testVM.region, interactionModes: .all, showsUserLocation: true, annotationItems: testVM.items)  { item in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)) {
                Image(systemName: "plus")
                    .foregroundColor(.red)
                    .font(.title)
            }
        }
        .ignoresSafeArea(edges: Edge.Set([.leading, .trailing]))
    }
}

struct TestApp1View_Previews: PreviewProvider {
    static var previews: some View {
        TestApp1View()
    }
}
