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
	 * A single task 
	 * 
	 * @author Heiko Dreyer
	 * 
	 */	
	[Bindable]
	public class MilkyTask
	{
		/**
		 * @private 
		 */		
		private var _id:uint;
		
		/**
		 * @private 
		 */	
		private var _due:String;
		
		/**
		 * @private 
		 */	
		private var _hasDueTime:Boolean;
		
		/**
		 * @private 
		 */	
		private var _added:String;
		
		/**
		 * @private 
		 */	
		private var _completed:String;
		
		/**
		 * @private 
		 */	
		private var _deleted:String;
		
		/**
		 * @private 
		 */	
		private var _priority:uint;
		
		/**
		 * @private 
		 */	
		private var _postponed:Boolean;
		
		/**
		 * @private 
		 */	
		private var _estimate:String;

		/**
		 * id
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
		 * Date in form <i>2006-05-08T13:52:26</i> 
		 * 
		 * @return 
		 * 
		 */		
		public function get due():String
		{
			return _due;
		}

		public function set due(value:String):void
		{
			_due = value;
		}
		
		/**
		 * Boolean value indicates if Task has a due date 
		 * @return 
		 * 
		 */		
		public function get hasDueTime():Boolean
		{
			return _hasDueTime;
		}

		public function set hasDueTime(value:Boolean):void
		{
			_hasDueTime = value;
		}
		
		/**
		 * Date in form <i>2006-05-08T13:52:26</i> 
		 * 
		 * @return 
		 * 
		 */		
		public function get added():String
		{
			return _added;
		}

		public function set added(value:String):void
		{
			_added = value;
		}
		
		/**
		 * Date in form <i>2006-05-08T13:52:26</i> 
		 *  
		 * @return 
		 * 
		 */		
		public function get completed():String
		{
			return _completed;
		}

		public function set completed(value:String):void
		{
			_completed = value;
		}
		
		/**
		 * Date in form <i>2006-05-08T13:52:26</i> 
		 *  
		 * @return 
		 * 
		 */		
		public function get deleted():String
		{
			return _deleted;
		}

		public function set deleted(value:String):void
		{
			_deleted = value;
		}

		/**
		 * Priority of task
		 *  
		 * @return 
		 * 
		 */		
		public function get priority():uint
		{
			return _priority;
		}

		public function set priority(value:uint):void
		{
			_priority = value;
		}
		
		/**
		 * Indicates if postponed 
		 * @return 
		 * 
		 */		
		public function get postponed():Boolean
		{
			return _postponed;
		}

		public function set postponed(value:Boolean):void
		{
			_postponed = value;
		}
		
		/**
		 * Sets estimate, e.g. <i>2 hrs</i>
		 * <p>
		 * <i>specified in units of days, hours or minutes</i>
		 * </p>
		 * 
		 * @return 
		 * 
		 */		
		public function get estimate():String
		{
			return _estimate;
		}

		public function set estimate(value:String):void
		{
			_estimate = value;
		}


	}
}