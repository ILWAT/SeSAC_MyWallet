//
//  ContentView.swift
//  MyWallet_SwiftUI
//
//  Created by 문정호 on 11/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var myMoney = Banner()
    @State private var dummyData = dummy
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    bannerView(subtitle: myMoney.totalFormat)
                    ForEach(dummyData){ item in
                        listView(title: item.product, subTitle: item.category.rawValue, trailingText: item.amountFormat)
                    } //MARK: trailing_Foreach
                } //MARK: trailing_VStack
                .padding()
            } //MARK: trailing_ScrollView
            .navigationTitle("My Wallet")
            .refreshable {
                myMoney = Banner()
                dummyData.shuffle()
            }
        } //MARK: trailing_NavigationStack
    }
    
    func bannerView(subtitle: String) -> some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.random())
                .frame(height: 200)
            VStack(alignment: .leading) {
                Spacer()
                Text("내 소비내역")
                Text(subtitle)
            } //MARK: end_VStack
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        } //MARK: end_ZStack
    }
    
    func listView(title: String, subTitle: String, trailingText: String) -> some View{
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.title3)
                Text(subTitle)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(trailingText)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        
        
    }
}

#Preview {
    ContentView()
}
