import SwiftUI

struct TrainingScreen: View {
    @StateObject private var exercisesViewModel = ExercisesViewModel()
    @State private var isLoading = true
    @State var query = ""
    
    func changeData() {
        fetchExercisesWithAnimation()
    }

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2)
                    .padding(.vertical, 20)
            } else {
                
                HStack {
                    TextField("Search", text: $query)
                        .roundedTextFieldStyle()
            
                    Button(action: {
                        changeData()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .padding()
                            .background(
                                Rectangle()
                                .fill(Color.white)
                                .cornerRadius(12)
                                .shadow(
                                    color: Color.gray.opacity(0.7),
                                    radius: 5,
                                    x: 0,
                                    y: 0
                                )
                            )
                            .padding()
                    })
                    
                }
                
                List(exercisesViewModel.posts) { post in
                    VStack(alignment: .leading) {
                        Text("\(post.name)")
                            .font(.title2)
                            .bold()
                        Text("Type: \(post.muscle)")
                            .padding(4)
                            .font(.headline)
                        Text("Level: \(post.difficulty)")
                            .padding(4)
                            .font(.headline)
                        Text(post.instructions)
                            .font(.body)
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            fetchExercisesWithAnimation()
        }
    }

    private func fetchExercisesWithAnimation() {
        
        isLoading = true
        
        exercisesViewModel.fetchExercises(query) {
            withAnimation(.easeIn(duration: 0.5)) {
                isLoading = false
            }
        }
    }
    
}

class ExercisesViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private let exersiesService = ExersiesService()

    func fetchExercises(_ muscle: String, completion: @escaping () -> Void) {
        Task {
            do {
                posts = try await exersiesService.getExersises(muscle)
                completion()
            } catch {
                print("Error fetching exercises: \(error)")
            }
        }
    }
}

struct TrainingScreen_Previews: PreviewProvider {
    static var previews: some View {
        TrainingScreen()
    }
}
