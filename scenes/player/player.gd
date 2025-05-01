extends CharacterBody2D;

@export var flap_velocity: float = 200;
@export var gravity = 10;
@export var tilt: float = 0.05;

var status = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $AnimatedSprite2D.play();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
    # Check to see if collision happened
    if get_slide_collision_count() > 0:
        status = false;

    if status:
        # Fall
        self.velocity.y += gravity;
        if self.rotation < PI / 2 and self.velocity.y >= 0:
            self.rotation += tilt;

        # Flap
        if Input.is_action_just_pressed("flap"):
            self.velocity.y = flap_velocity * -1;
            self.rotation = PI / -5;

        # Set Position
        move_and_slide();
