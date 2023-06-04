package cart.domain;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

class PointHistoryTest {

    @Test
    void calculatePoint() {
        PointHistory pointHistory = new PointHistory(1L, 500, 300);
        Assertions.assertThat(pointHistory.calculatePoint()).isEqualTo(200);
    }
}
