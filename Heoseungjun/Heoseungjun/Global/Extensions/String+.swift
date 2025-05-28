import Foundation

extension String {
    var isValidEmail: Bool {
        let regularExpression = "^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let regularExpression = "[A-Za-z0-9!_@$%^&+=]{8,20}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
    
    var isValidNickname: Bool {
        let regularExpression = "^[가-힣]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
    
    func expressAttendance() -> Self? {
        guard let number = Int(self) else { return nil }
        
        if number >= 10_000 {
            let unit = Double(number) / 10_000.0
            let formatted = String(format: "%.1f", unit)
            return "\(formatted)만명"
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formatted = numberFormatter.string(from: NSNumber(value: number)) else {
            return nil
        }
        return "\(formatted)명"
    }
}
