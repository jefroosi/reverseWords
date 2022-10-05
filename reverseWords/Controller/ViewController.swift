//
//  ViewController.swift
//  reverseWords
//
//  Created by Елизавета Ефросинина on 15/07/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var reversedText: UILabel!
    @IBOutlet weak var myScrollView: UIScrollView!
    let model1 = ReverseWordsModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.title = "Reverse Words"
        reverseButton.isEnabled = false
        reverseButton.alpha = 0.5
        myTextField.delegate = self
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if text.isEmpty {
            reverseButton.isEnabled = false
            reverseButton.alpha = 0.5
        } else {
            reverseButton.isEnabled = true
            reverseButton.alpha = 1.0
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    @IBAction func reverseButtonPressed(_ sender: UIButton) {
        if myTextField.text == "" {
            reverseButton.isEnabled = false
        } else {
            reverseButton.isEnabled = true
        }
       self.reversedText.text = model1.reverse(input: myTextField.text!)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}
