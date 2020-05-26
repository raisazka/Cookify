//
//  AddProcedureViewController.swift
//  FnBTrainingApp
//
//  Created by Theofani on 26/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class AddProcedureViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var fotoBahan: UIImageView!
    @IBOutlet weak var deskripsiTextField: UITextField!
    @IBOutlet weak var addProsedurButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ProsedurEditVC
        destVC.tambahDeskripsi = deskripsiTextField.text!
        destVC.tambahGambarProsedur = fotoBahan.image
    }

    @IBAction func importImageButton(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true){
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            fotoBahan.image = image
        }
        else{
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
