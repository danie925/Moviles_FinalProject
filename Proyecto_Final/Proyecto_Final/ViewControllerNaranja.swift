//
//  ViewController.swift
//  LSM_Test2
//
//  Created by German Villacorta on 3/13/18.
//  Copyright © 2018 German Villacorta. All rights reserved.
//

import UIKit
import AVKit
import Vision
import CoreML

func convert(cmage:CIImage) -> UIImage
{
    let context:CIContext = CIContext.init(options: nil)
    let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
    let image:UIImage = UIImage.init(cgImage: cgImage)
    return image
}

extension UIImage {
    var noir: UIImage? {
        let context = CIContext(options: nil)
        guard let currentFilter = CIFilter(name: "CIPhotoEffectNoir") else { return nil }
        currentFilter.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        if let output = currentFilter.outputImage,
            let cgImage = context.createCGImage(output, from: output.extent) {
            return UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
        }
        return nil
    }
}

class ViewControllerNaranja: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var currentScore = 0
    var highScore = 0
    var currentLetter = ""
    var wantedLetter = "C"
    var probability: Float = 0.0
    var gameHasStarted = false
    var captureSession: AVCaptureSession?
    var letters = [String]()
    var timer: Timer?
    var lifes = 2
    @IBOutlet weak var currentLetterLabel: UITextView!
    @IBOutlet weak var tapToPlayLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var scoresLabel: UITextView!
    @IBOutlet weak var highScoreLabel: UITextView!
    @IBOutlet weak var predictedLetterLabel: UITextView!
    @IBOutlet weak var infoLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Inicializa tu arreglo de letras.
        letters = ["A", "E", "I", "O", "U"]
        // Do any additional setup after loading the view, typically from a nib.
        //Poner la camara tipo Snapchat
        captureSession = AVCaptureSession()
        
        //Para que se vean las labels
        currentLetterLabel.layer.zPosition = 1
        currentLetterLabel.backgroundColor = UIColor.clear
        currentLetterLabel.text = "C"
        currentLetterLabel.isHidden = true
        
        predictedLetterLabel.layer.zPosition = 1
        predictedLetterLabel.text = "a"
        predictedLetterLabel.isHidden = true
        
        
        scoresLabel.layer.zPosition = 1
        highScoreLabel.layer.zPosition = 1
        infoLabel.layer.zPosition = 1
        returnButton.layer.zPosition = 1
        tapToPlayLabel.layer.zPosition = 1
        
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice)
            else {return}
        
        captureSession?.addInput(input)
        captureSession?.startRunning()
        
        
        //En este punto ya tienes la camara pero no le haz dicho a la app que te la enseñe
        //Es importate poner el frame igual que el cameraView para que no aparezca en toda la pantalla
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        self.view.layer.addSublayer(previewLayer)
        previewLayer.frame = self.view.frame
        
        
        //Ahora hay que hacer que la camara tome cada "imagen" de lo que esta viendo
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "hola"))
        captureSession?.addOutput(dataOutput)
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.captureSession?.stopRunning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gameHasStarted = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else
        {return}
        
        guard let model = try? VNCoreMLModel(for: ModelBW().model)else{return}
        
        let request = VNCoreMLRequest(model: model){(prediction, error) in
            
            guard let result = prediction.results as? [VNClassificationObservation] else {return}
            
            guard let firstObservation = result.first else {return}
            
            DispatchQueue.main.async {
                if(firstObservation.identifier != "Nothing"){
                    self.currentLetter = firstObservation.identifier
                    self.predictedLetterLabel!.text = String(firstObservation.identifier) + ": " + String((1000 * Float(firstObservation.confidence)).rounded() / 1000)
                    
                    self.probability = (1000 * Float(firstObservation.confidence)).rounded() / 1000
                    
                }else {
                    self.predictedLetterLabel!.text = String(firstObservation.identifier)
                }
            }
            
            
        }
        
        request.imageCropAndScaleOption = VNImageCropAndScaleOption.centerCrop
    
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        
    }
    
     // MARK: - Start y Stop
    @IBAction func startPlaying(_ sender: Any) {
        lifes = 2
        currentLetterLabel.isHidden = false
        predictedLetterLabel.isHidden = false

        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(self.isSameLetter), userInfo: nil, repeats: true)
    }
    
    func stopPlaying(){
        currentLetterLabel.isHidden = true
        predictedLetterLabel.isHidden = true

        self.timer?.invalidate()
        timer = Timer()
    }
    
    
// MARK: - Check letter
    @objc func isSameLetter(){
        if (currentLetter == wantedLetter && probability > 0.6){
            currentScore = currentScore + 1
        }else{
            lifes = lifes - 1
        }
        
        if (lifes <= 0){
            stopPlaying()
        }
        
        let randomIndex = Int(arc4random_uniform(UInt32(letters.count)))
        wantedLetter = letters[randomIndex]
        currentLetterLabel.text = wantedLetter
        scoresLabel.text = String(currentScore)
    }
    
}



