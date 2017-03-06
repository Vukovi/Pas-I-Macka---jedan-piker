//
//  ViewController.swift
//  pickerView1
//  VUK

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var ljubimci = [["Dzek", "Meda", " Macor", "Max"],["Simonida", "Persida"]]
    
   

    @IBOutlet weak var unosPas: UITextField!
    @IBOutlet weak var unosMacka: UITextField!
    @IBOutlet weak var piker: UIPickerView!
    var izabraniPas: String?
    var izabranaMacka: String?
    
    @IBAction func sacuvaj(_ sender: AnyObject) {
        
        if unosPas.text != "" && unosMacka.text == "" {
            ljubimci[0].append(unosPas.text!)
            unosPas.resignFirstResponder()
            piker.reloadComponent(0)
            unosPas.text = ""
        }
        else if unosPas.text == "" && unosMacka.text != "" {
            ljubimci[1].append(unosMacka.text!)
            unosMacka.resignFirstResponder()
            piker.reloadComponent(1)
            unosMacka.text = ""
        }
        else if unosPas.text != "" && unosMacka.text != "" {
            ljubimci[0].append(unosPas.text!)
            ljubimci[1].append(unosMacka.text!)
            unosPas.resignFirstResponder()
            unosMacka.resignFirstResponder()
            piker.reloadAllComponents()
            unosPas.text = ""
            unosMacka.text = ""
        } 

    }
    
    @IBAction func brisanje(_ sender: AnyObject) {
       
            if izabraniPas != nil {
                let pozicijaPsaUNizu = ljubimci[0].index(of: izabraniPas!)
                ljubimci[0].remove(at: pozicijaPsaUNizu!)
                izabraniPas = nil
                piker.reloadAllComponents()
            }
            if izabranaMacka != nil {
                let pozicijaMackeUNizu = ljubimci[1].index(of: izabranaMacka!)
                ljubimci[1].remove(at: pozicijaMackeUNizu!)
                izabranaMacka = nil
                piker.reloadAllComponents()
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return ljubimci.count //ovo vraca broj tockica u okviru jednog pikera
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return ljubimci[component].count //posto ima dva tockica u pikeru ovo vraca broj elemenata za svaki tockic pikera, tacnije daje onoliko redova po tockicu koliko ima elemenata po podnizovvima velikog niza ljubimci, tj matrice ljubimci
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return ljubimci[component][row] // vraca ono sto je aktivno (selektovano) po svakom tockicu pikera
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0{
            izabraniPas = ljubimci[0] [pickerView.selectedRow(inComponent: 0)]
            izabranaMacka = nil
        }
        if component == 1{
            izabranaMacka = ljubimci[1] [pickerView.selectedRow(inComponent: 1)]
            izabraniPas = nil
            
        }
        //piker.reloadAllComponents() proveri da li ima promene sa ovim
        print(izabraniPas)
        print(izabranaMacka)
 
        //selektovani redovi u matrici, tj selektovani redovi u nizu nizova
        
    }

    
    
    
    
}

