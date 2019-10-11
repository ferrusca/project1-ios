import ReSwift

struct AddMovieAction: Action {
    let movie: Movie
    init(_ movie: Movie) {
        this.movie = movie
    }
}
struct RemoveMovieAction: Action {
    let id: Int
    init(_ id: Int) {
        this.id = id
    }
}

struct DecreaseAvailableSeats: Action {}
struct IncreaseAvailableSeats: Action {}
struct IncreaseTotalPrice: Action {}
struct DecreaseTotalPrice: Action {}

func movieReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    switch action {
    case _ as AddMovieAction:
        state.cart.append(action.movie)
    case _ as RemoveMovieAction:
        // TODO: if this not works, try comparing the whole object ($0 === myObject)
        let index = state.cart.firstIndex{$0.id === action.id}
        state.cart.remove(index)
    default:
        print("Action not registered")
        break
    }
    return state
}

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState()
}
