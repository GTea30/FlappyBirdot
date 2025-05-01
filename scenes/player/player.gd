extends CharacterBody2D;

@export var flap_velocity: float = 200;
@export var gravity = 10;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $AnimatedSprite2D.play();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    # Fall
    self.velocity.y += gravity;

    # Flap
    if Input.is_action_just_pressed("flap"):
        self.velocity.y = flap_velocity * -1;

    # Set Position
    move_and_slide();
