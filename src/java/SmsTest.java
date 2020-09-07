import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Random;
import javax.swing.JOptionPane;
 
public class SmsTest {
    public static void main(String...args)
    {       
//        String apiKey="R3XS9GB7Q796RDOBKY80C6RBU22ER8CN";
//        String secretKey="H8WSMPFEJ1BULP3V";
            String sendSms1;
            sendSms1 = sendSms();
            System.out.println(sendSms1);
    }
   
    
	public static String sendSms() {
		try {
                    int otp;
                    Random rand=new Random();
                    otp=rand.nextInt(999999);
                    String name="loknath";
                    String number="9981782556";
			// Construct data
			String apiKey = "apikey=" + "T8rYTIA1XG0-lq409PZlTEfxgQKS9QupoSOfUw57BQ";
			String message = "&message=" + "hey "+name+" your otp is "+otp;
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + number;
			
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			JOptionPane.showMessageDialog(null,"OTP is sent succesfully");
			return stringBuffer.toString();
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			JOptionPane.showMessageDialog(null,"Error SMS "+e);
			return "Error "+e;
		}
	}
}
    