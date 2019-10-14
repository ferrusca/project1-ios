import ReSwift

struct AddMovieAction: Action {
    static let type = "AddMovieAction"
    let movie: Funcion
    init(_ movie: Funcion) {
        self.movie = movie
    }
}
struct RemoveMovieAction: Action {
    //static let type = "RemoveMovieAction"
    let id: Int
    init(_ id: Int) {
        self.id = id
    }
}

struct DecreaseAvailableSeats: Action {
    let numberOf: Int
    let id: Int
    init(id: Int, numberOf: Int) {
        self.numberOf = numberOf
        self.id = id
    }
}
struct IncreaseAvailableSeats: Action {
    let numberOf: Int
    let id: Int
    init(id: Int, numberOf: Int) {
        self.id = id
        self.numberOf = numberOf
    }
}

struct IncreaseTotalPrice: Action {
    let amount: Int
    init(_ amount: Int) {
        self.amount = amount
    }
}
struct DecreaseTotalPrice: Action {
    let amount: Int
    init(_ amount: Int) {
        self.amount = amount
    }
}

func cartReducer(_ action: Action, _ state: CartState?) -> CartState {
    var state = state ?? CartState()
    switch action {
    case let action as AddMovieAction:
        state.data.append(action.movie)
    case let action as RemoveMovieAction:
        let index = getIndexOf(state.data, id: action.id)
        // This could stop the execution :(
        state.data.remove(at: index)
    default:
        print("Action not registered")
        break
    }
    return state
}

func totalPriceReducer(_ action: Action, _ state: TotalPriceState?) -> TotalPriceState {
    var state = state ?? TotalPriceState()
    switch action {
    case let action as IncreaseTotalPrice:
        state.data += action.amount;
    case let action as DecreaseTotalPrice:
        state.data -= action.amount;
    default:
        print("Action not registered")
        break
    }
    return state
}

func moviesReducer(_ action: Action, _ state: MoviesState?) -> MoviesState {
    var state = state ?? MoviesState()
    switch action {
    case let action as IncreaseAvailableSeats:
        let index = getIndexOf(state.data, id: action.id)
        state.data[index].cupo_disponible += action.numberOf
    case let action as DecreaseAvailableSeats:
        let index = getIndexOf(state.data, id: action.id)
        state.data[index].cupo_disponible -= action.numberOf
    default:
        print("Action not registered")
        break
    }
    return state
}

// TODO: if this not works, try comparing the whole object ($0 === myObject)
func getIndexOf(_ array: Array<Funcion>, id: Int) -> Int {
    return array.firstIndex{$0.id == id}!;
}

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        totalPrice: totalPriceReducer(action, state?.totalPrice),
        cart: cartReducer(action, state?.cart),
        movies: moviesReducer(action, state?.movies)
    )
}
