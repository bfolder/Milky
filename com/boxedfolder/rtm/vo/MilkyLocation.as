/*
Copyright (c) 2010 Heiko Dreyer, boxedfolder.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

package com.boxedfolder.rtm.vo
{
	/**
	 * A single location vo
	 *  
	 * @author Heiko Dreyer
	 * 
	 */	
	[Bindable]
	public class MilkyLocation
	{
		/**
		 * @private 
		 */	
		private var _id:Number;
		
		/**
		 * @private 
		 */	
		private var _name:String;
		
		/**
		 * @private 
		 */	
		private var _long:Number;
		
		/**
		 * @private 
		 */	
		private var _lat:Number;
		
		/**
		 * @private 
		 */	
		private var _zoom:uint;
		
		/**
		 * @private 
		 */	
		private var _address:String;
		
		/**
		 * @private 
		 */		
		private var _viewable:uint;
		
		/**
		 * Location id
		 *  
		 * @return 
		 * 
		 */		
		public function get id():Number
		{
			return _id;
		}

		public function set id(value:Number):void
		{
			_id = value;
		}
		
		/**
		 * Location name
		 *  
		 * @return 
		 * 
		 */		
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}
		
		/**
		 * Longitude value
		 * e.g. "13.411508"
		 * 
		 * @return 
		 * 
		 */		
		public function get long():Number
		{
			return _long;
		}

		public function set long(value:Number):void
		{
			_long = value;
		}
		
		/**
		 * Latitude value
		 * e.g. "52.52400"
		 * 
		 * @return 
		 * 
		 */	
		public function get lat():Number
		{
			return _lat;
		}

		public function set lat(value:Number):void
		{
			_lat = value;
		}
		
		/**
		 * Zoom level of the map
		 *  
		 * @return 
		 * 
		 */		
		public function get zoom():uint
		{
			return _zoom;
		}

		public function set zoom(value:uint):void
		{
			_zoom = value;
		}
		
		/**
		 * Location address
		 *  
		 * @return 
		 * 
		 */		
		public function get address():String
		{
			return _address;
		}

		public function set address(value:String):void
		{
			_address = value;
		}
		
		/**
		 * Viewable?
		 *  
		 * @return 
		 * 
		 */		
		public function get viewable():uint
		{
			return _viewable;
		}

		public function set viewable(value:uint):void
		{
			_viewable = value;
		}


	}
}