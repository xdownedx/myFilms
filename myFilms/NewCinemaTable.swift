//
//  NewCinemaTable.swift
//  myFilms
//
//  Created by Максим Лисицкий on 06.04.2020.
//  Copyright © 2020 Максим Лисицкий. All rights reserved.
//

import UIKit

class NewCinemaTable: UITableViewController {
    
    
    
    var currentCinema:filmModel?
    
    var imageIsChanged=false
    
    @IBOutlet weak var imageOfPicking: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var ganreTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var cancelOutlet: UIBarButtonItem!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.tableFooterView = UIView()
        imageIsChanged = false
        saveButton.isEnabled = false
        setupEditScreen()

        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    
    
    //MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            
            
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.choseImagePicker(source: .photoLibrary)
            }
            
            actionSheet.addAction(photo)
            
            present(actionSheet, animated: true )
        }else{
            view.endEditing(true)
        }
    }
    func saveNewFilm() {
        
        var newImage: UIImage?
        
        if imageIsChanged {
            newImage = imageOfPicking.image
        } else {
            newImage = #imageLiteral(resourceName: "addPhoto")
        }
        
        let imageData=newImage?.pngData()
         
        let newCinema = filmModel(name: nameTextField.text!, year: yearTextField.text!, country: countryTextField.text, ganre: ganreTextField.text, imageData: imageData)
        storageManager.saveObject(newCinema)
        
    }
    
    private func setupEditScreen(){
        
        if currentCinema != nil {
            guard let data = currentCinema?.imageData, let image = UIImage(data: data) else {return}
            imageOfPicking.image = image
            imageOfPicking.contentMode = .scaleAspectFill
            setupNavigationBar()
            nameTextField.text = currentCinema?.name
            yearTextField.text = currentCinema?.year
            ganreTextField.text = currentCinema?.ganre
            countryTextField.text = currentCinema?.country
        }
    }
    
    private func setupNavigationBar(){
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        }
        navigationItem.leftBarButtonItem = nil
        title = currentCinema?.name
        saveButton.isEnabled = true
        
    }
  
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
        
    }
    
}
// MARK: Text Field delegate

extension NewCinemaTable:UITextFieldDelegate{
    //скрываю клаву при нажатии на Готово
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc private func textFieldChanged() {
        
        if (nameTextField.text?.isEmpty == false)||(yearTextField.text?.isEmpty == false) {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}

//MARK: Work with image
extension NewCinemaTable:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func choseImagePicker(source:UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(source){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker,animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        imageOfPicking.image = info[.editedImage] as? UIImage
        imageOfPicking.contentMode = .scaleAspectFill
        imageOfPicking.clipsToBounds = true
        
        imageIsChanged = true
        
        dismiss(animated: true)
    }
    
}
