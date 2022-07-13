public class OTPGenerator {
   
@InvocableMethod(label='Generate OTP'
                 description='This method will be generating the OTP for users to login'
                 category='OTP')

    public static List<String> generateOTP(){
        List<String> responseList = new List<String>();
        String randomIntegerString = string.valueOf(Math.abs(Crypto.getRandomInteger()));
        //System.debug(randomIntegerString);
        String otp = randomIntegerString.substring(0, 6);
        //System.debug(otp);
        responseList.add(otp);
        return responseList;
    }
}