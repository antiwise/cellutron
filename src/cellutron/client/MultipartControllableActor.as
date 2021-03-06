﻿package cellutron.client 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import Box2D.Common.Math.b2Vec2;
	import com.senocular.utils.KeyObject;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author ...
	 */
	public class MultipartControllableActor extends ControllableActor
	{
		
		public function MultipartControllableActor (boundingBoxType:String, parent:DisplayObjectContainer, display:DisplayObject, position:Point,
			rotation:Number, boundingWidth = 0, boundingHeight = 0) {
			super(boundingBoxType, parent, display, position, rotation, boundingWidth, boundingHeight);
			mousePosition = new Point();
			autoRotate = false;
			if (display['legs'] != null) {
				rotationTarget = display['legs'];
			} else {
				rotationTarget = display;
				throw new Error("Display for MultipartControllableActor needs legs!");
			}
			if (display['torso'] == null) {
				throw new Error("Display for MultipartControllableActor needs a torso!");
			}
			
			
			
		}
		
		override public function step(evt:Event = null):void {
			super.step(evt);
			//updateRotation(display['legs'], new Point(body.GetLinearVelocity().x, body.GetLinearVelocity().y));
			
			
			var displayPosition = new Point(display.x, display.y);
			
			updateRotation(display['torso'], mousePosition, displayPosition);
			
			/*if (display['legs'].rotation > display['torso'].rotation + 90) {
				display['legs'].rotation = display['torso'].rotation + 90;	 
			} else if (display['legs'].rotation < display['torso'].rotation - 90) {
				display['legs'].rotation = display['torso'].rotation + 90;	
			}*/
			//display['torso'].rotation = Physics.rotation_from_points(reference, mousePosition);

		}
		
		
	}
	
	
}