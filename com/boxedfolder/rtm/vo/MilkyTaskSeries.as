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
	 * A single task series
	 *  
	 * @author Heiko Dreyer
	 * 
	 */	
	[Bindable]
	public class MilkyTaskSeries
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
		private var _created:String;
		
		/**
		 * @private 
		 */
		private var _modified:String;
		
		/**
		 * @private 
		 */
		private var _source:String;
		
		/**
		 * @private 
		 */
		private var _url:String;
		
		/**
		 * @private 
		 */
		private var _locationId:uint;
		
		/**
		 * @private 
		 */
		private var _repeatRuleEvery:Boolean;
		
		/**
		 * @private 
		 */
		private var _repeatRule:String;
		
		/**
		 * @private  
		 */		
		private var _inListId:uint;
		
		/**
		 * @private 
		 */
		private var _tags:Array;
		
		/**
		 * @private 
		 */
		private var _participants:Array;
		
		/**
		 * @private 
		 */
		private var _notes:Array;
		
		/**
		 * @private 
		 */
		private var _task:MilkyTask;
		
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
		 * Name of the Task(series)
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
		 * Created at
		 * <p>
		 * Date in form <i>2006-05-08T13:52:26</i> 
		 * </p>
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
		 * Modified at
		 * <p>
		 * Date in form <i>2006-05-08T13:52:26</i> 
		 * </p>
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
		 * Source 
		 *  
		 * @return 
		 * 
		 */		
		public function get source():String
		{
			return _source;
		}

		public function set source(value:String):void
		{
			_source = value;
		}
		
		/**
		 * Url
		 *  
		 * @return 
		 * 
		 */		
		public function get url():String
		{
			return _url;
		}

		public function set url(value:String):void
		{
			_url = value;
		}
		
		/**
		 * Location id
		 *  
		 * @return 
		 * 
		 */		
		public function get locationId():uint
		{
			return _locationId;
		}

		public function set locationId(value:uint):void
		{
			_locationId = value;
		}
		
		/**
		 * Does the repeat rule actually recursively repeat?
		 * 
		 * @return 
		 * 
		 */		
		public function get repeatRuleEvery():Boolean
		{
			return _repeatRuleEvery;
		}		
		public function set repeatRuleEvery(value:Boolean):void
		{
			_repeatRuleEvery = value;
		}

		public function get repeatRule():String
		{
			return _repeatRule;
		}	
		
		/**
		 * Repeat Rule
		 * <p>
		 * e.g. FREQ=DAILY;INTERVAL=5
		 * </p> 
		 * Look here for further information: 
		 * <a href="http://www.rememberthemilk.com/services/api/methods/rtm.tasks.setRecurrence.rtm" target="_blank">
		 * http://www.rememberthemilk.com/services/api/methods/rtm.tasks.setRecurrence.rtm</a>
		 * @param value
		 * 
		 */
		public function set repeatRule(value:String):void
		{
			_repeatRule = value;
		}
		
		/**
		 * Array of Tags as Strings
		 *  
		 * @return 
		 * 
		 */		
		public function get tags():Array
		{
			return _tags;
		}

		public function set tags(value:Array):void
		{
			_tags = value;
		}
		
		/**
		 * Array of participants as <code>MilkyContact</code>
		 * 
		 * @return 
		 * 
		 */		
		public function get participants():Array
		{
			return _participants;
		}

		public function set participants(value:Array):void
		{
			_participants = value;
		}
		
		/**
		 * Array of notes as <code>MilkyNote</code>
		 *  
		 * @return 
		 * 
		 */		
		public function get notes():Array
		{
			return _notes;
		}

		public function set notes(value:Array):void
		{
			_notes = value;
		}
		
		/**
		 * Array of tasks as <code>MilkyTask</code>
		 *  
		 * @return 
		 * 
		 */		
		public function get task():MilkyTask
		{
			return _task;
		}

		public function set task(value:MilkyTask):void
		{
			_task = value;
		}
		
		/**
		 * Id of the list, this taskseries is stored in
		 *  
		 * @return 
		 * 
		 */		
		public function get inListId():uint
		{
			return _inListId;
		}

		public function set inListId(value:uint):void
		{
			_inListId = value;
		}


	}
}