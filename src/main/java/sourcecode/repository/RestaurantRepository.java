package sourcecode.repository;

import org.springframework.data.repository.CrudRepository;
import sourcecode.model.Restaurant;


public interface RestaurantRepository extends CrudRepository<Restaurant, Integer> {
}
