package events.utils;
import javax.crypto.*;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.security.InvalidKeyException;


//Deprecated
//!!!  DO NOT Use  !!!
//Methods not working
public class Encrypter {

    private static SecretKey secretKey;
    private static Cipher cipher;

    public Encrypter(){
        try{
        KeyGenerator keyGenerator = KeyGenerator.getInstance("DES");
        secretKey = keyGenerator.generateKey();
        Cipher cipher;
        cipher = Cipher.getInstance("DES");

        }catch (Exception e){
            System.out.print(e.getMessage());
        }
    }

    public static String encript(Integer number) throws InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        ByteBuffer byteBuffer = ByteBuffer.allocate(4);
        byteBuffer.putInt(number);
        byte[] text = byteBuffer.array();
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] textEncripted = cipher.doFinal(text);
        return new String(textEncripted);
    }

    public static Integer decript(String text) throws InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        byte[] textDecrypted = cipher.doFinal(text.getBytes());
        return new BigInteger(textDecrypted).intValue();
    }
}
