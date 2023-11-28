package by.ralovets.examples.exception;

import jakarta.servlet.http.HttpServletResponse;

public class BadRequestException extends GenericHttpException {

    private static final int code = HttpServletResponse.SC_BAD_REQUEST;

    public BadRequestException(String message) {
        super(message, code);
    }
}
