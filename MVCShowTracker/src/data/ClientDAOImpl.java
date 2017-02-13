package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Party;
import entities.TVShow;
import entities.User;
import entities.UserEpisode;

@Repository
@Transactional
public class ClientDAOImpl implements ClientDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public User getUser(String username, String password) {
		try {
			String queryString = "select u from User u where u.username = :username AND u.password = :password";
			User user = em.createQuery(queryString, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
			System.out.println(user);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public User getUserByUserId(int id) {
		try {
			String queryString = "select u from User u where u.id = :id";
			User user = em.createQuery(queryString, User.class).setParameter("id", id).getSingleResult();
			System.out.println(user);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public User createUser(User user) {
		try {
			em.persist(user);
			em.flush();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public UserEpisode watchEpisode(UserEpisode ue) {
		try {
			// if (ue.getWatched() == 0) {
			// ue.setWatched(1);
			// } else if (ue.getWatched() == 1) {
			// ue.setWatched(0);
			// }
			em.persist(ue);
			em.flush();
			System.out.println(ue);
			return ue;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> getAllShows() {
		String queryString = "SELECT tvs FROM TVShow tvs";
		try {
			List<TVShow> tvShows = em.createQuery(queryString, TVShow.class).getResultList();
			// System.out.println(results);
			return tvShows;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	// SPLIT UP WORK HERE!!

	@Override
	public List<TVShow> getUserShows(int userId) {
		String queryString = "SELECT u FROM User u WHERE id = :id";
		try {
			User user = em.createQuery(queryString, User.class).setParameter("id", userId).getSingleResult();
			List<TVShow> userShows = user.getTvShows();
			// System.out.println(results);
			return userShows;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> addUserShow(int userId, int showId) {
		String queryString = "SELECT tvs FROM TVShow tvs WHERE id = :id";
		try {
			TVShow tvs = em.createQuery(queryString, TVShow.class).setParameter("id", showId).getSingleResult();
			User user = getUserByUserId(userId);
			user.getTvShows().add(tvs);
			em.persist(user);
			em.flush();
			return user.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> addMultipleUserShows(int userId, int... showIds) {
		try {
			User user = getUserByUserId(userId);
			String queryString = "SELECT tvs FROM TVShow tvs WHERE id = :id";
			for (int i : showIds) {
				TVShow tvs = em.createQuery(queryString, TVShow.class).setParameter("id", i).getSingleResult();
				user.getTvShows().add(tvs);
			}
			em.persist(user);
			// em.flush();
			return user.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> removeUserShow(int userId, int showId) {
		String queryString = "SELECT tvs FROM TVShow tvs WHERE id = :id";
		try {
			TVShow tvs = em.createQuery(queryString, TVShow.class).setParameter("id", showId).getSingleResult();
			User user = getUserByUserId(userId);
			user.getTvShows().remove(tvs);
			em.persist(user);
			em.flush();
			return user.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> removeMultipleUserShows(int userId, int... showIds) {
		try {
			User user = getUserByUserId(userId);
			String queryString = "SELECT tvs FROM TVShow tvs WHERE id = :id";
			for (int i : showIds) {
				TVShow tvs = em.createQuery(queryString, TVShow.class).setParameter("id", i).getSingleResult();
				user.getTvShows().remove(tvs);
			}
			em.persist(user);
			em.flush();
			return user.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Party addParty(Party party) {
		try {
			em.persist(party);
			em.flush();
			// System.out.println(party);
			return party;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Party addUsersToParty(int partyId, int... userIds) {
		try {
			Party party = em.find(Party.class, partyId);
			if (party == null) {
				return null;
			} else {
				if (party.getUsers() == null) {
					party.setUsers(new ArrayList<User>());
				}
				for (int id : userIds) {
					party.getUsers().add(em.find(User.class, id));
				}
				em.persist(party);
//				em.flush();
				return party;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Boolean deleteParty(int partyId, int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean deleteParty(int partyId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TVShow> addTVShowsToParty(int partyId, int... showIds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Party> getAllParties() {
		// TODO Auto-generated method stub
		return null;
	}

}
