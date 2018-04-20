package sourcecode.model;

import javax.persistence.*;
import java.sql.Time;


@Entity
@Table(name = "menu")
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int menu_id;
    private int restaurant_id;

    @Enumerated(value = EnumType.STRING)
    private MenuType menu_type;
    private Time start_time;
    private Time end_time;

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public int getRestaurant_id() {
        return restaurant_id;
    }

    public void setRestaurant_id(int restaurant_id) {
        this.restaurant_id = restaurant_id;
    }

    public MenuType getMenu_type() {
        return menu_type;
    }

    public void setMenu_type(MenuType menu_type) {
        this.menu_type = menu_type;
    }

    public Time getStart_time() {
        return start_time;
    }

    public void setStart_time(Time start_time) {
        this.start_time = start_time;
    }

    public Time getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Time end_time) {
        this.end_time = end_time;
    }

    public enum MenuType {
        BREAKFAST, LUNCH, DINNER, SNACKS, DESSERTS
    }
}
