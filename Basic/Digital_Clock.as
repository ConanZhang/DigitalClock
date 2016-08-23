
package  
{
	import flash.display.Sprite;
	import flash.display.DisplayObjectContainer;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/*
	File:Digital_Clock.as
	
	Author:	Conan Zhang (conan.zhang@utah.edu)
	Date: 09-25-13
	Partner: None
	Course:	Computer Science 1410 - EAE
	
	Description:
	
	The Digital_Clock class makes a "face" for a digital clock with 6 digits.
	It also provides a ticker to update the clock each second.
	*/
	
	public class Digital_Clock extends Sprite
	{
		//Declared Array to Contain Clock Digits//
		public var clockDigits: Array;
			
		/*
		Summary of the Digital_Clock constructor:
		The Digital_Clock constructor describes the "owner" of the object and x/y values of where to place it.
		
		Parameters: 
		thisStage:DisplayObjectContainer
		Arguments:
					xScale = width scaling
					yScale = height scaling
					
					xCoordinate = x location
					yCoordinate = y location
		
					dRotation = degrees rotated
					
		Return Value: void Just draws.
		
		Description: Draws the entire digital clock that can have varied size, location, and rotation.
		Also creates a timer to keep track of time and an array  to contain each digit of the clock.
		
		*/
		
		public function Digital_Clock(thisStage:DisplayObjectContainer, xScale, yScale, xCoordinate,yCoordinate, dRotation) 
		{
			//Create Timer for Use//
			var ticker = new Timer (1000);
			ticker.addEventListener(TimerEvent.TIMER,on_tick);
			ticker.start();
			ticker.delay = 0;
			
			//Parameter Arguments//
			this.scaleX =xScale;
			this.scaleY =yScale;
			
			this.x = xCoordinate;
			this.y = yCoordinate;
			
			this.rotation = dRotation;
			
			//Declared Array to Contain Clock Digits//
			clockDigits = new Array(6);
			
				clockDigits[0] = new Digit(this,0, 1,1, -175, 0, 0);
				clockDigits[1] = new Digit(this,0, 1,1, -125, 0, 0);
				clockDigits[2] = new Digit(this,0, 1,1, -25, 0, 0);
				clockDigits[3] = new Digit(this,0, 1,1, 25, 0, 0);
				clockDigits[4] = new Digit(this,0, 1,1, 125, 0, 0);
				clockDigits[5] = new Digit(this,0, 1,1, 175, 0, 0);
				
			//Adding and Drawing Object//
			thisStage.addChild(this);
			draw_background();
			
		}
		
		/*
		Summary of the draw_background function:
		The draw_background function draws the background color of the clock.
		
		Parameters: None
		
		Return Value: void Just draws.
		
		Description: Makes a black rectangle that is 450x200 pixels.
		
		*/
		public function draw_background() : void
		{
			//Draw Clock Background//
			this.graphics.clear();
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(-225,-100,450, 200);
			this.graphics.endFill();
		}
		
		/*
		Summary of the on_tick function:
		The on_tick function updates the values of the digits by utilizing the create_display_ list
		function to have the numbers redraw themselves.
		
		It also calls upon the draw_colons function to draw colons on the clock.
		
		Parameters: 
		evt:TimerEvent
		
		Return Value: void Just draws.
		
		Description: On the 'tick' of the TimerEvent defined in the Digital_Clock constructor, this
		function will call the create_display_list function to update every bucket in the clockDigits
		array to the appropriate number.
		
		It will also draw all the colons again on the 'tick' by calling the draw_colons function.
		*/
		
		private function on_tick(evt:TimerEvent) :void
		{
			//Update the Digits on Every Tick//
			create_display_list();
			
			//Draw Colons//
			//Between Hours & Minutes//
			draw_colons(this,1,1, -75 ,0,0);
			
			//Between Minutes & Seconds//
			draw_colons(this,1,1,75,0,0);
		}
		
		/*
		Summary of the create_display_list function:
		The create_display_list function draws the appropriate digits on the clock
		to match the time.
		
		Parameters: None
		
		Return Value: void Just draws.
		
		Description: Recieves current time and places each value into its respective hour, minute, and second
		variables. Then finds the last digits of the variables for use in drawing the
		correct digit. Afterwords, checks the values of the variables and determines what digits to draw
		based on which 10 digit interval the value is located in.
		
		*/

		public function create_display_list() :void
		{
			//Declared Variables to Recieve Current Time//
			var time:Date = new Date();
		
			var hours:uint   = time.getHours();
			var minutes:uint = time.getMinutes();
			var seconds:uint = time.getSeconds();
		
			//Declared Variables to Display Last Digits of Time Values//
			
			var lastHoursDigit: int = hours % 10;
			var lastMinutesDigit: int = minutes % 10; 
			var lastSecondsDigit: int = seconds % 10;
			
			//Update Hours//
			if (hours < 10)
			{
				clockDigits[0].create_display_list(0);
				clockDigits[1].create_display_list(hours);
			}
			else if (hours <20)
			{
				clockDigits[0].create_display_list(1);
				clockDigits[1].create_display_list(lastHoursDigit);
			}
			else if (hours <25)
			{
				clockDigits[0].create_display_list(2);
				clockDigits[1].create_display_list(lastHoursDigit);
			}
			
			//Update Minutes//
			if (minutes <10)
			{
				clockDigits[2].create_display_list(0);
				clockDigits[3].create_display_list(minutes);
			}
			else if (minutes <20)
			{
				clockDigits[2].create_display_list(1);
				clockDigits[3].create_display_list(lastMinutesDigit);
			}
			else if (minutes <30)
			{
				clockDigits[2].create_display_list(2);
				clockDigits[3].create_display_list(lastMinutesDigit);
			}
			else if (minutes <40)
			{
				clockDigits[2].create_display_list(3);
				clockDigits[3].create_display_list(lastMinutesDigit);
			}
			else if (minutes <50)
			{
				clockDigits[2].create_display_list(4);
				clockDigits[3].create_display_list(lastMinutesDigit);
			}
			else if (minutes <60)
			{
				clockDigits[2].create_display_list(5);
				clockDigits[3].create_display_list(lastMinutesDigit);
			}
			
			//Update Seconds//
			
			if (seconds <10)
			{
				clockDigits[4].create_display_list(0);
				clockDigits[5].create_display_list(seconds);
			}
			else if (seconds <20)
			{
				clockDigits[4].create_display_list(1);
				clockDigits[5].create_display_list(lastSecondsDigit);
			}
			else if (seconds <30)
			{
				clockDigits[4].create_display_list(2);
				clockDigits[5].create_display_list(lastSecondsDigit);
			}
			else if (seconds <40)
			{
				clockDigits[4].create_display_list(3);
				clockDigits[5].create_display_list(lastSecondsDigit);
			}
			else if (seconds <50)
			{
				clockDigits[4].create_display_list(4);
				clockDigits[5].create_display_list(lastSecondsDigit);
			}
			else if (seconds <60)
			{
				clockDigits[4].create_display_list(5);
				clockDigits[5].create_display_list(lastSecondsDigit);
			}
		}
		
		/*
		Summary of the draw_colons function:
		The draw_colons function draws colons on clock.
		
		Parameters: 
		thisStage:DisplayObjectContainer
		Arguments:
					xScale = width scaling
					yScale = height scaling
					
					xCoordinate = x location
					yCoordinate = y location
		
					dRotation = degrees rotated
					
		Return Value: void Just draws.
		
		Description: Draws colons to a given x and y coordinate that can have altered sizes and rotation.
		
		*/
		public function draw_colons(thisStage:DisplayObjectContainer, xScale, yScale, xCoordinate,yCoordinate, dRotation) :void
		{
			//Parameter Arguments//
			this.scaleX =xScale;
			this.scaleY =yScale;
			
			this.rotation = dRotation;
			
			//Draw Upper Square//
			this.graphics.beginFill(0x76E024);
			this.graphics.drawRect(xCoordinate,yCoordinate + 15,7,7);
			this.graphics.endFill();
			
			//Draw Lower Square//
			this.graphics.beginFill(0x76E024);
			this.graphics.drawRect(xCoordinate,yCoordinate - 15,7,7);
			this.graphics.endFill();
		}
		
	}
	
}
