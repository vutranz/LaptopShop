package vn.beginner.laptopshop.service.specification;

import java.util.ArrayList;
import java.util.List;
import org.springframework.data.jpa.domain.Specification;
import jakarta.persistence.criteria.*;
import vn.beginner.laptopshop.domain.Product;
import vn.beginner.laptopshop.domain.Product_;

public class ProductSpec {

    public static Specification<Product> filterProducts(String name, Double minPrice, Double maxPrice,
            List<String> brands, List<String> usages, List<String> prices) {
        return (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (name != null && !name.isEmpty()) {
                predicates.add(criteriaBuilder.like(root.get("name"), "%" + name + "%"));
            }

            if (minPrice != null) {
                predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("price"), minPrice));
            }
            if (maxPrice != null) {
                predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get("price"), maxPrice));
            }

            if (brands != null && !brands.isEmpty()) {
                predicates.add(root.get("factory").in(brands));
            }

            if (usages != null && !usages.isEmpty()) {
                predicates.add(root.get("target").in(usages));
            }

            if (prices != null && !prices.isEmpty()) {
                List<Predicate> pricePredicates = new ArrayList<>();
                for (String price : prices) {
                    switch (price) {
                        case "under10":
                            pricePredicates.add(criteriaBuilder.lessThan(root.get("price"), 10_000_000));
                            break;
                        case "10to15":
                            pricePredicates.add(criteriaBuilder.between(root.get("price"), 10_000_000, 15_000_000));
                            break;
                        case "15to20":
                            pricePredicates.add(criteriaBuilder.between(root.get("price"), 15_000_000, 20_000_000));
                            break;
                        case "over20":
                            pricePredicates.add(criteriaBuilder.greaterThan(root.get("price"), 20_000_000));
                            break;
                    }
                }
                predicates.add(criteriaBuilder.or(pricePredicates.toArray(new Predicate[0])));
            }

            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }

}