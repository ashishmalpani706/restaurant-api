package sourcecode.repository;

import org.springframework.data.repository.CrudRepository;
import sourcecode.model.Menu;


public interface MenuRepository extends CrudRepository<Menu, Integer> {
}
