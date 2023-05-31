package cart.ui;

public class MemberAuth {

    private final String email;
    private final String password;

    public MemberAuth(final String email, final String password) {
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

}