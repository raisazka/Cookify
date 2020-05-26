//
//  EditLatihanLauncher.swift
//  FnBTrainingApp
//
//  Created by Rais on 26/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

//Protcol Untuk Mainin Delegatenya
protocol EditLatihanDelegate {
    func editLatihan()
}

//Class untuk View Warna Putih
class EditLatihanLauncher: NSObject, UITextFieldDelegate {

    let blackView = UIView()
    
    let containerView = UIView()
    
    
    let persiapanLabel = UILabel()
    let keteranganLabel = UILabel()
    let persiapanField = UITextField()
    let keteranganField = UITextField()
    let buttonEdit = UIButton()
    
    var editDelegate: EditLatihanDelegate?
    
    override init() {
        super.init()
        persiapanField.delegate = self
        keteranganField.delegate = self
        //Biar keyboardnya kebawah
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    //Tampilin Modal
    public func handelModal(persiapan: Persiapan) {
       if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
           blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
           blackView.frame = window.frame
           blackView.alpha = 0
           blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
           let height:CGFloat = 400
           let y  = window.frame.height-height
           containerView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: height)
           containerView.backgroundColor = UIColor.white
        
           window.addSubview(blackView)
           window.addSubview(containerView)
           showForm(persiapan: persiapan)
           UIView.animate(withDuration: 0.5, animations: {
               self.blackView.alpha = 1
               self.containerView.frame = CGRect(x: 0, y: y,
               width: self.containerView.frame.width,
               height:self.containerView.frame.height)
           })
       }
   }
    
    private func showForm(persiapan: Persiapan) {
        persiapanLabel.text = "Persiapan"
        persiapanLabel.frame = CGRect(x: 30, y: 40, width: 100, height: 20)
        
        persiapanField.frame = CGRect(x: 30, y: 70, width: 350, height: 43)
        persiapanField.borderStyle = .line
        persiapanField.layer.borderColor = UIColor(white: 0.5, alpha: 0.2).cgColor
        persiapanField.layer.borderWidth = 0.5
        persiapanField.placeholder = persiapan.bahan
        
        keteranganLabel.text = "Keterangan"
        keteranganLabel.frame = CGRect(x: 30, y: 130, width: 100, height: 20)

        keteranganField.frame = CGRect(x: 30, y: 160, width: 350, height: 43)
        keteranganField.borderStyle = .line
        keteranganField.layer.borderColor = UIColor(white: 0.5, alpha: 0.2).cgColor
        keteranganField.layer.borderWidth = 0.5
        keteranganField.placeholder = persiapan.jumlah
        
        buttonEdit.frame = CGRect(x: 30, y: 240, width: 350, height: 43)
        buttonEdit.setTitle("Ubah", for: .normal)
        buttonEdit.backgroundColor = UIColor(red: 80.0 / 255, green: 200.0 / 255, blue: 120.0 / 255, alpha: 1.0)
        buttonEdit.addTarget(self, action: #selector(handleButtonEvent), for: .touchUpInside)
        buttonEdit.layer.cornerRadius = 15
        
        containerView.addSubview(persiapanLabel)
        containerView.addSubview(persiapanField)
        containerView.addSubview(keteranganLabel)
        containerView.addSubview(keteranganField)
        containerView.addSubview(buttonEdit)
    }
    
    //Text Field delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        persiapanField.resignFirstResponder()
        keteranganField.resignFirstResponder()
        return true
    }
    
    //Button Event
    @objc func handleButtonEvent() {
      editDelegate?.editLatihan()
    }
    
    //Turunin Viewnya ketika keyboard muncul
    @objc func keyboardWillChange(notification: Notification) {
        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            window.frame.origin.y = -300
        }
    }
    
    //Balikin View ketika keyboard ilang
    @objc func keyboardWillHide(notification: Notification) {
        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            window.frame.origin.y = 0
        }
    }
       
    //Tap Item2nya
   @objc func handleDismiss() {
       UIView.animate(withDuration: 0.5, animations: {
           self.blackView.alpha = 0
        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            self.containerView.frame = CGRect(x: 0, y: window.frame.height,
                width: self.containerView.frame.width,
                height: self.containerView.frame.height)
          }
       })
   }
    
    
}
