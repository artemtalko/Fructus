//
//  SettingView.swift
//  Fructus
//
//  Created by Artem Talko on 22.07.2023.
//

import SwiftUI

struct SettingView: View {
	@Environment(\.presentationMode) var presentationMode
	@AppStorage("isOnboarding") var isOnboarding: Bool = false
	
    var body: some View {
			NavigationView {
				ScrollView(.vertical, showsIndicators: false) {
					VStack(spacing: 20) {
						
						//MARK: - SECTION 1
						GroupBox(
							label:
								SettingLabelView(labelText: "Fructus", labelImage: "info.circle")
						)
						{
							Divider().padding(.vertical, 4)
							
							HStack(alignment: .center, spacing: 10) {
								Image("logo")
									.resizable()
									.scaledToFit()
									.frame(width: 80, height: 80)
									.cornerRadius(9)
								
								Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
									.font(.footnote)
							}
						}
						
						//MARK: - SECTION 2
						
										GroupBox(
											label: SettingLabelView(labelText: "Customization", labelImage: "paintbrush")
										) {
											Divider().padding(.vertical, 4)
											
											Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
												.padding(.vertical, 8)
												.frame(minHeight: 60)
												.layoutPriority(1)
												.font(.footnote)
												.multilineTextAlignment(.leading)
											
											Toggle(isOn: $isOnboarding) {
																	 if isOnboarding {
																		 Text("Restarted".uppercased())
																			 .fontWeight(.bold)
																			 .foregroundColor(Color.green)
																	 } else {
																		 Text("Restart".uppercased())
																			 .fontWeight(.bold)
																			 .foregroundColor(Color.secondary)
																	 }
																 }
																 .padding()
																 .background(
																	 Color(UIColor.tertiarySystemBackground)
																		 .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
																 )

										}
						
						//MARK: - SECTION 3
						GroupBox(
						label:
							SettingLabelView(labelText: "Application", labelImage: "apps.iphone")) {
								Divider().padding(.vertical, 4)
								SettingRowView(name: "Developer", content: "Artem Talko")
								SettingRowView(name: "Designer", content: "Ryan Gosling")
								SettingRowView(name: "Compatibility", content: "iOS 16+")
								SettingRowView(name: "Website", linkLabel: "to-and-fro.millions", linkDestination: "t.me/qer21")
								SettingRowView(name: "More info", linkLabel: "base.com", linkDestination: "www.youtube.com/watch?v=dQw4w9WgXcQ")
								SettingRowView(name: "SwiftUI", content: "2.0")
								SettingRowView(name: "Version", content: "1.0")
								
							}
						

						
					}//: VSTACK
					.navigationBarTitle(Text("Setting"), displayMode: .large)
					.navigationBarItems(
						trailing: Button(action: {
							presentationMode.wrappedValue.dismiss()
						}) {
							Image(systemName: "xmark")
						}
					)
					.padding()
				}//: SCROLL VIEW
			}//: NAVIGATION
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
