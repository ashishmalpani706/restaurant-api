package sourcecode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sourcecode.constants.APIConstants;
import sourcecode.model.Restaurant;
import sourcecode.repository.RestaurantRepository;

@RestController
@RequestMapping("/restaurants")
public class RestaurantController {

    @Autowired
    private RestaurantRepository repository;

    @GetMapping("/all-restaurants")
    public ResponseEntity<Iterable<Restaurant>> getAllRestaurants() {
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    @GetMapping("/find-restaurant/{restaurantId}")
    public ResponseEntity<?> findRestaurant(@PathVariable int restaurantId) {

        return repository.existsById(restaurantId) ?
                new ResponseEntity<>(repository.findById(restaurantId), HttpStatus.OK) :
                new ResponseEntity<>(APIConstants.RECORD_NOT_FOUND, HttpStatus.NOT_FOUND);
    }

    @PostMapping("/add-new-restaurant")
    public ResponseEntity addNewRestaurant(@RequestBody Restaurant restaurant) {
        if (!repository.existsById(restaurant.getRestaurant_id())) {
            repository.save(restaurant);
            return new ResponseEntity<>(APIConstants.INSERTION_SUCCESSFUL, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(APIConstants.INSERTION_FAILED, HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/delete-restaurant/{restaurantId}")
    public ResponseEntity deleteRestaurant(@PathVariable int restaurantId) {
        if (repository.existsById(restaurantId)) {
            repository.deleteById(restaurantId);
            return new ResponseEntity<>(APIConstants.DELETION_SUCCESSFUL, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(APIConstants.RECORD_NOT_FOUND, HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/update-restaurant")
    public ResponseEntity<String> updateMenu(@RequestBody Restaurant restaurant) {
        if (repository.existsById(restaurant.getRestaurant_id())) {
            repository.save(restaurant);
            return new ResponseEntity<>(APIConstants.UPDATE_SUCCESSFUL, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(APIConstants.RECORD_NOT_FOUND, HttpStatus.NOT_FOUND);
        }
    }
}
