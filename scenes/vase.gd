extends RigidBody2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
func vase_break():
    animated_sprite_2d.play("Break")
    set_deferred("collision_layer", 0)
    audio_stream_player_2d.play()
    await animated_sprite_2d.animation_finished
    queue_free()
