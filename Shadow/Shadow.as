package  
{
	import flash.display.Sprite;
	import flash.display.DisplayObjectContainer;
	
	/*
	File:Shadow.as
	
	Author:	Conan Zhang (conan.zhang@utah.edu)
	Date: 09-25-13
	Partner: None
	Course:	Computer Science 1410 - EAE
	
	Description:
	
	The Shadow class draws digit 'shadows' onto the digital clock's face by utilizing sprites.
	
	*/
	public class Shadow extends Sprite
	{

		/*
		Summary of the Shadow constructor:
		The Shadow constructor draws a 'shadow' digit that can have varied size, location, and rotation.
		
		Parameters: 
		thisStage:DisplayObjectContainer
		Arguments:
					xScale = width scaling
					yScale = height scaling
					
					xCoordinate = x location
					yCoordinate = y location
		
					dRotation = degrees rotated
		
		Return Value: void Just draws.
		
		Description: The constructor adds a Shadow object to the stage then draws it by calling the
		create_display_list function. You can alter the size, location, and rotation of the object
		by changing values of the parameters.
		
		*/
		
		public function Shadow(thisStage:DisplayObjectContainer, xScale, yScale, xCoordinate,yCoordinate, dRotation): void
		{
			//Parameter Arguments//
			this.scaleX =xScale;
			this.scaleY =yScale;
			
			this.x = xCoordinate;
			this.y = yCoordinate;
			
			this.rotation = dRotation;
		
			//Adding and Drawing Object//
			thisStage.addChild(this);
			create_display_list();
		}
		
		/*
		Summary of the create_display_list function:
		The create_display_list function draws a 'shadow' digit using the same drawing code as
		the other digits.
		
		Parameters: None
		
		Return Value: void Just draws.
		
		Description: A set line size and color is chosen to draw a darkened 8 digit to represent
		the 'shadow' of the digits.
		
		*/
		public function create_display_list(): void
		{
			this.graphics.lineStyle(6,0x2B1A1B);
			
			//Draw 8//
			//Top Line//
			this.graphics.moveTo(-15,-30);
			this.graphics.lineTo(15,-30);
			
			//Middle Line//
			this.graphics.moveTo(-15,0);
			this.graphics.lineTo(15,0);
			
			//Bottom Line//
			this.graphics.moveTo(-15,30);
			this.graphics.lineTo(15,30);
			
			//Top Left Line//
			this.graphics.moveTo(-15,0);
			this.graphics.lineTo(-15,-30);
			
			//Top Right Line//
			this.graphics.moveTo(15,0);
			this.graphics.lineTo(15,-30);
			
			//Bottom Left Line//
			this.graphics.moveTo(-15,0);
			this.graphics.lineTo(-15,30);
			
			//Bottom Right Line//
			this.graphics.moveTo(15,0);
			this.graphics.lineTo(15,30);
		}

	}
	
}
