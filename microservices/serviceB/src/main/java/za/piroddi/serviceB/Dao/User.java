package za.piroddi.serviceB.Dao;

import lombok.Builder;
import lombok.Data;

@Data
public class User {

    private String firstName;
    private String lastName;
    private String email;

    @Builder
    public User(String firstName, String lastName, String email) {
        setFirstName(firstName);
        setLastName(lastName);
        setEmail(email);
    }
}
