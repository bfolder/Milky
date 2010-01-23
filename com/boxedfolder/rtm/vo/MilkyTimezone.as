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
	 * A class that stores one single timezone available in RTM 
	 * 
	 * @author heikodreyer
	 * 
	 */	
	[Bindable]
	public class MilkyTimezone
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
		private var _dst:uint;
		
		/**
		 * @private 
		 */	
		private var _offset:Number;
		
		/**
		 * @private 
		 */	
		private var _currentOffset:Number;
		
		/**
		 * Timezone id
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
		 * Timezone name
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
		 * Daylight Saving Time
		 * 0 or 1
		 *  
		 * @return 
		 * 
		 */		
		public function get dst():uint
		{
			return _dst;
		}

		public function set dst(value:uint):void
		{
			_dst = value;
		}
		
		/**
		 * Timezone offset 
		 * 
		 * @return 
		 * 
		 */		
		public function get offset():Number
		{
			return _offset;
		}

		public function set offset(value:Number):void
		{
			_offset = value;
		}
		
		/**
		 * Timezone current offset
		 *  
		 * @return 
		 * 
		 */		
		public function get currentOffset():Number
		{
			return _currentOffset;
		}

		public function set currentOffset(value:Number):void
		{
			_currentOffset = value;
		}


	}
}