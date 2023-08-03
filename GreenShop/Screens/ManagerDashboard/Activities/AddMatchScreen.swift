//
//  AddMatchScreen.swift
//  GreenShop
//
//  Created by Роман on 30.07.2023.
//

import SwiftUI

struct AddMatchScreen: View {
    
    @State var firstGoals: String = ""
    @State var secondGoals: String = ""
    @State var error: String = ""
    
    var DEFAULTS = UserDefaults.standard
    
    func getCurrentDateAsString() -> String {
        // Create a DateFormatter instance
        let dateFormatter = DateFormatter()
        
        // Set the desired date format
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        // Get the current date
        let currentDate = Date()
        
        // Convert the current date to a formatted string
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
    func addMatch(_ int1: Int, _ int2: Int) {
        let date = getCurrentDateAsString()
        
        if let savedData = DEFAULTS.object(forKey: "MATCHES") as? Data {

            do {
                var savedMatches = try JSONDecoder().decode([Match].self, from: savedData)
                
                savedMatches.insert(Match(date: date, firstGoals: int1, secondGoals: int2), at: 0)
                
                let encodedData = try JSONEncoder().encode(savedMatches)
                
                DEFAULTS.setValue(encodedData, forKey: "MATCHES")
                
                print("Success: MatchesScreen, line 47")
            } catch {
                print("Error: MatchesScreen, line 56")
            }
            
        } else {
            let matches: [Match] = [
                Match(date: date, firstGoals: int1, secondGoals: int2)
            ]
            
            do {
                let encodedData = try JSONEncoder().encode(matches)
                DEFAULTS.set(encodedData, forKey: "MATCHES")
                print("Success: AddMatchScreen, line 60")
            } catch {
                print("Error: MatchesScreen, line 61")
            }
            
        }
        
    }
    
    func submitData() {
        error = ""
        
        switch true {
        case firstGoals.isEmpty:
            error = "First goals are empty"
        case secondGoals.isEmpty:
            error = "Second goals are empty"
        default:
            if let int1 = Int(firstGoals) {
                if let int2 = Int(secondGoals) {
                    addMatch(int1, int2)
                } else {
                    error = "Second goals are not numbers"
                }
            } else {
                error = "First goals are not numbers"
            }
        }
        
    }
    
    var body: some View {
        VStack {
            Text("Fill up the form")
            
            TextField("First goals", text: $firstGoals)
                .roundedTextFieldStyle()
            TextField("Second goals", text: $secondGoals)
                .roundedTextFieldStyle()
            
            Button(action: {
                submitData()
            }, label: {
                BasicButtonView(TEXT: "Add match")
            })
            
            Text("\(error)")
            
        }
    }
    
}

struct AddMatchScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMatchScreen()
    }
}
