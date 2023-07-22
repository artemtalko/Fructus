//
//  SettingRowView.swift
//  Fructus
//
//  Created by Artem Talko on 22.07.2023.
//

import SwiftUI

struct SettingRowView: View {
	var name: String
	var content: String? = nil
	var linkLabel: String? = nil
	var linkDestination: String? = nil
	
    var body: some View {
			VStack {
				
				
				HStack {
					Text(name)
						.foregroundColor(.gray)
					Spacer()
					if content != nil {
							Text(content!)
					} else if(linkLabel != nil && linkDestination != nil) {
						Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
						Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
					}
				}
				Divider().padding(.horizontal)
			}
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
			SettingRowView(name: "Developer", content: "Artem")
				.padding()
    }
}
