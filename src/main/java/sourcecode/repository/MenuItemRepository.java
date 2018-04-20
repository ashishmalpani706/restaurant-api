package sourcecode.repository;

import org.springframework.data.repository.CrudRepository;
import sourcecode.model.MenuItem;


public interface MenuItemRepository extends CrudRepository<MenuItem, Integer> {
}
