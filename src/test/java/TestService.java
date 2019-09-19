import org.apache.commons.lang.time.DateFormatUtils;
import org.junit.jupiter.api.Test;

import java.util.Date;

public class TestService {

    @Test
    public void test1() {
        String date =  DateFormatUtils.format(new Date(), "yyyy/MM/dd");
        System.out.println(date);
    }

}
