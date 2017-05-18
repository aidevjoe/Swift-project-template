import Kingfisher

extension UIImageView {
    
    func setImage(url : URL?, placeholder: UIImage? = UIImage(named: "placeholder"), animated: Bool = true) {
        guard let imageURL = url else { return }
        
        if animated {
            self.kf.setImage(with: imageURL, placeholder: placeholder, options: [.backgroundDecode, .transition(.fade(0.4))], progressBlock: nil, completionHandler: nil)
        }
    }
}
