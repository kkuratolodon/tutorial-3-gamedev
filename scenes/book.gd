extends Area2D

@export var speed = 259
@export var gravity_force = 75

var direction = 1

func _process(delta: float) -> void:
    position.x += speed * direction * delta
    position.y += gravity_force * delta

func set_direction(new_direction: int):
    direction = new_direction

func _on_body_entered(body:Node2D) -> void:
    if body.name.to_lower().begins_with("vase"):
        body.vase_break()
    queue_free()
