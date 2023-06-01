package cart.ui.point;

import cart.application.service.point.PointReadService;
import cart.domain.Member;
import cart.ui.point.dto.PointResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/point")
public class PointReadController {

    private final PointReadService pointReadService;

    public PointReadController(final PointReadService pointReadService) {
        this.pointReadService = pointReadService;
    }

    @GetMapping
    public ResponseEntity<PointResponse> findPointByMember(final Member member) {
        final PointResponse pointResponse = pointReadService.findPointByMember(member);
        return ResponseEntity.ok(pointResponse);
    }
}