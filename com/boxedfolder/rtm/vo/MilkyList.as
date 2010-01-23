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
	 * A single list
	 *  
	 * @author Heiko Dreyer
	 * 
	 */	
	[Bindable]
	public class MilkyList
	{
		/**
		 * @private 
		 */		
		private var _id:uint;
		
		/**
		 * @private 
		 */				
		private var _name:String;
		
		/**
		 * @private 
		 */		
		private var _deleted:Boolean;
		
		/**
		 * @private 
		 */		
		private var _locked:Boolean;
		
		/**
		 * @private 
		 */		
		private var _archived:Boolean;
		
		/**
		 * @private 
		 */		
		private var _position:int;
		
		/**
		 * @private 
		 */		
		private var _smart:Boolean;
		
		/**
		 * @private 
		 */		
		private var _filters:Array
		
		/**
		 * Id of the list element
		 *  
		 * @return 
		 * 
		 */		
		public function get id():uint
		{
			return _id;
		}
		
		public function set id(value:uint):void
		{
			_id = value;
		}
		
		/**
		 * Listname 
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
		 * Is deleted? 
		 * 
		 * @return 
		 * 
		 */		
		public function get deleted():Boolean
		{
			return _deleted;
		}

		public function set deleted(value:Boolean):void
		{
			_deleted = value;
		}
		
		/**
		 * Is locked?
		 *  
		 * @return 
		 * 
		 */		
		public function get locked():Boolean
		{
			return _locked;
		}
	
		public function set locked(value:Boolean):void
		{
			_locked = value;
		}
		
		/**
		 * Is archived?
		 *  
		 * @return 
		 * 
		 */		
		public function get archived():Boolean
		{
			return _archived;
		}

		public function set archived(value:Boolean):void
		{
			_archived = value;
		}
		
		/**
		 * Position of list element
		 *  
		 * @return 
		 * 
		 */		
		public function get position():int
		{
			return _position;
		}

		public function set position(value:int):void
		{
			_position = value;
		}
		
		/**
		 * Is smart list?
		 *  
		 * @return 
		 * 
		 */		
		public function get smart():Boolean
		{
			return _smart;
		}

		public function set smart(value:Boolean):void
		{
			_smart = value;
		}
		
		/**
		 * Array of filter strings
		 *  
		 * @return 
		 * 
		 */		
		public function get filters():Array
		{
			return _filters;
		}

		public function set filters(value:Array):void
		{
			_filters = value;
		}


	}
}