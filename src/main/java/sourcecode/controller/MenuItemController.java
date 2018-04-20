package sourcecode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sourcecode.constants.APIConstants;
import sourcecode.model.MenuItem;
import sourcecode.repository.MenuItemRepository;


@RestController
@RequestMapping("/menu-items")
public class MenuItemController {

    @Autowired
    private MenuItemRepository repository;

    @GetMapping("/all-menu-items")
    public ResponseEntity<Iterable<MenuItem>> getAllMenuItems() {
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    @GetMapping("/find-menu-item/{menuId}")
    public ResponseEntity<?> findMenuItem(@PathVariable int menuId) {

        return repository.existsById(menuId) ?
                new ResponseEntity<>(repository.findById(menuId), HttpStatus.OK) :
                new ResponseEntity<>(APIConstants.RECORD_NOT_FOUND, HttpStatus.NOT_FOUND);
    }

    @PostMapping("/add-new-menu-item")
    public ResponseEntity<String> addNewMenuItem(@RequestBody MenuItem menuItem) {
        if (!repository.existsById(menuItem.getItem_id())) {
            repository.save(menuItem);
            return new ResponseEntity<>(APIConstants.INSERTION_SUCCESSFUL, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(APIConstants.INSERTION_FAILED, HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete-menu-item/{menuId}")
    public ResponseEntity<String> deleteMenuItem(@PathVariable int menuId) {
        try {
            repository.deleteById(menuId);
            return new ResponseEntity<>(APIConstants.DELETION_SUCCESSFUL, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(APIConstants.RECORD_NOT_FOUND, HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/update-menu-item")
    public ResponseEntity<String> updateMenu(@RequestBody MenuItem menu) {
        if (repository.existsById(menu.getItem_id())) {
            repository.save(menu);
            return new ResponseEntity<>(APIConstants.UPDATE_SUCCESSFUL, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(APIConstants.RECORD_NOT_FOUND, HttpStatus.NOT_FOUND);
        }
    }
}
