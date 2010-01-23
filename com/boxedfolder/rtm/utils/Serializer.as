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

package com.boxedfolder.rtm.utils
{
	import com.boxedfolder.rtm.vo.MilkyContact;
	import com.boxedfolder.rtm.vo.MilkyGroup;
	import com.boxedfolder.rtm.vo.MilkyList;
	import com.boxedfolder.rtm.vo.MilkyLocation;
	import com.boxedfolder.rtm.vo.MilkyNote;
	import com.boxedfolder.rtm.vo.MilkySettings;
	import com.boxedfolder.rtm.vo.MilkyTask;
	import com.boxedfolder.rtm.vo.MilkyTaskSeries;
	import com.boxedfolder.rtm.vo.MilkyTime;
	import com.boxedfolder.rtm.vo.MilkyTimezone;

	/**
	 * Serializes data from xml to vo.
	 *  
	 * @author Heiko Dreyer
	 * 
	 */	
	public final class Serializer
	{
		//--------------------------------------------------------------------------
		// contacts
		//--------------------------------------------------------------------------
		/**
		 * Serializes contact data in xml format into a vo.
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function contactXmlToVo(data:XML):MilkyContact
		{
			var contact:MilkyContact = new MilkyContact();
			contact.id = uint(data.contact.@id);
			contact.username = String(data.contact.@username);
			contact.fullname = String(data.contact.@fullname);
				
			return contact;
		}
		
		/**
		 * Serializes a list of contact data into an array of vos.
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function contactListXmlToVo(data:XML):Array
		{
			var array:Array = [];
			var contact:MilkyContact
			
			for each(var item:XML in data.contacts.children())
			{
				contact = new MilkyContact();
				contact.id = uint(item.@id);
				contact.username = String(item.@username);
				contact.fullname = String(item.@fullname);
				
				array.push(contact);
			}
			
			return array;
		}
		
		//--------------------------------------------------------------------------
		// settings
		//--------------------------------------------------------------------------
		/**
		 * Serializes settings into a vo.
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function settingsXmlToVo(data:XML):MilkySettings
		{
			var settings:MilkySettings = new MilkySettings();
			settings.timezone = String(data.settings.timezone);
			settings.dateformat = uint(data.settings.dateformat);
			settings.timeformat = uint(data.settings.timeformat);
			settings.defaultList = String(data.settings.defaultlist)
			settings.language = String(data.settings.language);
			
			return settings;
		}
		
		//--------------------------------------------------------------------------
		// timezones
		//--------------------------------------------------------------------------
		/**
		 * Serializes timezone xml into an array of vos.
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function timezoneListXmlToVo(data:XML):Array
		{
			var array:Array = [];
			var ts:MilkyTimezone;
			
			for each(var item:XML in data.timezones.children())
			{
				ts = new MilkyTimezone();
				ts.id = uint(item.@id);
				ts.name = String(item.@name);
				ts.offset = Number(item.@offset);
				ts.currentOffset = Number(item.@dst);
				
				array.push(ts);
			}
			
			return array;
		}
		
		//--------------------------------------------------------------------------
		// time
		//--------------------------------------------------------------------------
		/**
		 * Serializes time into a vo.
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function timeXmlToVo(data:XML):MilkyTime
		{
			var time:MilkyTime = new MilkyTime();
			time.timezone = String(data.time.@timezone);
			time.value = String(data.time);		
			time.precision = String(data.time.@precision);
			
			return time;
		}
		
		//--------------------------------------------------------------------------
		// locations
		//--------------------------------------------------------------------------
		/**
		 * Serializes a list of locations into an array of vos.
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function locationListXmlToVo(data:XML):Array
		{
			var array:Array = [];
			var location:MilkyLocation;

			for each(var item:XML in data.locations.children())
			{
				location = new MilkyLocation();
				location.id = uint(item.@id);
				location.name = String(item.@name);
				location.long = Number(item.@longitude);
				location.lat = Number(item.@latitude);
				location.zoom = uint(item.@zoom);
				location.address = String(item.@address);
				location.viewable = uint(item.@viewable);
				
				array.push(location);
			}
			
			return array;
		}
		
		//--------------------------------------------------------------------------
		// groups
		//--------------------------------------------------------------------------
		/**
		 * Serializes a single group xml data into a vo.
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function groupXmlToVo(data:XML):MilkyGroup
		{
			var group:MilkyGroup = new MilkyGroup();
			group.id = uint(data.group.@id);
			group.name = String(data.group.@name);
			group.contacts = [];
			
			for each(var contact:XML in data.group.contacts.children())
				group.contacts.push(contact.@id);
			
			return group;
		}
		
		/**
		 * Serializes a list of group data into an array of vos.
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function groupListXmlToVo(data:XML):Array
		{
			var array:Array = [];
			var group:MilkyGroup;
			
			for each(var item:XML in data.groups.children())
			{
				group = new MilkyGroup();
				group.id = uint(item.@id);
				group.name = String(item.@name);
				group.contacts = [];
				
				for each(var contact:XML in item.contacts.children())
					group.contacts.push(contact.@id);
					
				array.push(group);
			}
			
			return array;
		}
		
		//--------------------------------------------------------------------------
		// lists
		//--------------------------------------------------------------------------	
		/**
		 * Serializes list data into an array of vos.
		 * 
		 * @param data
		 * @return 
		 * 
		 */		
		public static function listsXmlToVo(data:XML):Array
		{
			var array:Array = [];
			var list:MilkyList;
			
			for each(var item:XML in data.lists.children())
			{
				list = new MilkyList();
				list.id = uint(item.@id);
				list.name = String(item.@name);
				list.archived = Boolean(uint(item.@archived));
				list.deleted = Boolean(uint(item.@deleted));
				list.locked = Boolean(uint(item.@locked));
				list.position = int(item.@position);
				list.smart = Boolean(uint(item.@smart));
				list.filters = [];
				
				if(item.children().length() != 0)
					for each(var filter:XML in item.children())
						list.filters.push(filter.toString());
				
				array.push(list);
			}
			
			return array;
		}
		
		/**
		 * Serializes a single list into a <code>MilkyList</code> object.
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function listXmlToVo(data:XML):MilkyList
		{
			var list:MilkyList = new MilkyList();
			
			list.id = uint(data.list.@id);
			list.name = String(data.list.@name);
			list.archived = Boolean(uint(data.list.@archived));
			list.deleted = Boolean(uint(data.list.@deleted));
			list.locked = Boolean(uint(data.list.@locked));
			list.position = int(data.list.@position);
			list.smart = Boolean(uint(data.list.@smart));
			list.filters = [];
			
			if(data.list.children().length() != 0)
				for each(var filter:XML in data.list.children())
					list.filters.push(filter.toString());
			
			return list;
		}
		
		//--------------------------------------------------------------------------
		// tasks
		//--------------------------------------------------------------------------	
		/**
		 * Serializes a List of taskseries into a <code>MilkyTaskSeries</code> object containing a <code>MilkyTask</code>
		 * 
		 * <p>
		 * For further information about RTM task management and about task series, please refer to: <br />
		 * <a href="http://www.rememberthemilk.com/services/api/tasks.rtm" target="_blank">http://www.rememberthemilk.com/services/api/tasks.rtm</a>
		 * </p>
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function taskSeriesListXmlToVo(data:XML):Array
		{
			var array:Array = [];
			var listId:uint;		
			
			for each(var list:XML in data.tasks.children())
			{
				listId = uint(list.@id);
				
				for each(var ts:XML in list.children())
				{
					array.push(createTaskSeries(ts, listId));
				}
			}
			
			return array;
		}
		
		/**
		 * Serialies one single taskseries into a <code>MilkyTaskSeries</code> object
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function taskSeriesXmlToVo(data:XML):MilkyTaskSeries
		{
			return createTaskSeries(XML(data.list.children()), uint(data.list.@id));
		}
		
		/**
		 * Util to create a <code>MilkyTastSeries</code> object.
		 *  
		 * @param data
		 * @param listId
		 * 
		 */		
		public static function createTaskSeries(data:XML, listId:uint):MilkyTaskSeries
		{
			// Serialize taskseries
			var taskseries:MilkyTaskSeries = new MilkyTaskSeries();
			taskseries.id = uint(data.@id);
			taskseries.created = String(data.@created);
			taskseries.modified = String(data.@modified);
			taskseries.name = String(data.@name);
			taskseries.source = String(data.@source);
			taskseries.url = String(data.@url);
			taskseries.locationId = uint(data.@location_id);
			taskseries.inListId = listId;
			taskseries.tags = [];
			taskseries.participants = [];
			taskseries.notes = [];
			taskseries.task = taskXmlToVo(XML(data));
			taskseries.repeatRule = String(data.rrule);
			taskseries.repeatRuleEvery = Boolean(uint(data.rrule.@every));
			
			
			if(data.tags.children().length() != 0)
				for each(var tag:XML in data.tags.children())
					taskseries.tags.push(String(tag));
			
			if(data.participant.children().length() != 0)
				for each(var participant:XML in data.participants.children())
					taskseries.participants.push(contactXmlToVo(participant));
			
			if(data.notes.children().length() != 0)
				for each(var note:XML in data.notes.children())
					taskseries.notes.push(noteXmlToVo(note));	
			
			return taskseries;
		}
		
		/**
		 * Serialies one single task into a <code>MilkyTask</code> object.
		 * Data must provide a <code>taskseries</code> node with a subnode of <code>task</code>
		 * 
		 * @param data
		 * @return 
		 * 
		 */		
		public static function taskXmlToVo(data:XML):MilkyTask
		{
			var task:MilkyTask = new MilkyTask();
			
			task.id = uint(data.task.@id);
			task.due = String(data.task.@due);
			task.hasDueTime = Boolean(uint(data.task.@has_due_time));
			task.added = String(data.task.@added);
			task.completed = String(data.task.@completed);
			task.deleted = String(data.task.@deleted);
			task.priority = uint(data.task.@priority);
			task.postponed = Boolean(uint(data.task.@postponed));
			task.estimate = String(data.task.@estimate);
			
			return task;
		}
		
		//--------------------------------------------------------------------------
		// notes
		//--------------------------------------------------------------------------
		/**
		 * Serializes xml into a <code>MilkyNote</code> vo
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function noteXmlToVo(data:XML):MilkyNote
		{
			var note:MilkyNote = new MilkyNote();
			
			note.id = uint(data.@id);
			note.created = String(data.@created);
			note.modified = String(data.@modified);
			note.title = String(data.@title);
			note.body = String(data);
			
			return note;
		}
		
		/**
		 * Serializes xml into a <code>MilkyNote</code> vo
		 *  
		 * @param data
		 * @return 
		 * 
		 */		
		public static function nestedNoteXmlToVo(data:XML):MilkyNote
		{
			return noteXmlToVo(XML(data.note));
		}
	}
}