//
//  ViewController.swift
//  ImcCalculator
//
//  Created by Larissa de Souza Lanes Goncalves on 08/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fieldWeight: UITextField!
    
    @IBOutlet weak var fieldHeight: UITextField!
    
    @IBOutlet weak var resultedCalculate: UILabel!
    
    @IBOutlet weak var resultedImage: UIImageView!
    
    @IBOutlet weak var viewResulted: UIView!
    
    var IMC : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultedCalculate.text = "0"        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculateAction(_ sender: Any) {
        if let height = Double(fieldHeight.text!), let weight = Double(fieldWeight.text!){
        IMC = weight / pow(height, 2)
        resultImc()
        }
    }
    
    func resultImc(){
        var result : String = ""
        var image : String = ""
        
        switch IMC{
            case 0..<16:
                result = "Magreza Extrema"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do Peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobre Peso"
                image = "sobre"
            default :
                result = "Obesidade"
                image = "obesidade"
            }
        resultedCalculate.text = "\(Int(IMC)) : \(result)"
        resultedImage.image = UIImage(named: image)
        viewResulted.isHidden = false
        view.endEditing(true)
        }
     
}
