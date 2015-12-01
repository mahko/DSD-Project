package gradlemvc.pingpop.core;

import java.util.List;

public class EventManager implements IEventManager{

	@Override
	public List<Event> getHostedEvents(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Event> getInvitedEvents(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateEvent(Event event) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteEvent(String eventId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean createEvent(Event event) {
		// TODO Auto-generated method stub
		//save event into event list
		//save event into invitation list of participant
		return false;
	}
	
	@Override
	public boolean rejectEvent(String eventId) {
		return false;
	}

}
