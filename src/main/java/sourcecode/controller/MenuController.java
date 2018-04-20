package sourcecode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sourcecode.constants.APIConstants;
import sourcecode.model.Menu;
import sourcecode.repository.MenuRepository;

@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuRepository repository;

    @GetMapping("/all-menus")
    public ResponseEntity<Iterable<Menu>> getAllMenus() {
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    @GetMapping("/find-menu/{menuId}")
    public ResponseEntity<?> findMenu(@PathVariable int menuId) {

        return repository.existsById(menuId) ?
                new ResponseEntity<>(repository.findById(menuId), HttpStatus.OK) :
                new ResponseEntity<>(APIConstants.RECORD_NOT_FOUND, HttpStatus.NOT_FOUND);
    }

    @PostMapping("/add-new-menu")
    public ResponseEntity<String> addNewMenu(@RequestBody Menu restaurant) {
        if (!repository.existsById(restaurant.getMenu_id())) {
            repository.save(restaurant);
            return new ResponseEntity<>(APIConstants.INSERTION_SUCCESSFUL, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(APIConstants.INSERTION_FAILED, HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/delete-menu/{menuId}")
    public ResponseEntity<String> deleteMenu(@PathVariable int menuId) {
        if (repository.existsById(menuId)) {
            repository.deleteById(menuId);
            return new ResponseEntity<>(APIConstants.DELETION_SUCCESSFUL, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(APIConstants.RECORD_NOT_FOUND, HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/update-menu")
    public ResponseEntity<String> updateMenu(@RequestBody Menu menu) {
        if (repository.existsById(menu.getMenu_id())) {
            repository.save(menu);
            return new ResponseEntity<>(APIConstants.UPDATE_SUCCESSFUL, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(APIConstants.RECORD_NOT_FOUND, HttpStatus.NOT_FOUND);
        }
    }
}
