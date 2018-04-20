//
//  ViewControllerAzul.swift
//  Proyecto_Final
//
//  Created by Daniela Diaz on 4/17/18.
//  Copyright © 2018 Daniela Diaz. All rights reserved.
//

import UIKit

class ViewControllerAzul: UIViewController {

    @IBOutlet weak var seleccion1: UIImageView!
    @IBOutlet weak var seleccion2: UIImageView!
    @IBOutlet weak var seleccion3: UIImageView!
    @IBOutlet weak var seleccion4: UIImageView!
    @IBOutlet weak var seleccion5: UIImageView!
    @IBOutlet weak var seleccion6: UIImageView!
    @IBOutlet weak var seleccion7: UIImageView!

    @IBOutlet weak var opcion1: UIImageView!
    @IBOutlet weak var opcion2: UIImageView!
    @IBOutlet weak var opcion3: UIImageView!
    @IBOutlet weak var opcion4: UIImageView!
    @IBOutlet weak var opcion5: UIImageView!
    @IBOutlet weak var opcion6: UIImageView!
    @IBOutlet weak var opcion7: UIImageView!
    @IBOutlet weak var opcion8: UIImageView!
    @IBOutlet weak var opcion9: UIImageView!
    @IBOutlet weak var opcion10: UIImageView!
    @IBOutlet weak var opcion11: UIImageView!
    @IBOutlet weak var opcion12: UIImageView!
    @IBOutlet weak var opcion13: UIImageView!
    @IBOutlet weak var opcion14: UIImageView!
    @IBOutlet weak var opcion15: UIImageView!
    
    
    var abecedario = [#imageLiteral(resourceName: "juego_a"), #imageLiteral(resourceName: "juego_b"), #imageLiteral(resourceName: "juego_c"), #imageLiteral(resourceName: "juego_d"), #imageLiteral(resourceName: "juego_e"), #imageLiteral(resourceName: "juego_f"), #imageLiteral(resourceName: "juego_g"), #imageLiteral(resourceName: "juego_h"), #imageLiteral(resourceName: "juego_i"), #imageLiteral(resourceName: "juego_j"), #imageLiteral(resourceName: "juego_k"), #imageLiteral(resourceName: "juego_l"), #imageLiteral(resourceName: "juego_m"), #imageLiteral(resourceName: "juego_n"), #imageLiteral(resourceName: "juego_ñ-1"), #imageLiteral(resourceName: "juego_o"), #imageLiteral(resourceName: "juego_p"), #imageLiteral(resourceName: "juego_q"), #imageLiteral(resourceName: "juego_r"), #imageLiteral(resourceName: "juego_s"), #imageLiteral(resourceName: "juego_t"), #imageLiteral(resourceName: "juego_u"), #imageLiteral(resourceName: "juego_v"), #imageLiteral(resourceName: "juego_w"), #imageLiteral(resourceName: "juego_x"), #imageLiteral(resourceName: "juego_y"), #imageLiteral(resourceName: "juego_z")]
    var posiciones = Array(repeating: -1, count: "palabra".count)
    var letras = Array(repeating: #imageLiteral(resourceName: "juego_a"), count: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var posicion_random : UInt32!
        var existe : Bool!
        var guardado : Bool!
        for i in 0..<("palabra".count){
            guardado = false
            while !guardado{
                posicion_random = arc4random_uniform(20)
                print(posicion_random)
                existe = false
                for j in 0..<(posiciones.count){
                    if posicion_random == posiciones[j] {
                        existe = true
                        break
                    }
                }
                if !existe{
                    posiciones[i] = Int(posicion_random)
                    guardado = true
                    print("posicion: ", posiciones[i])
                }
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
