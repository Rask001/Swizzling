
/*
 Swizzling, нужен для того, чтобы по какой-то причине заменить в рантайме внутренние реализации методов.
 В параметры метода заносятся оригигинальный метод, метод на который он должен быть заменен, класс оригинального метода а так же класс метода где лежит подменный метод.
 
 Created by Антон Прокопьев on  20.12.2022.
 */

import Foundation
import ObjectiveC

open class Swizzling: NSObject {
    
    ///Пример как заполнять параметры - originalSelector: #selector(swz.originalMhetod), swizzlingClass: Swz.self.
    /// Mетоды должны быть помечены @objc dynamic func
    public func swizzle(originalSelector: Selector, swizzlingSelector: Selector, originalClass: AnyClass, swizzlingClass: AnyClass) {
        let originalSelector = originalSelector
        let swizzlingSelector = swizzlingSelector
        
        let originalMhetod = class_getInstanceMethod(originalClass, originalSelector)
        let swizlingMhetod = class_getInstanceMethod(swizzlingClass, swizzlingSelector)
        
        guard let original = originalMhetod,
              let swz = swizlingMhetod else { return }
        
        method_exchangeImplementations(original, swz)
    }
}
