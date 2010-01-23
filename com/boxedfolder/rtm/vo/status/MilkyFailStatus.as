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

package com.boxedfolder.rtm.vo.status
{
	/**
	 * A class which represents an api fail status.
	 * <p>
	 * Status message and code can be retrieved.
	 * </p>
	 *  
	 * @author Heiko Dreyer
	 * 
	 */	
	[Bindable]
	public class MilkyFailStatus
	{
		/**
		 * @private 
		 */		
		private var _code:uint;
		
		/**
		 * @private 
		 */		
		private var _message:String;
		
		public function MilkyFailStatus(code:uint, message:String)
		{
			_code = code;
			_message = message;
		}
		
		/**
		 * Status message of failure
		 *  
		 * @return 
		 * 
		 */		
		public function get message():String
		{
			return _message;
		}

		/**
		 * Status code of failure 
		 * see api docs for further details
		 * 
		 * @return 
		 * 
		 */		
		public function get code():uint
		{
			return _code;
		}
	}
}