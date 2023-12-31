import Foundation

struct Todo: Identifiable, Decodable {
    var id: Int
    var todo: String
    var completed: Bool
    var userId: Int
}

