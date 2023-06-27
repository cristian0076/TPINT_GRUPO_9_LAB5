package excepciones;

public class AtSymbolNotFoundException extends Exception {

	public AtSymbolNotFoundException() {
        super();
    }
	
	public AtSymbolNotFoundException(String mail) {
        super(mail);
    }
	
	public void validateAtSymbol(String text) throws AtSymbolNotFoundException {
        if (!text.contains("@")) {
            throw new AtSymbolNotFoundException("El texto no contiene el s�mbolo '@': " + text);
        }
    }
}
