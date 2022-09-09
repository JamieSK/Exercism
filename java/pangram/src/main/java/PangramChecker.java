public class PangramChecker {

	public boolean isPangram(String input) {
		String[] alphabet = "abcdefghijklmnopqrstuvwxyz".split("");
		String[] inputSplit = input.toLowerCase().replaceAll("[^a-z]", "").split("");
		
		for (String letter: alphabet) {
			if (java.util.Arrays.asList(inputSplit).contains(letter)) {
				continue;
			} else {
				return false;
			}
		}
		return true;
			
	}

}