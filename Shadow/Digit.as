package  
{
	import flash.display.Sprite;
	import flash.display.DisplayObjectContainer;

	/*
	File:Digit.as
	
	Author:	Conan Zhang (conan.zhang@utah.edu)
	Date: 09-25-13
	Partner: None
	Course:	Computer Science 1410 - EAE
	
	Description:
	
	The Digit class draws the digits onto the digital clock's face by utilizing sprites.
	
	*/
	
	public class Digit extends Sprite
	{
		/*
		Summary of the Digit constructor:
		The Digit constructor describes the "owner" of the object and values that affect it.
		
		Parameters: 
		thisStage:DisplayObjectContainer
		Arguments:
					digit = time value
					xScale = width scaling
					yScale = height scaling
					
					xCoordinate = x location
					yCoordinate = y location
		
					dRotation = degrees rotated
		
		Return Value: void Just draws.
		
		Description: The constructor creates digits 0-9 with alterable variables such as scale, position, and rotation.
		It adds digits to the stage and calls upon the create_display_list function to draw them.
		
		*/
		public function Digit(thisStage:DisplayObjectContainer, digit, xScale, yScale, xCoordinate,yCoordinate, dRotation) 
		{
			//Parameter Arguments//
			this.scaleX =xScale;
			this.scaleY =yScale;
			
			this.x = xCoordinate;
			this.y = yCoordinate;
			
			this.rotation = dRotation;
		
			//Adding and Drawing Object//
			thisStage.addChild(this);
			create_display_list(digit);
		}
		
		/*
		Summary of the create_display_list function:
		The create_display_list function draws a digit from 0-9 that has a specific origin.
		It will determine what horizontal and vertical line segments to turn on based on the
		digits value.
		
		Parameters:
		Arguments:
					digit = number to be drawn
		
		Return Value: void Just draws.
		
		Description: Digits will be displayed by utilizing the helper functions draw_horizantal_segment
		and draw_vertical_segment. Separate x and y offsets are used to indicate different lines to
		draw specific numbers 0-9.
		
		*/
		public function create_display_list(digit): void
		{
		
			if (digit == 0)
			{
				//Draw 0//
				this.graphics.clear();
				draw_horizontal_segment(1);
				draw_horizontal_segment(3);
				
				draw_vertical_segment(1,1);
				draw_vertical_segment(1,2);
				draw_vertical_segment(2,1);
				draw_vertical_segment(2,2);
			}
			else if (digit == 1)
			{
				//Draw 1//
				this.graphics.clear();
				draw_vertical_segment(1,2);
				draw_vertical_segment(2,2);
			}
			else if (digit == 2)
			{
				//Draw 2//
				this.graphics.clear();
				draw_horizontal_segment(1);
				draw_horizontal_segment(2);
				draw_horizontal_segment(3);
				
				draw_vertical_segment(1,2);
				draw_vertical_segment(2,1);
			}
			else if (digit == 3)
			{
				//Draw 3//
				this.graphics.clear();
				draw_horizontal_segment(1);
				draw_horizontal_segment(2);
				draw_horizontal_segment(3);
				
				draw_vertical_segment(1,2);
				draw_vertical_segment(2,2);
			}
			else if (digit == 4)
			{
				//Draw 4//
				this.graphics.clear();
				draw_horizontal_segment(2);
				
				draw_vertical_segment(1,1);
				draw_vertical_segment(1,2);
				draw_vertical_segment(2,2);
			}
			else if (digit == 5)
			{
				//Draw 5//
				this.graphics.clear();
				draw_horizontal_segment(1);
				draw_horizontal_segment(2);
				draw_horizontal_segment(3);
				
				draw_vertical_segment(1,1);
				draw_vertical_segment(2,2);
			}
			else if (digit == 6)
			{
				//Draw 6//
				this.graphics.clear();
				draw_horizontal_segment(2);
				draw_horizontal_segment(3);
			
				draw_vertical_segment(1,1);
				draw_vertical_segment(2,1);
				draw_vertical_segment(2,2);
			}
			else if (digit == 7)
			{
				//Draw 7//
				this.graphics.clear();
				draw_horizontal_segment(1);
				
				draw_vertical_segment(1,2);
				draw_vertical_segment(2,2);
			}
			else if (digit == 8)
			{
				//Draw 8//
				this.graphics.clear();
				draw_horizontal_segment(1);
				draw_horizontal_segment(2);
				draw_horizontal_segment(3);
				
				draw_vertical_segment(1,1);
				draw_vertical_segment(1,2);
				draw_vertical_segment(2,1);
				draw_vertical_segment(2,2);
			}
			else if (digit == 9)
			{
				//Draw 9//
				this.graphics.clear();
				draw_horizontal_segment(1);
				draw_horizontal_segment(2);
				
				draw_vertical_segment(1,1);
				draw_vertical_segment(1,2);
				draw_vertical_segment(2,2);
			}
			
		}
		
		/*
		Summary of the draw_horizontal_segment helper function:
		The draw_horizontal_segment helper function draws a horizontal line at a given y coordinate.
		
		Parameters: 
		Arguments:
					y_offset:int 
		
		Return Value: void Just draws.
		
		Description: 3 different horizontal lines may be drawn, depending on the desired digit
		you want to display. 
		
		*/
		private function draw_horizontal_segment( y_offset : int ) : void
		{
			this.graphics.lineStyle(6,0x76E024);
			
			if (y_offset == 1)
			{
				//Top Line//
				this.graphics.moveTo(-15,-30);
				this.graphics.lineTo(15,-30);
			}
			else if (y_offset == 2)
			{
				//Middle Line//
				this.graphics.moveTo(-15,0);
				this.graphics.lineTo(15,0);
			}
			else if(y_offset == 3)
			{
				//Bottom Line//
				this.graphics.moveTo(-15,30);
				this.graphics.lineTo(15,30);
			}
		}
		
		/*
		Summary of the draw_vertical_segment helper function:
		The draw_vertical_segment helper function draws a vertical line at a given x and y coordinate.
		
		Parameters: 
		Arguments:
					x_offset:int
					y_offset:int
		
		Return Value: void Just draws.
		
		Description: 4 different vertical lines may be may be drawn, depending on the desired digit
		you want to display. 
		
		*/
		private function draw_vertical_segment(x_offset: int, y_offset : int ) : void
		{
			this.graphics.lineStyle(6,0x76E024);
			
			if (x_offset == 1 && y_offset == 1)
			{
				//Top Left Line//
				this.graphics.moveTo(-15,0);
				this.graphics.lineTo(-15,-30);
			}
			else if (x_offset == 1 && y_offset == 2)
			{
				//Top Right Line//
				this.graphics.moveTo(15,0);
				this.graphics.lineTo(15,-30);
			}
			else if (x_offset == 2 && y_offset == 1)
			{
				//Bottom Left Line//
				this.graphics.moveTo(-15,0);
				this.graphics.lineTo(-15,30);
			}
			else if (x_offset == 2 && y_offset == 2)
			{
				//Bottom Right Line//
				this.graphics.moveTo(15,0);
				this.graphics.lineTo(15,30);
			}

			
			
		}
	}
	
}
