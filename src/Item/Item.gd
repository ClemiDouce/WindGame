extends Resource
class_name Item

export (String) var title
export (String) var description: String
export (int) var price: int
var purchased := false

func _init(_title: String ="Item", _description: String = "Description", _price: int = 10) -> void:
	self.title = _title
	self.description = _description
	self.price = _price
