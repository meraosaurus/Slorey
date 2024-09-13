extends Control
@onready var invent:= preload("res://inventory/inventory_ui.tscn")


func _on_inventorybutton_pressed():
	inventory.visible=true
