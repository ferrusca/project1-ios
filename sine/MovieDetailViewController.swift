//
//  MovieDetailViewController.swift
//  sine
//
//  Created by 2020-1 on 10/14/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit
import ReSwift

class MovieDetailViewController: UIViewController, StoreSubscriber {

    var funcion: Funcion!
    var id: Int!
    var store = appStore
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var sinopsis: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var availableSeats: UILabel!
    @IBOutlet weak var selectedSeats: UILabel!
    
    var selectedSeatsInt = 0;
    
    func newState(state: AppState) {
        let index = getIndexOf(state.movies.data, id: funcion.id)
        self.funcion = state.movies.data[index]
        self.updateSeatLabels()
    }
    
    @IBAction func closeModal(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
  
    override func viewDidLoad() {
        store.subscribe(self)
        super.viewDidLoad()
        self.name.text = funcion.pelicula.titulo
        self.hour.text = funcion.hora_inicio
        self.sinopsis.text = funcion.pelicula.sinopsis
        self.price.text = self.price.text! + String(funcion.precio)
        updateSeatLabels()
    }
    
    func updateSeatLabels() {
        print(self.funcion.cupo_disponible)
        self.availableSeats.text = String(self.funcion.cupo_disponible)
        self.selectedSeats.text = String(self.selectedSeatsInt)
    }
    
    @IBAction func addSeat(_ sender: UIButton) {
        self.selectedSeatsInt += 1
        store.dispatch(DecreaseAvailableSeats(id: funcion.id, numberOf: 1))
    }
    
    @IBAction func removeSeat(_ sender: UIButton) {
        self.selectedSeatsInt -= 1
        store.dispatch(IncreaseAvailableSeats(id: funcion.id, numberOf: 1))
    }
    
    func getIndexOf(_ array: Array<Funcion>, id: Int) -> Int {
        return array.firstIndex{$0.id == id}!;
    }
    
    @IBAction func butTickets(_ sender: UIButton) {
        store.dispatch(AddMovieAction(self.funcion))
        store.dispatch(
            IncreaseTotalPrice(self.selectedSeatsInt * self.funcion.precio)
        )
        dismiss(animated: true, completion: nil)
    }
}
