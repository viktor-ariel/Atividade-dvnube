public class Utils {
    
    public static String generateRandomString(Integer length) {
        final String characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        String result = '';
        while (result.length() < length) {
            Integer index = Math.mod(Math.abs(Crypto.getRandomInteger()), characters.length());
            result += characters.substring(index, index+1);
        }
        return result;
    }
}