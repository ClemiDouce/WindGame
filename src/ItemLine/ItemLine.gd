extends HBoxContainer

var title: String
var description: String
var price: int

signal item_purchased(item_title, item_price)

func _initiate(_title, _description, _price):
	self.title = _title
	self.description = _description
	self.price = _price
	$ItemTitle.text = self.title
	$ItemDesc.text = self.description
	$BuyButton.text = str(self.price)+"€"
	return self


func _on_BuyButton_pressed() -> void:
	emit_signal("item_purchased", self.title, self.price)
