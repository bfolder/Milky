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
	 * A class that just stores settings of the RTM user
	 * 
	 * @author Heiko Dreyer
	 * 
	 */	
	[Bindable]
	public class MilkySettings
	{
		/**
		 * @private 
		 */		
		private var _timezone:String;
		
		/**
		 * @private 
		 */		
		private var _dateformat:uint;
		
		/**
		 * @private 
		 */		
		private var _timeformat:uint;
		
		/**
		 * @private 
		 */		
		private var _defaultList:String;
		
		/**
		 * @private 
		 */		
		private var _language:String;
		
		/**
		 * User Timezone
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
		 * User´s Dateformat 
		 * 0 indicates an European date format (e.g. 14/02/06), 1 indicates an American date format (e.g. 02/14/06).
		 *  
		 * @return 
		 * 
		 */		
		public function get dateformat():uint
		{
			return _dateformat;
		}
		
		public function set dateformat(value:uint):void
		{
			_dateformat = value;
		}
		
		/**
		 * The user's default list. Blank if the user has not set a default list
		 *  
		 * @return 
		 * 
		 */		
		public function get defaultList():String
		{
			return _defaultList;
		}

		public function set defaultList(value:String):void
		{
			_defaultList = value;
		}
		
		/**
		 * User´s language - ISO 639-1 
		 * @return 
		 * 
		 */		
		public function get language():String
		{
			return _language;
		}

		public function set language(value:String):void
		{
			_language = value;
		}
		
		/**
		 * User´s Timeformat 
		 * 0 indicates 12 hour time with day period (e.g. 5pm), 1 indicates 24 hour time (e.g. 17:00).
		 *  
		 * @return 
		 * 
		 */		
		public function get timeformat():uint
		{
			return _timeformat;
		}

		public function set timeformat(value:uint):void
		{
			_timeformat = value;
		}


	}
}