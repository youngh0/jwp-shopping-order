package cart.application.coupon;

import cart.application.coupon.dto.MemberCouponDto;
import cart.domain.repository.coupon.CouponRepository;
import cart.ui.MemberAuth;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional(readOnly = true)
public class CouponReadService {

    private final CouponRepository couponRepository;

    public CouponReadService(final CouponRepository couponRepository) {
        this.couponRepository = couponRepository;
    }

    public List<CouponResultDto> findByMember(MemberAuth memberAuth) {
        final List<MemberCouponDto> coupons = couponRepository.findByMemberId(memberAuth.getId());

        return coupons.stream()
                .map(CouponResultDto::from)
                .collect(Collectors.toUnmodifiableList());
    }

}