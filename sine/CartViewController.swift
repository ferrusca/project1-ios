//
//  CartViewController.swift
//  sine
//
//  Created by 2020-1 on 10/9/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit
import ReSwift

class CartViewController: UIViewController, StoreSubscriber {
    
    var cart: CartState!
    var totalPrice = 0;
    
    let store = appStore
    
    func newState(state: AppState) {
        print("Estado del carro")
        self.cart = state.cart
        self.totalPrice = state.totalPrice.data
        print(self.cart!)
        print("Precio total a pagar:")
        print(self.totalPrice)
    }
    
    
    override func viewDidLoad() {
        store.subscribe(self)
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
