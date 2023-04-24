//
//  ViewController.swift
//  zgadywaniev2
//
//  Created by apios on 03/04/2023.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    //zapisanie wartosci z okienek
    var okienkowe = [Int](repeating: 0, count: 5)
    
    //utworzenie modelu logiki
    let model: Model = Model()
    
    //kolumna ktora bedzie modyfikowana
    var working_column = 0
    
    //wynik
    var wynik = [0,0,0,0,0]
    
    //obecne pole - wskazanie na pola w okienku
    weak var current_field: NSTextField?
    
    //labelka tekstowa
    @IBOutlet weak var labelka: NSTextField!
    
    //pola tekstowe
    @IBOutlet weak var pole1: NSTextField!
    @IBOutlet weak var pole2: NSTextField!
    @IBOutlet weak var polee3: NSTextField!
    @IBOutlet weak var pole4: NSTextField!
    @IBOutlet weak var pole5: NSTextField!
    
    @IBOutlet weak var guzik1: NSButtonCell!
    
    
    //wybor kolumny - ustawienie gdzie wpisujemy
    @IBAction func kol1(_ sender: NSButton) {
        working_column = 0
        current_field = pole1
    }
    @IBAction func kol2(_ sender: NSButton) {
        working_column = 1
        current_field = pole2
    }
    @IBAction func kol3(_ sender: NSButton) {
        working_column = 2
        current_field = polee3
    }
    @IBAction func kol4(_ sender: NSButton) {
        working_column = 3
        current_field = pole4
    }
    @IBAction func kol5(_ sender: NSButton) {
        working_column = 4
        current_field = pole5
    }
    
    //wpisanie liczby
    @IBAction func klik1(_ sender: NSButton) {
        okienkowe[working_column] = 1
        current_field?.placeholderString = "1"
    }
    @IBAction func klik2(_ sender: NSButton) {
        okienkowe[working_column] = 2
        current_field?.placeholderString = "2"
        
    }
    @IBAction func klik3(_ sender: NSButton) {
        okienkowe[working_column] = 3
        current_field?.placeholderString = "3"
        
    }
    @IBAction func klik4(_ sender: NSButton) {
        okienkowe[working_column] = 4
        current_field?.placeholderString = "4"
        
    }
    @IBAction func klik5(_ sender: NSButton) {
        okienkowe[working_column] = 5
        current_field?.placeholderString = "5"
        
    }
    @IBAction func klik6(_ sender: NSButton) {
        okienkowe[working_column] = 6
        current_field?.placeholderString = "6"
        
    }
    @IBAction func klik7(_ sender: NSButton) {
        okienkowe[working_column] = 7
        current_field?.placeholderString = "7"
        
    }
    @IBAction func klik8(_ sender: NSButton) {
        okienkowe[working_column] = 8
        current_field?.placeholderString = "8"
        
    }
    @IBAction func klik9(_ sender: NSButton) {
        okienkowe[working_column] = 9
        current_field?.placeholderString = "9"
        
    }
    @IBAction func klik0(_ sender: NSButtonCell) {
        okienkowe[working_column] = 0
        current_field?.placeholderString = "0"
    }
    

    //przeslanie wartosci z okienek do sprawdzenia wyniku -> otrzymanie informacji jakie okienka jak podswietlic i poswietlenie ich
    @IBAction func check_click(_ sender: NSButtonCell) {
        wynik = model.porownanie(okienkowe)
    for i in stride(from: 0, to: wynik.count, by: 1){
        if i == 0 {
            current_field = pole1
        }
        else if i == 1 {
            current_field = pole2
        }
        else if i == 2 {
            current_field = polee3
        }
        else if i == 3 {
            current_field = pole4
        }
        else if i == 4 {
            current_field = pole5
        }
        
        if wynik[i] == 1 {
            current_field?.backgroundColor = NSColor.green
        }
        else if wynik[i] == -1 {
            current_field?.backgroundColor = NSColor.orange
        }
        else if wynik[i] == 0 {
            current_field?.backgroundColor = NSColor.white
        }
        
    }
}
}


