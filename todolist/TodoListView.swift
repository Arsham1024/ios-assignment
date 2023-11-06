import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel = TodoViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.todos) { todo in
                HStack {
                    // symbol
                    
                    Image(systemName: todo.completed ? "checkmark.circle" : "circle")
                        .foregroundColor(todo.completed ? .green : .red)
                    
                    Spacer()
                    Text(todo.todo)
                }
            }
            .navigationTitle("Todos")
            .onAppear {
                viewModel.fetchTodos()
            }
        }
    }
}

