using Godot;
using System;

//public partial class Collision : CollisionShape2D{
//
//private int x;
//private int y;
//
//public void _process(float delta){
	//AnimatedSprite2D cat = GetNode<AnimatedSprite2D>("../Cat");
	//this.GlobalPosition = cat.GlobalPosition;
	////cat.Frame().GetSize() * cat.Scale.X;
//}

public partial class Collision : CollisionShape2D
{
	private int x;
	private int y;
	
	public override void _Process(double delta){
		AnimatedSprite2D cat = GetNode<AnimatedSprite2D>("../Cat");
		this.GlobalPosition = cat.GlobalPosition; //+ (cat.SpriteFrames.GetFrameTexture(cat.Animation, cat.Frame).GetSize()) * cat.Scale.X;
		//GD.Print("weh");
	}
}
