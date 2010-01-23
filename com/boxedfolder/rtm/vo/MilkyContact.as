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
	 * A single contact vo
	 *  
	 * @author Heiko Dreyer
	 * 
	 */	
	[Bindable]
	public class MilkyContact
	{	
		/**
		 * @private 
		 */		
		private var _id:uint;
		
		/**
		 * @private 
		 */		
		private var _username:String;
		
		/**
		 * @private 
		 */		
		private var _fullname:String;
		
		/**
		 * Id
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
		 * Username
		 *  
		 * @return 
		 * 
		 */		
		public function get username():String
		{
			return _username;
		}

		public function set username(value:String):void
		{
			_username = value;
		}
		
		/**
		 * Fullname 
		 * @return 
		 * 
		 */		
		public function get fullname():String
		{
			return _fullname;
		}

		public function set fullname(value:String):void
		{
			_fullname = value;
		}


	}
}