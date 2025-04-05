using Godot;
using System;

public partial class Cat : Area2D
{	
	// random
	Random rng = new Random();
	
	// movement
	private int moves = 0;
	private int x = 0;
	private int dx = 0;
	int speed = 1;
	private int aval_moves = 0;
	
	// i think that below doesn't work in c#
	//@Export int speed = 3;
	
	private Direction direction = Direction.still;
	private bool performingAction = false;
	private int i;
	
	//window width
	private float winWidth;
	private float winHeight;

	// getting the cat object (this object)
	private AnimatedSprite2D cat;

	// enum list of actions for switch case
	// getting rid of for now
	//private Action action;
	//enum Action { sit = 0 , left = 1 , right = 2 , stand_tongue = 3 , sleep = 4 }
	enum Direction { left , right , still }

	// runs on start
	private void _ready(){
		
		cat = GetNode<AnimatedSprite2D>("Cat");
		cat.Play("standing");

		winHeight = (int)GetViewport().GetVisibleRect().Size.Y;
		cat.Position = new Vector2(x, 0);
	}

	// runs on update
	public void _process(float delta){
		winWidth = (int)GetViewport().GetVisibleRect().Size.X;
		winHeight = (int)GetViewport().GetVisibleRect().Size.Y;

		move();

		if(!performingAction){

			_action();
			performingAction = true;
		}

		// i have to create some kind of something
		// for it know when it's gone through the animation
		// the select amount of times

		// it will stand inbetween each movement

	}

	// randomly generates a place in the Action list
	// displays the animation and moves or doesn't move the character
	private void _action(){

		performingAction = true;
		i = rng.Next(6);
		
		switch(i){
			case 0:
			cat.Play("sitting");
			direction = Direction.still;
			break;

			case 1:
			right();
			break;

			case 2:
			left();
			break;

			case 3:
			cat.Play("stand_tongue");
			direction = Direction.still;
			break;

			// possibly make this when you're away from the keyboard
			//case 4:
			//cat.Play("sleeping");
			//direction = Direction.still;
			//break;
			
			case 4:
			right();
			break;
			
			case 5:
			left();
			break;
		}
	}
	
	private void right(){
		cat.Play("right");
		direction = Direction.right;
	}
	
	private void left(){
		cat.Play("left");
		direction = Direction.left;
	}

	private void move(){
		
		if(x <= 0){
			x += 10;
			// go right
			right();
			}
			
		if(x >= (int)winWidth-120){
				// go left
				x -= 50;
				left();
			}
			
		switch(direction){
			case Direction.left:
			dx = speed * -1;
			break;

			case Direction.right:
			dx = speed;
			break;

			case Direction.still:
			dx = 0;
			break;
		}

		x += dx;
		cat.Position = new Vector2 (x, 0);
		
		if(direction == Direction.still){
			aval_moves = 300;
		}
		else{
			aval_moves = 450;
		}
		
		if(performingAction && moves < aval_moves){
			moves++;
		}
		else{
			performingAction = false;
			moves = 0;
		}
	}
}
