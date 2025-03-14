extends CharacterBody2D

@export var gravity = 200.0
@export var walk_speed = 200
@export var jump_speed = -300
@export var dash_speed = 500
@export var book : PackedScene

var z := .0
var zz := .0
var zzz := .0

var _is_facing_right := true
var _can_double_jump := true
var _is_falling := false
var _is_jumping := false
var _is_dashing := false
var _can_dash = true
var _can_attack = true

@onready var _animation := $AnimatedSprite2D
@onready var _attackSound : AudioStreamPlayer2D = $Attack
@onready var _gunPoint : Node2D = $GunPoint


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
        if abs(velocity.x) > 0 && not _is_jumping && _can_attack:
            #_animation.play("RESET")
            #_animation.advance(0)
            _animation.play("Walk")

    if abs(velocity.x) < 1e-5 and is_on_floor() and not _is_jumping && _can_attack:
        #_animation.play("RESET")
        #_animation.advance(0)
        _animation.play("Idle")

    if _is_jumping and is_on_floor():
        z += delta
        if z >= 0.25:
            _is_jumping = false
            z = 0

    if velocity.y > 13:
        _is_jumping = true

    if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
        if _can_attack:
            _can_attack = false
            _attack()
            await get_tree().create_timer(1).timeout
            _can_attack = true

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

    move_and_slide()


func _flip_player():
    scale.x *= -1

func _attack():
    _animation.play("Attack")
    _attackSound.play()
    await get_tree().create_timer(0.7).timeout
    var book_instance = book.instantiate()
    if not _is_facing_right:
        book_instance.direction = -1
    
    get_parent().add_child(book_instance)
    book_instance.global_position = _gunPoint.global_position
    if not _is_facing_right:
        book_instance.scale.x *= -1
