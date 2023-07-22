//
//  ContentView.swift
//  Fructus
//
//  Created by Artem Talko on 20.07.2023.
//

import SwiftUI

struct ContentView: View {
	//MARK: - PROPERTIES
	@State private var isShowingSetting: Bool = false
	var fruits: [Fruit] = fruitData
	
	//MARK: - BODY
    var body: some View {
        VStack {
					NavigationView {
						List {
							ForEach(fruits.shuffled()) { item in
								NavigationLink(destination: FruitDetailView(fruit: item)) {
									FruitRowView(fruit: item)
										.padding(.vertical, 4)
								}
							}
						}//: LIST
						.navigationTitle("Fruits")
						.navigationBarItems(
							trailing: Button(action: {
								isShowingSetting = true
							}) {
								Image(systemName: "slider.horizontal.3")
							})//: BUTTON
						.sheet(isPresented: $isShowingSetting) {
							SettingView()
						}
					}//: NAVIGATION VIEW
        }
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitData)
    }
}
