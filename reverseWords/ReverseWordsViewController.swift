//
//  ViewController.swift
//  reverseWords
//
//  Created by Елизавета Ефросинина on 15/07/2022.
//

import UIKit

class ReverseWordsViewController: UIViewController {

    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var reversedLabel: UILabel!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var bottomGrayLabel: UILabel!

    let viewModel = ReverseWordsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        mainTextField.delegate = self
        bottomTextField.isHidden = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    @IBAction func reverseButtonPressed(_ sender: UIButton) {
        guard let text = mainTextField.text else {return}
        if mainTextField.text == "" {
            reverseButton.isEnabled = false
        } else {
            reverseButton.isEnabled = true
        }
        reversedLabel.text = viewModel.reverse(input: text)
    }

    @IBAction func didChangeSegmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            viewModel.reverseMode = .letters
            bottomTextField.isHidden = true
            bottomGrayLabel.isHidden = false
        } else {
            viewModel.reverseMode = .custom
            bottomTextField.isHidden = false
            bottomGrayLabel.isHidden = true
        }
    }

    @IBAction func lowTextFieldAction(_ sender: UITextField) {
       guard let text = sender.text else {return}
       viewModel.updateCharacterSet(from: text)
    }
}

// MARK: - UITextFieldDelegate

extension ReverseWordsViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        if text.isEmpty {
            reverseButton.isEnabled = false
        } else {
            reverseButton.isEnabled = true
        }
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
