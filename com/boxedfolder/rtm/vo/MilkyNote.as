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
	 * A single note
	 *  
	 * @author heikodreyer
	 * 
	 */
	[Bindable]
	public class MilkyNote
	{
		/**
		 * @private 
		 */		
		private var _id:uint;
	
		/**
		 * @private 
		 */		
		private var _created:String;
		
		/**
		 * @private 
		 */		
		private var _modified:String;
		
		/**
		 * @private 
		 */		
		private var _title:String;
		
		/**
		 * @private 
		 */		
		private var _body:String;
		
		/**
		 * Id 
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
		 * Date this note was created e.g. 06-05-07T11:26:49Z
		 *  
		 * @return 
		 * 
		 */		
		public function get created():String
		{
			return _created;
		}

		public function set created(value:String):void
		{
			_created = value;
		}
		
		/**
		 * Date this note was modified e.g. 06-05-07T11:26:49Z
		 *  
		 * @return 
		 * 
		 */		
		public function get modified():String
		{
			return _modified;
		}

		public function set modified(value:String):void
		{
			_modified = value;
		}
		
		/**
		 * Title
		 *  
		 * @return 
		 * 
		 */		
		public function get title():String
		{
			return _title;
		}

		public function set title(value:String):void
		{
			_title = value;
		}
		
		/**
		 * Body text
		 *  
		 * @return 
		 * 
		 */		
		public function get body():String
		{
			return _body;
		}

		public function set body(value:String):void
		{
			_body = value;
		}


	}
}