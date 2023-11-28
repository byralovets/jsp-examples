package by.ralovets.examples.exception;

public class GenericHttpException extends RuntimeException {

    private final int code;
    private final String message;

    public GenericHttpException(String message, int code) {
        super(message);
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
