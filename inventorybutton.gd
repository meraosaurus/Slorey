extends MenuButton

	








   
	# Add the inventory UI to the scene, but keep it hidden initially
   
	
	# Connect the button signal
	$Button.connect("pressed", self, "_on_button_pressed")

func _on_button_pressed():
	# Toggle the visibility of the inventory UI
	inventory_ui.visible = !inventory_ui.visible
