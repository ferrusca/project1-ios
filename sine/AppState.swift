//
//  AppState.swift
//  sine
//
//  Created by 2020-1 on 10/11/19.
//  Copyright © 2019 ios. All rights reserved.
//

import ReSwift

struct Pelicula {
    var poster: String
    var titulo: String
    var clasificacion: String
    var duracion: Int
    var sinopsis: String
    var genero: String
    var valoracion: Double
}

struct Sala{
    var tipo: String
    // horarios_reservados
    var cupo_max: Int
}

struct Funcion{
    var id: Int
    var sala: Sala
    var hora_inicio: String
    var hora_fin: String
    var pelicula: Pelicula
    var cupo_disponible: Int
    var precio: Int
}

struct Cartelera{
    var funciones : [Funcion]
}

var sala = Sala(tipo: "VIP", cupo_max: 50)
var pelicula = Pelicula(poster: "god", titulo: "IT", clasificacion: "B15", duracion: 120, sinopsis: "El payaso que espanta", genero: "terror", valoracion: 4.0)
var pelicula1 = Pelicula(poster: "cherry", titulo: "Foo", clasificacion: "B15", duracion: 120, sinopsis: "El payaso que espanta", genero: "terror", valoracion: 4.0)
var pelicula2 = Pelicula(poster: "joker", titulo: "Bar", clasificacion: "B15", duracion: 120, sinopsis: "El payaso que espanta", genero: "terror", valoracion: 4.0)
var pelicula3 = Pelicula(poster: "cherry", titulo: "Baz", clasificacion: "B15", duracion: 120, sinopsis: "El payaso que espanta", genero: "terror", valoracion: 4.0)

var funcion = Funcion(id: 1, sala: sala, hora_inicio:"14:00", hora_fin: "16:00", pelicula: pelicula, cupo_disponible: 40, precio: 70)
var funcion1 = Funcion(id: 2, sala: sala, hora_inicio:"16:00", hora_fin: "18:00", pelicula: pelicula1, cupo_disponible: 40, precio: 70)
var funcion2 = Funcion(id: 3, sala: sala, hora_inicio:"18:00", hora_fin: "20:00", pelicula: pelicula2, cupo_disponible: 40, precio: 70)
var funcion3 = Funcion(id: 4, sala: sala, hora_inicio:"21:00", hora_fin: "23:00", pelicula: pelicula3, cupo_disponible: 40, precio: 70)

var cartelera = Cartelera(funciones: [funcion])

struct TotalPriceState {
    var data: Int = 0;
}



struct CartState {
    var data: [Funcion] = [];
}

struct MoviesState {
    var data: [Funcion] = [funcion, funcion1, funcion2, funcion3]
}

struct AppState: StateType {
    var totalPrice: TotalPriceState;
    var cart: CartState;
    var movies: MoviesState;
}

let appStore = Store<AppState>(reducer: appReducer, state: nil)
