//created on  2/04/24

import UIKit

final class CheckBox: UIImageView {
    
    private let checkedImage = UIImage(named: "iconCheckOn")
    private let uncheckedImage = UIImage(named: "iconCheckOff")

    var isChecked: Bool = false {
        didSet{
            image = isChecked ? checkedImage : uncheckedImage
        }
    }
    
    init() {
        super.init(frame: .zero)
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBoxTapped))
        addGestureRecognizer(tapGesture)
        isChecked = false
        image = uncheckedImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func checkBoxTapped() {
        isChecked.toggle()
    }
    
}
