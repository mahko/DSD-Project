/**
 * create by Yewon Kim*
 * */
package gradlemvc.pingpop.core;

import java.util.List;

public interface IEventManager {
	public List<Event> getHostedEvents(String userId); //CREATED
	public List<Event> getInvitedEvents(String userId); //CREATED
	public boolean updateEvent(Event event);
	public boolean deleteEvent(String eventId);
	public boolean createEvent(Event event);
	public boolean rejectEvent(String eventId);
}
