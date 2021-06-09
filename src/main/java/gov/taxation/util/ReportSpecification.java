package gov.taxation.util;

import gov.taxation.entity.Report;
import gov.taxation.entity.ReportStatus;
import gov.taxation.entity.User;
import gov.taxation.entity.UserType;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.*;

public class ReportSpecification {

    /**
     * Create spec if user name
     *
     * @param name User firstName or lastName
     * @return predicate
     */
    public static Specification<Report> hasUserName(String name) {

        return new Specification<Report>() {
            @Override
            public Predicate toPredicate(Root<Report> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                Join<Report, User> joinedUser = root.join("user");

                return cb.or(cb.like(joinedUser.get("firstName"), name), cb.like(joinedUser.get("lastName"), name));
            }
        };

    }

    public static Specification<Report> hasUser(User user) {

        return new Specification<Report>() {
            @Override
            public Predicate toPredicate(Root<Report> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Join<Report, User> joinedUser = root.join("user");
                return cb.equal(joinedUser.get("id"), user.getId());
            }
        };

    }

    public static Specification<Report> hasUserType(UserType userType) {

        return new Specification<Report>() {
            @Override
            public Predicate toPredicate(Root<Report> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                Join<Report, User> joinedUser = root.join("user");

                Join<User, UserType> joinedType = joinedUser.join("type");

                return cb.equal(joinedType.get("id"), userType.getId());
            }
        };

    }

    public static Specification<Report> hasStatus(ReportStatus status) {
        return new Specification<Report>() {
            @Override
            public Predicate toPredicate(Root<Report> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                return cb.equal(root.get("status"), status);
            }
        };
    }

}
