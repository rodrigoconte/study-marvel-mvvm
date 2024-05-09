//
//  HeroesListView.swift
//  MVVMAppTest
//
//  Created by Rodrigo Conte on 25/02/24.
//

import SwiftUI

struct cellbla: View {
    var body: some View {
        List {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                HStack{
                    Image(systemName: "square.and.arrow.down.on.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .foregroundColor(.blue)
                    Text("teste")
                        .foregroundStyle(.gray)
                        .font(.title)
                    Spacer()
                    Text("TEste")
                }
            }
        }
    }
}

struct HeroesListView: View {
    // MARK: - Properties
    @ObservedObject private var viewModel: HeroesListViewModel = HeroesListViewModel()
    
    // MARK: - Body
    var body: some View {
        cellbla()
        List {
            ForEach(viewModel.heroesArray, id: \.id) { hero in
                HStack(alignment: .center, spacing: 8, content: {
                    if let name = hero.name {
                        Text(name)
                    }
                })
            }
        }
        .task {
            await viewModel.getCharacters()
        }
    }
}

#Preview {
    HeroesListView()
}
