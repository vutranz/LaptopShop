package vn.beginner.laptopshop.service;

import org.springframework.data.domain.Sort;

import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import vn.beginner.laptopshop.domain.*;
import vn.beginner.laptopshop.repository.*;
import vn.beginner.laptopshop.service.specification.ProductSpec;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            UserService userService,
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Product CreateProduct(Product product) {
        return productRepository.save(product);
    }

    private Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public Page<Product> getAllProductsWithSpec(Pageable pageable, String name, Double minPrice, Double maxPrice,
            List<String> brands, List<String> usages, List<String> prices, String sortPrice) {
        Specification<Product> spec = ProductSpec.filterProducts(name, minPrice, maxPrice, brands, usages, prices);

        if (sortPrice != null) {
            Sort sort = sortPrice.equals("asc") ? Sort.by("price").ascending() : Sort.by("price").descending();
            pageable = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), sort);
        }

        return productRepository.findAll(spec, pageable);
    }

    public Page<Product> getAllProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    public Product getProductById(long id) {
        return productRepository.findById(id).orElse(null);
    }

    public void deleteProduct(long id) {
        productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product product = productOptional.get();
                Cart cart = this.cartRepository.findByUser(user);

                // Chỉ tạo giỏ hàng khi có sản phẩm được thêm
                if (cart == null) {
                    cart = new Cart();
                    cart.setUser(user);
                    cart.setSum(0); // Ban đầu giỏ hàng rỗng
                    cart = this.cartRepository.save(cart);
                }

                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
                if (oldDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setPrice(product.getPrice());
                    cartDetail.setQuantity(1);
                    this.cartDetailRepository.save(cartDetail);

                    // Cập nhật số lượng sản phẩm trong giỏ hàng
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldDetail);
                }
            }
        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptinal = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptinal.isPresent()) {
            CartDetail cartDetail = cartDetailOptinal.get();
            Cart currentCart = cartDetail.getCart();
            this.cartDetailRepository.deleteById(cartDetailId);

            if (currentCart.getSum() > 1) {
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                this.cartDetailRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public Cart findCartById(Long cartId) {
        return this.cartRepository.findById(cartId).orElse(null);
    }


    public void handlePlaceOrder(User user, HttpSession session) {

        // step 1: getCartByUser

        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {
                // cretae order
                Order order = new Order();
                order.setUser(user);
                order.setTotalPrice(order.getTotalPrice());
                order.setStatus("Pending");
                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderdetail
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }
                // step 2: delete cart_detail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                this.cartRepository.deleteById(cart.getId());

                // step 3: update session
                session.setAttribute("sum", 0);
            }
        }

    }

    public int getAllProductCount() {
        List<Product> products = this.productRepository.findAll();
        return products.size();
    }

}
