public class HelloWorld {
    public static String hello(String name) {
	if (name == null || "".equals(name)){
		return "Hello, World!";
	}
        return "Hello, " + name + "!";
    }
}