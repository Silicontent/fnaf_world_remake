extends Node2D


func _on_fazbear_hills_body_entered(_body):
	owner.current_area = 0


func _on_choppy_woods_body_entered(_body):
	owner.current_area = 1


func _on_dusting_fields_body_entered(_body):
	owner.current_area = 2


func _on_lilygear_lake_body_entered(_body):
	owner.current_area = 3


func _on_blacktomb_yard_body_entered(_body):
	owner.current_area = 4


func _on_pinwheel_circus_body_entered(_body):
	owner.current_area = 5


func _on_mysterious_mine_body_entered(_body):
	owner.current_area = 6


func _on_deep_metal_mine_body_entered(_body):
	owner.current_area = 7


func _on_pinwheel_funhouse_body_entered(_body):
	owner.current_area = 8
