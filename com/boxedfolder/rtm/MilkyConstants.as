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

package com.boxedfolder.rtm
{
	/**
	 * MilkyConsts class is just responsible
	 * for holding all API-Method names etc.
	 * 
	 * @author Heiko Dreyer
	 * 
	 */	
	public final class MilkyConstants
	{
		// Permissions
		public static const PERMISSION_READ:String = "read";
		public static const PERMISSION_WRITE:String = "write";
		public static const PERMISSION_DELETE:String = "delete";
		
		// Data format
		public static const ARRAY_FORMAT:String = "array";
		public static const XML_FORMAT:String = "xml";
		
		// Priority
		public static const PRIORITY_UP:String = "up";
		public static const PRIORITY_DOWN:String = "down";
		
		// Methods
		// testing
		public static const TEST_ECHO:String = "rtm.test.echo";
		public static const TEST_LOGIN:String = "rtm.test.login";
		
		// reflection
		public static const GET_METHOD_INFO:String = "rtm.reflection.getMethodInfo";
		public static const GET_METHODS:String = "rtm.reflection.getMethods";
		
		// auth 
		public static const GET_FROB:String = "rtm.auth.getFrob";
		public static const GET_TOKEN:String = "rtm.auth.getToken";
		public static const CHECK_TOKEN:String = "rtm.auth.checkToken";
		
		// contacts
		public static const ADD_CONTACT:String = "rtm.contacts.add";
		public static const DELETE_CONTACT:String = "rtm.contacts.delete";
		public static const GET_CONTACT_LIST:String = "rtm.contacts.getList";
		
		// groups
		public static const ADD_GROUP:String = "rtm.groups.add";
		public static const ADD_CONTACT_TO_GROUP:String = "rtm.groups.addContact";
		public static const DELETE_GROUP:String = "rtm.groups.delete";
		public static const GET_GROUP_LIST:String = "rtm.groups.getList";
		public static const REMOVE_CONTACT_FROM_GROUP:String = "rtm.groups.removeContact";
		
		// timeline
		public static const CREATE_TIMELINE:String = "rtm.timelines.create";
		
		// settings
		public static const GET_SETTINGS:String = "rtm.settings.getList";
		
		// timezones
		public static const GET_TIMEZONES:String = "rtm.timezones.getList";
		
		// time
		public static const CONVERT_TIME:String = "rtm.time.convert";
		public static const PARSE_TIME:String = "rtm.time.parse";
		
		// locations
		public static const GET_LOCATIONS:String = "rtm.locations.getList";
		
		// transactions
		public static const UNDO_TRANSACTION:String = "rtm.transactions.undo";
		
		// lists
		public static const GET_LISTS:String = "rtm.lists.getList";
		public static const ADD_LIST:String = "rtm.lists.add";
		public static const DELETE_LIST:String = "rtm.lists.delete";
		public static const ARCHIVE_LIST:String = "rtm.lists.archive";
		public static const UNARCHIVE_LIST:String = "rtm.lists.unarchive";
		public static const SET_DEFAULT_LIST:String = "rtm.lists.setDefaultList";
		public static const SET_LIST_NAME:String = "rtm.lists.setName";
		
		// tasks
		public static const ADD_TASK:String = "rtm.tasks.add";
		public static const ADD_TASK_TAGS:String = "rtm.tasks.addTags";
		public static const SET_TASK_COMPLETE:String = "rtm.tasks.complete";
		public static const DELETE_TASK:String = "rtm.tasks.delete";
		public static const GET_TASK_LIST:String = "rtm.tasks.getList";
		public static const MOVE_TASK_PRIORITY:String = "rtm.tasks.movePriority";
		public static const MOVE_TASK_TO_LIST:String = "rtm.tasks.moveTo";
		public static const POSTPONE_TASK:String = "rtm.tasks.postpone";
		public static const REMOVE_TAGS:String = "rtm.tasks.removeTags";
		public static const SET_TASK_DUE_DATE:String = "rtm.tasks.setDueDate";
		public static const SET_TASK_ESTIMATE:String = "rtm.tasks.setEstimate";
		public static const SET_TASK_LOCATION:String = "rtm.tasks.setLocation";
		public static const SET_TASK_NAME:String = "rtm.tasks.setName";
		public static const SET_TASK_PRIORITY:String = "rtm.tasks.setPriority";		
		public static const SET_TASK_RECURRENCE:String = "rtm.tasks.setRecurrence";
		public static const SET_TASK_TAGS:String = "rtm.tasks.setTags";
		public static const SET_TASK_URL:String = "rtm.tasks.setURL";
		public static const SET_TASK_UNCOMPLETE:String = "rtm.tasks.uncomplete";
		
		// notes
		public static const ADD_NOTE:String = "rtm.tasks.notes.add";
		public static const DELETE_NOTE:String = "rtm.tasks.notes.delete";
		public static const EDIT_NOTE:String = "rtm.tasks.notes.edit";
	}
}