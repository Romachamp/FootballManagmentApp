//
//  WorldScreen.swift
//  GreenShop
//
//  Created by Роман on 30.07.2023.
//

import SwiftUI

struct WorldScreen: View {
    
    @StateObject private var leaguesViewModel = WorldViewModel()
    @State var isLoading = true
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2)
                .padding(.vertical, 20)
            } else {
                List(leaguesViewModel.leagues.result) { post in
                    if post.country_name.lowercased() != "russia" {
                        VStack(alignment: .leading) {
                            Text("\(post.league_name)")
                                .font(.title2)
                                .bold()
                            Text("Country: \(post.country_name)")
                                .padding(4)
                                .font(.title3)
                        }
                        .padding()
                    }
                }
            }
      
        }
        .onAppear {
            fetchWorldWithAnimation()
        }
    }
    
    private func fetchWorldWithAnimation() {
        
        isLoading = true
        
        leaguesViewModel.fetchLeagues {
            withAnimation {
                isLoading = false
            }
        }
    }
    
}

class WorldViewModel: ObservableObject {
    @Published var leagues: Result = Result(result: [])
    
    private let leaguesService = LeaguesService()

    func fetchLeagues(completion: @escaping () -> Void) {
        Task {
            do {
                leagues = try await leaguesService.getLeagues()
                completion()
            } catch {
                print("Error fetching leagues: \(error)")
            }
        }
    }
    
}

struct WorldScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorldScreen()
    }
}
