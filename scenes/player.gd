extends CharacterBody2D

@export var gravity = 200.0
@export var walk_speed = 200
@export var jump_speed = -300
@export var dash_speed = 500

var z := .0
var zz := .0
var zzz := .0

var _is_facing_right := true
var _can_double_jump := true
var _is_falling := false
var _is_jumping := false
var _is_crouching := false
var _is_dashing := false
var _can_dash = true

@onready var _animation := $Sprite2D/AnimationPlayer
@onready var _col_ceiling := $CollisionShape2D2
@onready var _shapecast_up = $ShapeCast2D


func _physics_process(delta):
	if _is_dashing:
		var direction = 1
		if not _is_facing_right:
			direction = -1
		velocity.y = 0
		velocity.x = dash_speed * direction
		move_and_slide()
		zz += delta
		if zz < 0.3:
			return
		zz = 0
		_is_dashing = false

	if Input.is_action_just_pressed("dash") and _can_dash:
		_can_dash = false
		_is_dashing = true

	zzz += delta
	if zzz > 1:
		_can_dash = true
		zzz = 0

	velocity.y += delta * gravity
	if is_on_floor():
		_can_double_jump = true
		if abs(velocity.x) > 0 && not _is_jumping and not _is_crouching:
			#_animation.play("RESET")
			#_animation.advance(0)
			_animation.play("walk")

	if abs(velocity.x) < 1e-5 and is_on_floor() and not _is_jumping and not _is_crouching:
		#_animation.play("RESET")
		#_animation.advance(0)
		_animation.play("idle")

	if _is_jumping and is_on_floor():
		_animation.play("ground")
		z += delta
		if z >= 0.25:
			_is_jumping = false
			z = 0

	if velocity.y > 13:
		_is_jumping = true
		_animation.play("fall")

	if Input.is_action_just_pressed("ui_up"):
		if not _is_crouching or not _shapecast_up.is_colliding():
			_is_crouching = false
			_col_ceiling.disabled = false
			_is_crouching = false
			if is_on_floor():
				_jump()
			elif _can_double_jump:
				_jump()
				_can_double_jump = false

	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = walk_speed
	else:
		velocity.x = 0

	if velocity.x > 0 && not _is_facing_right:
		_is_facing_right = true
		_flip_player()

	if velocity.x < 0 && _is_facing_right:
		_is_facing_right = false
		_flip_player()

	if Input.is_action_just_pressed("ui_down"):
		if not _is_crouching:
			_is_crouching = true
			_animation.play("crouch")
		else:
			if not _shapecast_up.is_colliding():
				_col_ceiling.disabled = false
				_is_crouching = false

	move_and_slide()


func _flip_player():
	scale.x *= -1


func _jump():
	velocity.y = jump_speed
	_is_jumping = true
	_animation.play("jump")
