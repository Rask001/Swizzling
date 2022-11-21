
import Foundation
import UIKit
import ObjectiveC

class TestSwizzling: NSObject {
	@objc dynamic func originalMhetod() {
		print("I am original mhetod")
	}
}

extension TestSwizzling {
	@objc dynamic func swizzledMhetod() {
		print("I am swizzled mhetod")
	}
	
	func swizzle() {
		let originalSelector = #selector(TestSwizzling.originalMhetod)
		let swizlingSelector = #selector(TestSwizzling.swizzledMhetod)
		
		let originalMhetod = class_getInstanceMethod(TestSwizzling.self, originalSelector)
		let swizlingMhetod = class_getInstanceMethod(TestSwizzling.self, swizlingSelector)
		
		method_exchangeImplementations(originalMhetod!, swizlingMhetod!)
		print("Swizzled Done!")
		
	}
}

var test = TestSwizzling()

test.originalMhetod()
test.swizzledMhetod()

test.swizzle()

test.originalMhetod()
test.swizzledMhetod()
