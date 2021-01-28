//
//  Extensions.swift
//  ComputorV1
//
//  Created by OUT-Teterin-DV on 28.01.2021.
//

import Foundation

extension String {

	func writeToStderror() {
		fputs(self + "\n", stderr)
	}
}
