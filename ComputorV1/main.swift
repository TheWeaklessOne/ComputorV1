//
//  main.swift
//  ComputorV1
//
//  Created by OUT-Teterin-DV on 28.01.2021.
//

import Foundation

var arguments: [String]
let allowedCharacters = CharacterSet(charactersIn: "1234567890xX-+/*^= ")

//extension String {
//
//	func writeToStderror() {
//		fputs(self + "\n", stderr)
//	}
//}

func getArgumentsFromStdin() -> [String] {
	var input: String?

	while true {
		print("Enter the sentence: ", separator: "", terminator: "")
		input = readLine()
		guard let line = input else {
			print("")
			"Empty input is not allowed. Aborting...".writeToStderror()
			exit(EXIT_FAILURE)
		}
		if line.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
			continue
		} else if (!line.trimmingCharacters(in: allowedCharacters).isEmpty) {
			"Bad characters found in given input!".writeToStderror()
		} else {
			break
		}
	}
	return input!.components(separatedBy: " ")
}

if (CommandLine.argc < 2) {
	arguments = getArgumentsFromStdin()
} else if (CommandLine.argc == 2) {
	arguments = CommandLine.arguments[1].components(separatedBy: " ")
} else {
	arguments = [String](CommandLine.arguments.dropFirst())
}

arguments = arguments.compactMap { str in
	if (!str.trimmingCharacters(in: allowedCharacters).isEmpty) {
		"Bad characters found in given input!".writeToStderror()
		exit(EXIT_FAILURE)
	}
	if str.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
		return nil
	}
	return str
}

let parser = Parser(arguments: arguments.)
