class_name GraphPath
extends Node


export var graph: Dictionary = {
	NodePath("Radiant/Fountain"): {
		NodePath("Radiant/T2"): 1
	},
	NodePath("Radiant/T2"): {
		NodePath("Radiant/T1"): 1
	},
	NodePath("Radiant/T1"): {
		NodePath("Mid"): 1
	},
	NodePath("Dire/Fountain"): {
		NodePath("Dire/T2"): 1
	},
	NodePath("Dire/T2"): {
		NodePath("Dire/T1"): 1
	},
	NodePath("Dire/T1"): {
		NodePath("Mid"): 1
	},
	NodePath("Mid"): {
		
	}
}
