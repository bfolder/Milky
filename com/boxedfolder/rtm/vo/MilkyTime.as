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
	 * A single time vo
	 *  
	 * @author Heiko Dreyer
	 * 
	 */	
	[Bindable]
	public class MilkyTime
	{
		/**
		 * @private 
		 */		
		private var _timezone:String;
		
		/**
		 * @private
		 */		
		private var _value:String;
		
		/**
		 * @private
		 */		
		private var _precision:String;
		
		/**
		 * Timezone
		 *  
		 * @return 
		 * 
		 */		
		public function get timezone():String
		{
			return _timezone;
		}

		public function set timezone(value:String):void
		{
			_timezone = value;
		}
		
		/**
		 * Time value for this object
		 *  
		 * @return 
		 * 
		 */		
		public function get value():String
		{
			return _value;
		}

		public function set value(value:String):void
		{
			_value = value;
		}
		
		/**
		 * A precise value can be retrieved via the <code>parseTime</code> Method.
		 * This should then be "time".
		 * 
		 * @return 
		 * 
		 */		
		public function get precision():String
		{
			return _precision;
		}

		public function set precision(value:String):void
		{
			_precision = value;
		}


	}
}